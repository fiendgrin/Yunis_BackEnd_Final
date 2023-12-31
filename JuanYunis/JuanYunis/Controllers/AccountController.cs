﻿using JuanYunis.Areas.Manage.ViewModels;
using JuanYunis.DataAccessLayer;
using JuanYunis.Models;
using JuanYunis.ViewModels;
using JuanYunis.ViewModels.AccountVMs;
using JuanYunis.ViewModels.BasketVMs;
using MailKit.Net.Smtp;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Options;
using MimeKit;
using Newtonsoft.Json;
using System.Data;

namespace JuanYunis.Controllers
{
    public class AccountController : Controller
    {
        private readonly AppDbContext _context;
        private readonly UserManager<AppUser> _userManager;
        private readonly RoleManager<IdentityRole> _roleManager;
        private readonly SignInManager<AppUser> _signInManager;
        private readonly IConfiguration _config;
        private readonly SmtpSetting _smtpSetting;
        private readonly IWebHostEnvironment _env;

        public AccountController(AppDbContext context,UserManager<AppUser> userManager, RoleManager<IdentityRole> roleManager,
            SignInManager<AppUser> signInManager, IConfiguration config, IOptions<SmtpSetting> options, IWebHostEnvironment env)
        {
            _context = context;
            _userManager = userManager;
            _roleManager = roleManager;
            _signInManager = signInManager;
            _config = config;
            _smtpSetting = options.Value;
            _env = env;
        }
        public IActionResult Register()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Register(RegisterVM registerVM) 
        {
            if (!ModelState.IsValid)
            {
                return View(registerVM);
            }

            AppUser appUser = new AppUser
            {
                Name = registerVM.Name,
                SurName = registerVM.SurName,
                UserName = registerVM.UserName,
                Email = registerVM.Email,
                IsActive = true
            };

            IdentityResult identityResult = await _userManager.CreateAsync(appUser, registerVM.Password);

            if (!identityResult.Succeeded)
            {
                foreach (IdentityError identityError in identityResult.Errors)
                {
                    ModelState.AddModelError("", identityError.Description);
                }
                return View(registerVM);
            }

            await _userManager.AddToRoleAsync(appUser, "Member");

            string templateFullPath = Path.Combine(_env.WebRootPath, "templates", "EmailConfirm.html");
            string templateContent = await System.IO.File.ReadAllTextAsync(templateFullPath);

            string token = await _userManager.GenerateEmailConfirmationTokenAsync(appUser);
            string url = Url.Action("EmailConfirm", "Account", new { Id = appUser.Id, token = token }, Request.Scheme, Request.Host.ToString());

            templateContent = templateContent.Replace("{{url}}", url);

            MimeMessage mimeMessage = new MimeMessage();
            mimeMessage.From.Add(MailboxAddress.Parse(_smtpSetting.Email));
            mimeMessage.To.Add(MailboxAddress.Parse(appUser.Email));
            mimeMessage.Subject = "Email Confirmation";
            mimeMessage.Body = new TextPart(MimeKit.Text.TextFormat.Html)
            {
                Text = templateContent
            };

            using (SmtpClient client = new SmtpClient())
            {
                await client.ConnectAsync(_smtpSetting.Host, _smtpSetting.Port, MailKit.Security.SecureSocketOptions.StartTls);
                await client.AuthenticateAsync(_smtpSetting.Email, _smtpSetting.Password);
                await client.SendAsync(mimeMessage);
                await client.DisconnectAsync(true);
            }

            return RedirectToAction(nameof(Login));
        }

        public IActionResult Login()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Login(LoginVM loginVM)
        {
            if (!ModelState.IsValid)
            {
                return View(loginVM);
            }

            AppUser appUser = await _userManager.Users
                .Include(u => u.Baskets.Where(b => b.IsDeleted == false))
                .FirstOrDefaultAsync(u => u.NormalizedEmail == loginVM.Email.Trim().ToUpperInvariant());
            if (appUser == null)
            {
                ModelState.AddModelError("", "Email or Password are Incorrect");
                return View(loginVM);
            }

            IList<string> roles = await _userManager.GetRolesAsync(appUser);

            if (!roles.Any(r => r == "Member"))
            {
                ModelState.AddModelError("", "Email or Password are Incorrect");
                return View(loginVM);
            }

            if (!appUser.EmailConfirmed)
            {
                ModelState.AddModelError("", "Confirm Your Email");
                return View(loginVM);
            }

            Microsoft.AspNetCore.Identity.SignInResult signInResult = await _signInManager
                .PasswordSignInAsync(appUser, loginVM.Password, loginVM.RememberMe, true);


            if (appUser.LockoutEnd != null && (appUser.LockoutEnd - DateTime.Now).Value.Minutes > 0)
            {
                int date = (appUser.LockoutEnd - DateTime.Now).Value.Minutes;

                ModelState.AddModelError("", $"Your Account is blocked ({date} minutes left)");
                return View(loginVM);
            }

            if (!signInResult.Succeeded)
            {
                ModelState.AddModelError("", "Email or Password are Incorrect");
                return View(loginVM);
            }

            if (appUser.Baskets != null && appUser.Baskets.Count() > 0)
            {
                List<BasketVM> basketVMs = new List<BasketVM>();

                foreach (Basket basket in appUser.Baskets)
                {
                    BasketVM basketVM = new BasketVM
                    {
                        Id = (int)basket.ProductId,
                        Count = basket.Count
                    };
                    basketVMs.Add(basketVM);
                }

                string cookie = JsonConvert.SerializeObject(basketVMs);
                Response.Cookies.Append("basket", cookie);

            }

            return RedirectToAction("Index", "Home");
        }

        //3.Logout
        public async Task<IActionResult> Logout()
        {
            await _signInManager.SignOutAsync();
            return RedirectToAction(nameof(Login));
        }

        public async Task<IActionResult> EmailConfirm(string id, string token)
        {
            if (string.IsNullOrWhiteSpace(id))
            {
                return BadRequest();
            }

            AppUser appUser = await _userManager.FindByIdAsync(id);

            if (appUser == null)
            {
                return NotFound();
            }

            if (!appUser.IsActive)
            {
                return BadRequest();
            }

            if (appUser.EmailConfirmed)
            {
                return Conflict();
            }

            IdentityResult identityResult = await _userManager.ConfirmEmailAsync(appUser, token);

            if (!identityResult.Succeeded)
            {
                foreach (IdentityError error in identityResult.Errors)
                {
                    ModelState.AddModelError("", error.Description);
                }
                return View(nameof(Login));
            }

            await _signInManager.SignInAsync(appUser, true);

            return RedirectToAction("Index", "Home");
        }

        [Authorize(Roles = "Member")]
        public async Task<IActionResult> Profile()
        {

            AppUser appUser = await _userManager.Users
             .Include(u => u.Addresses.Where(a => a.IsDeleted == false))
             .Include(u=>u.Orders.Where(o=>o.IsDeleted == false))
             .ThenInclude(o=>o.OrderProducts.Where(op=>op.IsDeleted==false))
             .FirstOrDefaultAsync(u => u.UserName == User.Identity.Name);

            ProfileVM profileVM = new ProfileVM();
            profileVM.Addresses = appUser.Addresses;
            profileVM.ProfileAcoountVM = new ProfileAccountVM
            {
                Name = appUser.Name,
                SurName = appUser.SurName,
                UserName = appUser.UserName,
                Email = appUser.Email
            };
            profileVM.Orders = appUser.Orders;

            return View(profileVM);
        }

        [HttpPost]
        [Authorize(Roles = "Member")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> ProfileAccount(ProfileAccountVM profileAccountVM)
        {
            TempData["Tab"] = "Account";

            AppUser appUser = await _userManager.Users
              .Include(u => u.Addresses.Where(a => a.IsDeleted == false))
              .FirstOrDefaultAsync(u => u.UserName == User.Identity.Name);

            ProfileVM profileVM = new ProfileVM();
            profileVM.Addresses = appUser.Addresses;
            profileVM.ProfileAcoountVM = profileAccountVM;

            if (!ModelState.IsValid)
            {
                return View("Profile", profileVM);
            }


            if (appUser.NormalizedUserName != profileAccountVM.UserName.Trim().ToUpperInvariant())
            {
                appUser.UserName = profileAccountVM.UserName;
            }

            if (appUser.NormalizedEmail != profileAccountVM.Email.Trim().ToUpperInvariant())
            {
                appUser.Email = profileAccountVM.Email;
            }

            appUser.Name = profileAccountVM.Name;
            appUser.SurName = profileAccountVM.SurName;

            IdentityResult identityResult = await _userManager.UpdateAsync(appUser);

            if (!identityResult.Succeeded)
            {
                foreach (IdentityError identityError in identityResult.Errors)
                {
                    ModelState.AddModelError("", identityError.Description);

                }
                return View("Profile", profileVM);
            }

            await _signInManager.SignInAsync(appUser, true);

            return RedirectToAction(nameof(Profile));
        }


        [HttpPost]
        [Authorize(Roles = "Member")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> AddAddress(Address address)
        {

            TempData["Tab"] = "Address";
            AppUser appUser = await _userManager.Users
             .Include(u => u.Addresses.Where(a => a.IsDeleted == false))
             .FirstOrDefaultAsync(u => u.UserName == User.Identity.Name);

            ProfileVM profileVM = new ProfileVM();
            profileVM.ProfileAcoountVM = new ProfileAccountVM
            {
                Name = appUser.Name,
                SurName = appUser.SurName,
                UserName = appUser.UserName,
                Email = appUser.Email
            };
            profileVM.Addresses = appUser.Addresses;

            if (!ModelState.IsValid)
            {
                profileVM.Address = address;
                TempData["address"] = "true";
                return View("Profile", profileVM);
            }

            if (address.isDefault == true)
            {

                if (appUser.Addresses != null && appUser.Addresses.Count() > 0)
                {
                    foreach (Address address1 in appUser.Addresses)
                    {
                        address1.isDefault = false;
                    }
                }

            }
            else
            {
                if (appUser.Addresses == null || appUser.Addresses.Count() <= 0)
                {

                    address.isDefault = false;

                }
            }

            address.UserId = appUser.Id;
            address.CreatedBy = appUser.Name + " " + appUser.SurName;
            address.CreatedAt = DateTime.Now;

            await _context.Addresses.AddAsync(address);
            await _context.SaveChangesAsync();


            return RedirectToAction(nameof(Profile));
        }

        [Authorize(Roles = "Member")]
        public async Task<IActionResult> EditAddress(int? id)
        {
            AppUser appUser = await _userManager.FindByNameAsync(User.Identity.Name);

            if (id == null)
            {
                return BadRequest();
            }

            Address address = await _context.Addresses.FirstOrDefaultAsync(a => a.IsDeleted == false && a.Id == id && a.UserId == appUser.Id);

            if (address == null)
            {
                return NotFound();
            }

            return PartialView("_EditAddressPartial",address);
        }

        [HttpPost]
        [Authorize(Roles = "Member")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> EditAddress(Address address)
        {

            TempData["Tab"] = "Address";
            AppUser appUser = await _userManager.Users
             .Include(u => u.Addresses.Where(a => a.IsDeleted == false))
             .FirstOrDefaultAsync(u => u.UserName == User.Identity.Name);

            ProfileVM profileVM = new ProfileVM();
            profileVM.ProfileAcoountVM = new ProfileAccountVM
            {
                Name = appUser.Name,
                SurName = appUser.SurName,
                UserName = appUser.UserName,
                Email = appUser.Email
            };
            profileVM.Addresses = appUser.Addresses;

            if (!ModelState.IsValid)
            {
                profileVM.Address = address;
                TempData["EditAddress"] = "true";
                return View("Profile", profileVM);
            }

            Address dbAddress = appUser.Addresses.FirstOrDefault(a => a.Id == address.Id);

            if (address.isDefault == true)
            {

                if (appUser.Addresses != null && appUser.Addresses.Count() > 0)
                {
                    foreach (Address address1 in appUser.Addresses)
                    {
                        address1.isDefault = false;
                    }
                }

                dbAddress.isDefault = true;

            }
            else
            {
                if (appUser.Addresses == null || appUser.Addresses.Count() <= 0)
                {

                    address.isDefault = false;

                }
            }

            dbAddress.Line1 = address.Line1;
            dbAddress.Line2 = address.Line2;
            dbAddress.Country = address.Country;
            dbAddress.Town = address.Town;
            dbAddress.State = address.State;
            dbAddress.PostalCode = address.PostalCode;

            await _context.SaveChangesAsync();

            return RedirectToAction(nameof(Profile));
        }


        //9.ForgotPassword(Get)
        public async Task<IActionResult> ForgotPassword()
        {
            return View();
        }
        //10.ForgotPassword(Post)
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> ForgotPassword(ForgotPasswordVM forgotPasswordVM)
        {
            if (!ModelState.IsValid)
            {
                return View(forgotPasswordVM);
            }

            AppUser appUser = await _userManager.FindByEmailAsync(forgotPasswordVM.Email);
            if (appUser == null)
            {
                ModelState.AddModelError("Email", "Email is Incorrect");
                return View(forgotPasswordVM);
            }

            //if (!appUser.IsActive)
            //{
            //    ModelState.AddModelError("Email", "Email is Incorrect");
            //    return View(forgotPasswordVM);
            //}

            string token = await _userManager.GeneratePasswordResetTokenAsync(appUser);
            string templateFullPath = Path.Combine(_env.WebRootPath, "templates", "ResetPassword.html");
            string templateContent = await System.IO.File.ReadAllTextAsync(templateFullPath);
            string url = Url.Action("ResetPassword", "Account", new { appUser.Id, token }, Request.Scheme, Request.Host.ToString());

            templateContent = templateContent.Replace("{{action_url}}", url);
            templateContent = templateContent.Replace("{{name}}", appUser.Name);

            MimeMessage mimeMessage = new MimeMessage();
            mimeMessage.From.Add(MailboxAddress.Parse(_smtpSetting.Email));
            mimeMessage.To.Add(MailboxAddress.Parse(appUser.Email));
            mimeMessage.Subject = "Reset  Password";
            mimeMessage.Body = new TextPart(MimeKit.Text.TextFormat.Html)
            {
                Text = templateContent
            };

            using (SmtpClient client = new SmtpClient())
            {
                await client.ConnectAsync(_smtpSetting.Host, _smtpSetting.Port, MailKit.Security.SecureSocketOptions.StartTls);
                await client.AuthenticateAsync(_smtpSetting.Email, _smtpSetting.Password);
                await client.SendAsync(mimeMessage);
                await client.DisconnectAsync(true);
            }

            return RedirectToAction(nameof(Login));
        }

        //11.ResetPassword(Get)
        public async Task<IActionResult> ResetPassword()
        {
            return View();
        }

        //12.ResetPassword(Post)

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> ResetPassword(string id, string token, ViewModels.ResetPasswordVM resetPasswordVM)
        {
            if (!ModelState.IsValid) return View(resetPasswordVM);

            if (string.IsNullOrWhiteSpace(id))
            {
                ModelState.AddModelError("", "Id Is Incorrect");
                return View(resetPasswordVM);
            }
            if (string.IsNullOrWhiteSpace(token))
            {
                ModelState.AddModelError("", "Token Is Incorrect");
                return View(resetPasswordVM);
            }

            AppUser appUser = await _userManager.FindByIdAsync(id);

            if (appUser == null)
            {
                ModelState.AddModelError("", "Id Is Incorrect");
                return View(resetPasswordVM);
            }

            IdentityResult identityResult = await _userManager.ResetPasswordAsync(appUser, token, resetPasswordVM.Password);

            if (identityResult.Succeeded)
            {
                foreach (IdentityError identityError in identityResult.Errors)
                {
                    ModelState.AddModelError("", identityError.Description);
                }
                return View(resetPasswordVM);
            }

            return View();
        }

    }
}
