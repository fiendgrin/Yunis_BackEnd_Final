using JuanYunis.DataAccessLayer;
using JuanYunis.Enums;
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
                .ThenInclude(p => p.ProductImages.Where(pi => pi.IsDeleted == false))
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
                BasketVMs = appUser.Baskets.Select(x => new BasketVM
                {
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

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> CheckOut(Order order)
        {
            AppUser appUser = await _userManager.Users
               .Include(u => u.Addresses.Where(a => a.IsDeleted == false && a.isDefault == true))
               .Include(u => u.Orders)
               .Include(u => u.Baskets.Where(b => b.IsDeleted == false)).ThenInclude(b => b.Product)
               .ThenInclude(p => p.ProductImages.Where(pi => pi.IsDeleted == false))
               .FirstOrDefaultAsync(u => u.UserName == User.Identity.Name);

            OrderVM orderVM = new OrderVM
            {
                Order = order,
                BasketVMs = appUser.Baskets.Select(x => new BasketVM
                {
                    Id = (int)x.ProductId,
                    Count = x.Count,
                    EcoTax = x.Product.EcoTax,
                    Image = x.Product.ProductImages.FirstOrDefault(pi => pi.IsMainImage == true).Image,
                    Price = x.Product.DiscountedPrice > 0 ? x.Product.DiscountedPrice : x.Product.Price,
                    Title = x.Product.Title,
                }).ToList()
            };
            if (!ModelState.IsValid)
            {
                return View(orderVM);
            }


            if (appUser.Baskets == null || appUser.Baskets.Count() <= 0)
            {
                TempData["Info"] = "Select Products Before Checking Out";
                return RedirectToAction("Index", "Product");
            }

            List<OrderProduct> orderProducts = new List<OrderProduct>();

            foreach (Basket basket in appUser.Baskets)
            {
                basket.IsDeleted = true;

                OrderProduct orderProduct = new OrderProduct
                {
                    Count = basket.Count,
                    CreatedAt = DateTime.Now,
                    CreatedBy = appUser.Name + " " + appUser.SurName,
                    EcoTax = basket.Product.EcoTax,
                    Price = basket.Product.DiscountedPrice > 0 ? basket.Product.DiscountedPrice : basket.Product.Price,
                    ProductId = basket.Product.Id,
                    Title = basket.Product.Title
                };
                orderProducts.Add(orderProduct);
            }
            order.OrderProducts = orderProducts;
            order.Status = OrderStatus.Pending;
            order.No = appUser.Orders != null && appUser.Orders.Count() > 0 ? appUser.Orders.OrderByDescending(o => o.Id).FirstOrDefault().No + 1 : 1;
            order.CreatedBy = appUser.Name + " " + appUser.SurName;
            order.UserId = appUser.Id;

            await _context.Orders.AddAsync(order);
            await _context.SaveChangesAsync();

            Response.Cookies.Append("basket","");

            TempData["Success"] = "Your Order Is Successfully Added";
            return RedirectToAction("Index", "Product");

        }




    }
}
