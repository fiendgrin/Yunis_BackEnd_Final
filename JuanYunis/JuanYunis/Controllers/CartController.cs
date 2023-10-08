using JuanYunis.DataAccessLayer;
using JuanYunis.Models;
using JuanYunis.Services;
using JuanYunis.ViewModels.BasketVMs;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;

namespace JuanYunis.Controllers
{
    public class CartController : Controller
    {
        private readonly AppDbContext _context;
        private readonly UserManager<AppUser> _userManager;


        public CartController(AppDbContext context, UserManager<AppUser> userManager)
        {
            _context = context;
            _userManager = userManager;
        }

        public async Task<IActionResult> Index()
        {
            List<BasketVM> basketVMs = new List<BasketVM>();
            string? basket = Request.Cookies["basket"];
            if (string.IsNullOrWhiteSpace(basket))
            {
                return View(basketVMs);
            }
            else
            {
                basketVMs = JsonConvert.DeserializeObject<List<BasketVM>>(basket);
                foreach (BasketVM basketVM in basketVMs)
                {
                    Product product = await _context.Products
                 .Include(p => p.ProductImages.Where(pi => pi.IsDeleted == false && pi.IsMainImage == true))
                 .FirstOrDefaultAsync(p => p.Id == basketVM.Id);
                    basketVM.Title = product.Title;
                    basketVM.Image = product.ProductImages.FirstOrDefault().Image;
                    basketVM.Price = product.DiscountedPrice > 0 ? product.DiscountedPrice : product.Price;
                    basketVM.EcoTax = product.EcoTax;

                }
            }

            return View(basketVMs);
        }
        public async Task<IActionResult> RemoveCart(int? id)
        {
            if (id == null) return BadRequest("Id is required");

            string? basket = Request.Cookies["basket"];

            List<BasketVM>? ProductsInCart = JsonConvert.DeserializeObject<List<BasketVM>>(basket);

            if (!ProductsInCart.Any(p => p.Id == id)) return NotFound("Id Not Found");

            ProductsInCart.RemoveAll(p => p.Id == id);

            basket = JsonConvert.SerializeObject(ProductsInCart);

            Response.Cookies.Append("basket", basket);

            if (User.Identity.IsAuthenticated && User.IsInRole("Member"))
            {
                AppUser appUser = await _userManager.Users
                    .Include(b => b.Baskets.Where(b => b.IsDeleted == false))
                    .FirstOrDefaultAsync(u => u.UserName == User.Identity.Name);

                if (appUser != null)
                {
                    Basket? userBasket = appUser.Baskets?.FirstOrDefault(b => b.ProductId == id);


                    if (userBasket != null)
                    {
                        userBasket.DeletedAt = DateTime.Now;
                        userBasket.IsDeleted = true;
                        userBasket.DeletedBy = User.Identity.Name;
                    }

                }
                await _context.SaveChangesAsync();
            }

            foreach (BasketVM basketVM in ProductsInCart)
            {
                Product product = await _context.Products
               .Include(p => p.ProductImages.Where(pi => pi.IsDeleted == false && pi.IsMainImage == true))
               .FirstOrDefaultAsync(p => p.Id == basketVM.Id);
                basketVM.Title = product.Title;
                basketVM.Image = product.ProductImages.FirstOrDefault().Image;
                basketVM.Price = product.DiscountedPrice > 0 ? product.DiscountedPrice : product.Price;
                basketVM.EcoTax = product.EcoTax;

            }
            return PartialView("_CartPartial", ProductsInCart);
        }
    }
}
