using JuanYunis.DataAccessLayer;
using JuanYunis.Interfaces;
using JuanYunis.Models;
using JuanYunis.Services;
using JuanYunis.ViewModels.BasketVMs;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using NuGet.ContentModel;

namespace JuanYunis.Controllers
{
    public class BasketController : Controller
    {
        private readonly AppDbContext _context;
        private readonly UserManager<AppUser> _userManager;

        public BasketController(AppDbContext context, UserManager<AppUser> userManager)
        {
            _context = context;
            _userManager = userManager;
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

            if (User.Identity.IsAuthenticated && User.IsInRole("Member"))
            {
                AppUser appUser = await _userManager.Users
                    .Include(b => b.Baskets.Where(b => b.IsDeleted == false))
                    .FirstOrDefaultAsync(u => u.UserName == User.Identity.Name);

                if (appUser != null && appUser.Baskets != null && appUser.Baskets.Count() > 0)
                {
                    Basket? userBasket = appUser.Baskets.FirstOrDefault(b => b.ProductId == id);
                    if (userBasket != null)
                    {
                        userBasket.Count = basketVMs.FirstOrDefault(b => b.Id == id).Count;
                    }
                    else
                    {
                        Basket userNewBasket = new Basket
                        {
                            UserId = appUser.Id,
                            ProductId = id,
                            Count = basketVMs.FirstOrDefault(b => b.Id == id).Count
                        };

                        await _context.AddAsync(userNewBasket);
                    }

                }
                else
                {
                    Basket userNewBasket = new Basket
                    {
                        UserId = appUser.Id,
                        ProductId = id,
                        Count = basketVMs.FirstOrDefault(b => b.Id == id).Count
                    };

                    await _context.AddAsync(userNewBasket);
                }
                await _context.SaveChangesAsync();
            }

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

            List<BasketVM>? basketVMs = JsonConvert.DeserializeObject<List<BasketVM>>(basket);


            if (!basketVMs.Any(p => p.Id == id)) return NotFound("Id Not Found");

            basketVMs.RemoveAll(p => p.Id == id);

            basket = JsonConvert.SerializeObject(basketVMs);

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

        public async Task<IActionResult> GetBasketInfo()
        {

            
            string? basket = Request.Cookies["basket"];
            List<BasketVM>? basketVMs =  JsonConvert.DeserializeObject<List<BasketVM>>(basket);


            return Ok(basketVMs == null? 0:basketVMs.Count);
        }
    }
}
