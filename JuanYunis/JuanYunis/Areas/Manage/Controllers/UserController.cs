using JuanYunis.DataAccessLayer;
using JuanYunis.Models;
using JuanYunis.ViewModels;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Data;
using System.Security.Claims;

namespace JuanYunis.Areas.Manage.Controllers
{
    [Area("manage")]
    [Authorize(Roles = "SuperAdmin,Admin")]
    public class UserController : Controller
    {
        private readonly AppDbContext _context;
        private readonly UserManager<AppUser> _userManager;
        private readonly RoleManager<IdentityRole> _roleManager;

        public UserController(AppDbContext context, UserManager<AppUser> userManager, RoleManager<IdentityRole> roleManager)
        {
            _context = context;
            _userManager = userManager;
            _roleManager = roleManager;
        }

        public async Task<IActionResult> Index(int currentPage = 1)
        {
            List<AppUser> users = await _context.Users.Where(u => u.UserName != User.Identity.Name).ToListAsync();

            foreach (var user in users)
            {
                user.Roles = await _userManager.GetRolesAsync(user);
            }

            return View(PageNatedList<AppUser>.Create(users.AsQueryable(), currentPage, 5, 8));
        }

        public async Task<IActionResult> Detail(string? id) 
        {
            if (string.IsNullOrWhiteSpace(id))
            {
                return BadRequest();
            }

            AppUser? appUser = await _context.Users
                .Include(u => u.Addresses.Where(a => a.IsDeleted == false))
                .FirstOrDefaultAsync(u => u.Id == id);

            if (appUser == null)
            {
                return NotFound();
            }
            appUser.Roles = await _userManager.GetRolesAsync(appUser);

            return View(appUser);
        }

        public async Task<IActionResult> SetActive(string? id, int currentPage)
        {
            if (string.IsNullOrWhiteSpace(id)) return BadRequest();

            AppUser appUser = await _userManager.FindByIdAsync(id);

            if (appUser == null) return NotFound();

            bool active = appUser.IsActive;

            appUser.IsActive = !active;

            await _userManager.UpdateAsync(appUser);

            List<AppUser> users = await _context.Users.Where(u => u.UserName != User.Identity.Name).ToListAsync();

            foreach (var user in users)
            {
                user.Roles = await _userManager.GetRolesAsync(user);
            }


            return PartialView("_UserSettingsPartial", PageNatedList<AppUser>.Create(users.AsQueryable(), currentPage, 5, 8));
        }

        public async Task<IActionResult> ResetPassword(string? id, int currentPage)
        {
            if (string.IsNullOrWhiteSpace(id)) return BadRequest();

            AppUser appUser = await _userManager.FindByIdAsync(id);

            if (appUser == null) return NotFound();

            string token = await _userManager.GeneratePasswordResetTokenAsync(appUser);

            await _userManager.ResetPasswordAsync(appUser, token, "Welcome123");


            List<AppUser> users = await _context.Users.Where(u => u.UserName != User.Identity.Name).ToListAsync();

            foreach (var user in users)
            {
                user.Roles = await _userManager.GetRolesAsync(user);
            }


            return PartialView("_UserSettingsPartial", PageNatedList<AppUser>.Create(users.AsQueryable(), currentPage, 5, 8));
        }

        public async Task<IActionResult> ChangeRole(string? id)
        {
            if (string.IsNullOrWhiteSpace(id)) return BadRequest();

            string AuthenticatedId = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;  

            if (id == AuthenticatedId) return BadRequest();

            AppUser appUser = await _context.Users.FirstOrDefaultAsync(u => u.Id == id);

            if (appUser == null) return NotFound();



            appUser.Roles = await _userManager.GetRolesAsync(appUser);
                List<string> roles = new List<string>();
            foreach (var item in _roleManager.Roles.ToList())
            {
                roles.Add(item.ToString());
            }

            ViewBag.Roles = roles;

            return View(appUser);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> ChangeRole(AppUser appUser)
        {

            if (!ModelState.IsValid)
            {
                ViewBag.Roles = _roleManager.Roles.ToList();
                return View(appUser);
            }
            AppUser dbUser = await _context.Users.FirstOrDefaultAsync(u => u.Id == appUser.Id);

            List<string> AllNewRoles = new List<string>();
            AllNewRoles.AddRange(appUser.Roles);

            await _userManager.RemoveFromRolesAsync(dbUser, await _userManager.GetRolesAsync(dbUser));
            await _userManager.AddToRolesAsync(dbUser, AllNewRoles);

            IdentityResult identityResult = await _userManager.UpdateAsync(dbUser);

            if (!identityResult.Succeeded)
            {
                foreach (IdentityError identityError in identityResult.Errors)
                {
                    ModelState.AddModelError("", identityError.Description);

                }
                return View(dbUser);
            }


            return RedirectToAction(nameof(Index));
        }
    }
}

           
