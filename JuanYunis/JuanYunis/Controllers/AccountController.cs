using JuanYunis.Models;
using JuanYunis.ViewModels;
using JuanYunis.ViewModels.AccountVMs;
using JuanYunis.ViewModels.BasketVMs;
using MailKit.Net.Smtp;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Options;
using MimeKit;
using Newtonsoft.Json;

namespace JuanYunis.Controllers
{
    public class AccountController : Controller
    {
        private readonly UserManager<AppUser> _userManager;
        private readonly RoleManager<IdentityRole> _roleManager;
        private readonly SignInManager<AppUser> _signInManager;
        private readonly IConfiguration _config;
        private readonly SmtpSetting _smtpSetting;
        private readonly IWebHostEnvironment _env;

        public AccountController(UserManager<AppUser> userManager, RoleManager<IdentityRole> roleManager,
            SignInManager<AppUser> signInManager, IConfiguration config, IOptions<SmtpSetting> options, IWebHostEnvironment env)
        {
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
                //.Include(u => u.Baskets.Where(b => b.IsDeleted == false))
                .FirstOrDefaultAsync(u => u.NormalizedEmail == loginVM.Email.Trim().ToUpperInvariant());
            if (appUser == null)
            {
                ModelState.AddModelError("", "Email or Password are Incorrect");
                return View(loginVM);
            }

            IList<string> roles = await _userManager.GetRolesAsync(appUser);

            if (roles.Any(r => r == "Member"))
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

            //if (appUser.Baskets != null && appUser.Baskets.Count() > 0)
            //{
            //    List<BasketVM> basketVMs = new List<BasketVM>();

            //    foreach (Basket basket in appUser.Baskets)
            //    {
            //        BasketVM basketVM = new BasketVM
            //        {
            //            Id = (int)basket.ProductId,
            //            Count = basket.Count
            //        };
            //        basketVMs.Add(basketVM);
            //    }

            //    string cookie = JsonConvert.SerializeObject(basketVMs);
            //    Response.Cookies.Append("basket", cookie);

            //}

            return RedirectToAction("Index", "Home");
        }


        //3.Logout
        public async Task<IActionResult> Logout()
        {
            await _signInManager.SignOutAsync();
            return RedirectToAction(nameof(Login));
        }
    }
}
