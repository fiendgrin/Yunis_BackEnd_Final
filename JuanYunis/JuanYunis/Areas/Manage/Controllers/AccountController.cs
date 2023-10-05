using JuanYunis.Areas.Manage.ViewModels.AccountVMs;
using JuanYunis.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Options;
using MimeKit;
using NuGet.Protocol.Plugins;
using System.Data;
using System.Net.Mail;

namespace JuanYunis.Areas.Manage.Controllers
{
    [Area("manage")]
    public class AccountController : Controller
    {
        private readonly UserManager<AppUser> _userManager;
        private readonly RoleManager<IdentityRole> _roleManager;
        private readonly SignInManager<AppUser> _signInManager;
        private readonly IConfiguration _config;
        //private readonly SmtpSetting _smtpSetting;
        private readonly IWebHostEnvironment _env;

        public AccountController(UserManager<AppUser> userManager, RoleManager<IdentityRole> roleManager,
            SignInManager<AppUser> signInManager, IConfiguration config/*, IOptions<SmtpSetting> options*/, IWebHostEnvironment env)
        {
            _userManager = userManager;
            _roleManager = roleManager;
            _signInManager = signInManager;
            _config = config;
            //_smtpSetting = options.Value;
            _env = env;
        }


        //1.Register(Get)
        //2.Register(Post)
        //3.Login(Get)

        //======================================================================

        //1.Register(Get)
        public async Task<IActionResult> Register() 
        {
            return View();
        }

        //2.Register(Post)
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

            if (await _userManager.Users.AnyAsync(u => u.NormalizedUserName == registerVM.UserName.Trim().ToUpperInvariant()))
            {
                ModelState.AddModelError("UserName", $"'{registerVM.UserName}' Already Exists");
                return View(registerVM);
            }

            if (await _userManager.Users.AnyAsync(u => u.NormalizedEmail == registerVM.Email.Trim().ToUpperInvariant()))
            {
                ModelState.AddModelError("Email", $"'{registerVM.Email}' Already Exists");
                return View(registerVM);
            }

            IdentityResult identityResult = await _userManager.CreateAsync(appUser, registerVM.Password);

            if (!identityResult.Succeeded)
            {
                foreach (IdentityError identityError in identityResult.Errors)
                {
                    ModelState.AddModelError("", identityError.Description);
                }
                return View(registerVM);
            }

            await _userManager.AddToRoleAsync(appUser, "Admin");

            //string templateFullPath = Path.Combine(_env.WebRootPath, "templates", "EmailConfirm.html");
            //string templateContent = await System.IO.File.ReadAllTextAsync(templateFullPath);

            //string token = await _userManager.GenerateEmailConfirmationTokenAsync(appUser);
            //string url = Url.Action("EmailConfirm", "Account", new { Id = appUser.Id, token = token }, Request.Scheme, Request.Host.ToString());

            //templateContent = templateContent.Replace("{{url}}", url);

            //MimeMessage mimeMessage = new MimeMessage();
            //mimeMessage.From.Add(MailboxAddress.Parse(_smtpSetting.Email));
            //mimeMessage.To.Add(MailboxAddress.Parse(appUser.Email));
            //mimeMessage.Subject = "Email Confirmation";
            //mimeMessage.Body = new TextPart(MimeKit.Text.TextFormat.Html)
            //{
            //    Text = templateContent
            //};

            //using (SmtpClient client = new SmtpClient())
            //{
            //    await client.ConnectAsync(_smtpSetting.Host, _smtpSetting.Port, MailKit.Security.SecureSocketOptions.StartTls);
            //    await client.AuthenticateAsync(_smtpSetting.Email, _smtpSetting.Password);
            //    await client.SendAsync(mimeMessage);
            //    await client.DisconnectAsync(true);
            //}
            ////zbylaokvrkfsiwsy

            return RedirectToAction(nameof(Login));
        }


        //3.Login(Get)
        public async Task<IActionResult> Login()
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

            AppUser appUser = await _userManager.FindByEmailAsync(loginVM.Email);

            if (appUser == null)
            {
                ModelState.AddModelError("", "Email or Password are incorrect");
                return View(loginVM);
            }

            //if (await _userManager.CheckPasswordAsync(appUser,loginVM.Password))
            //{
            //    ModelState.AddModelError("", "Email or Password are incorrect");
            //    return View(loginVM);
            //}

            if (!appUser.IsActive)
            {
                return Unauthorized();
            }

            Microsoft.AspNetCore.Identity.SignInResult signInResult = await _signInManager
                .PasswordSignInAsync(appUser, loginVM.Password, loginVM.RememberMe, true);

            if (!signInResult.Succeeded)
            {
                ModelState.AddModelError("", "Email or password are incorrect");
                return View(loginVM);
            }

            if (signInResult.IsLockedOut)
            {
                ModelState.AddModelError("", "Your Account is blocked");
                return View(loginVM);
            }

            return RedirectToAction("Index", "Dashboard", new { area = "manage" });
        }

        //public async Task<IActionResult> SuperAdmin()
        //{
        //    AppUser appUser = new AppUser { 
        //    Email = "SuperAdmin@mail.com",
        //    UserName = "superadmin"

        //    };

        //    await _userManager.CreateAsync(appUser, "SuperAdmin999");
        //    await _userManager.AddToRoleAsync(appUser,"SuperAdmin");

        //    return Ok("SuperAdmin Created");
        //}

        //public async Task<IActionResult> CreateRole() 
        //{
        //    await _roleManager.CreateAsync(new IdentityRole("SuperAdmin"));
        //    await _roleManager.CreateAsync(new IdentityRole("Admin"));
        //    await _roleManager.CreateAsync(new IdentityRole("Member"));


        //    return Ok("Roles Created");
        //}
    }
}
