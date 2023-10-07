using JuanYunis.DataAccessLayer;
using JuanYunis.Models;
using JuanYunis.ViewModels.BasketVMs;
using JuanYunis.ViewModels.OrderVMs;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace JuanYunis.Controllers
{
    [Authorize(Roles = "Member")]
    public class OrderController : Controller
    {
        private readonly AppDbContext _context;
        private readonly UserManager<AppUser> _userManager;

        public OrderController(AppDbContext context, UserManager<AppUser> userManager)
        {
            _context = context;
            _userManager = userManager;
        }

        public async Task<IActionResult> CheckOut()
        {
            AppUser appUser = await _userManager.Users
                .Include(u => u.Addresses.Where(a => a.IsDeleted == false && a.isDefault == true))
                .Include(u => u.Baskets.Where(b => b.IsDeleted == false)).ThenInclude(b => b.Product)
                .ThenInclude(p=>p.ProductImages.Where(pi=>pi.IsDeleted == false))
                .FirstOrDefaultAsync(u => u.UserName == User.Identity.Name);

            if (appUser.Baskets == null || appUser.Baskets.Count() <= 0)
            {
                TempData["Info"] = "Select Products before checking Out";
                return RedirectToAction("Index", "Product");
            }

            OrderVM orderVM = new OrderVM
            {
                Order = new Order
                {
                    Country = appUser.Addresses.First().Country,
                    Email = appUser.Email,
                    Line1 = appUser.Addresses.First().Line1,
                    Line2 = appUser.Addresses.First().Line2,
                    Name = appUser.Name,
                    PostalCode = appUser.Addresses.First().PostalCode,
                    SurName = appUser.SurName,
                    Town = appUser.Addresses.First().Town,
                    State = appUser.Addresses.First().State

                },
                BasketVMs = appUser.Baskets.Select(x => new BasketVM {
                    Id = (int)x.ProductId,
                    Count = x.Count,
                    EcoTax = x.Product.EcoTax,
                    Image = x.Product.ProductImages.FirstOrDefault(pi => pi.IsMainImage == true).Image,
                    Price = x.Product.DiscountedPrice > 0 ? x.Product.DiscountedPrice : x.Product.Price,
                    Title = x.Product.Title,
                }).ToList()
            };

            return View(orderVM);
        }
    }
}
