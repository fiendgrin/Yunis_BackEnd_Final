using JuanYunis.DataAccessLayer;
using JuanYunis.Models;
using JuanYunis.ViewModels.BasketVMs;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;

namespace JuanYunis.Controllers
{
    public class BasketController : Controller
    {
        private readonly AppDbContext _context;

        public BasketController(AppDbContext context)
        {
            _context = context;
        }

        public IActionResult Index()
        {
            return View();
        }

        public async Task<IActionResult> AddBasket(int? id)
        {
            if (id == null) return BadRequest("Id is required");

            if (!await _context.Products.AnyAsync(p => p.IsDeleted == false && p.Id == id)) return NotFound("This Id does not exist");

            string? basket = Request.Cookies["basket"];

            List<BasketVM> basketVMs = null;
            if (!string.IsNullOrWhiteSpace(basket))
            {
                basketVMs = JsonConvert.DeserializeObject<List<BasketVM>>(basket);

                if (basketVMs.Exists(b => b.Id == id))
                {
                    basketVMs.Find(b => b.Id == id).Count += 1;
                }
                else
                {
                    basketVMs.Add(new BasketVM
                    {
                        Id = (int)id,
                        Count = 1
                    });
                }
            }
            else
            {

                basketVMs = new List<BasketVM> { new BasketVM
                {
                    Id = (int)id,
                    Count = 1
                }
            };

            }

            basket = JsonConvert.SerializeObject(basketVMs);

            Response.Cookies.Append("basket", basket);

            

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

            return PartialView("_BasketPartial", basketVMs);
        }

        public async Task<IActionResult> RemoveBasket(int? id)
        {
            if (id == null) return BadRequest("Id is required");

            string? basket = Request.Cookies["basket"];

            List<BasketVM>? ProductsInBasket = JsonConvert.DeserializeObject<List<BasketVM>>(basket);


            if (!ProductsInBasket.Any(p => p.Id == id)) return NotFound("Id Not Found");

            ProductsInBasket.RemoveAll(p => p.Id == id);

            basket = JsonConvert.SerializeObject(ProductsInBasket);

            Response.Cookies.Append("basket", basket);

            foreach (BasketVM basketVM in ProductsInBasket)
            {
                Product product = await _context.Products
                  .Include(p => p.ProductImages.Where(pi => pi.IsDeleted == false && pi.IsMainImage == true))
                  .FirstOrDefaultAsync(p => p.Id == basketVM.Id);
                basketVM.Title = product.Title;
                basketVM.Image = product.ProductImages.FirstOrDefault().Image;
                basketVM.Price = product.DiscountedPrice > 0 ? product.DiscountedPrice : product.Price;
                basketVM.EcoTax = product.EcoTax;

            }

            return PartialView("_BasketPartial", ProductsInBasket);
        }
    }
}
