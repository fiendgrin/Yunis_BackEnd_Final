using JuanYunis.DataAccessLayer;
using JuanYunis.Interfaces;
using JuanYunis.Models;
using JuanYunis.ViewModels.BasketVMs;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;

namespace JuanYunis.Services
{
    public class LayoutService : ILayoutService
    {
        private readonly AppDbContext _context;
        private readonly IHttpContextAccessor _contextAccessor;
        private readonly UserManager<AppUser> _userManager;


        public LayoutService(IHttpContextAccessor contextAccessor, AppDbContext context, UserManager<AppUser> userManager)
        {
            _contextAccessor = contextAccessor;
            _context = context;
            _userManager = userManager;
        }
        public async Task<List<BasketVM>> GetBasketsAsync()
        {
            List<BasketVM>? basketVMs = null;


            if (_contextAccessor.HttpContext.User.Identity.IsAuthenticated && _contextAccessor.HttpContext.User.IsInRole("Member"))
            {
                AppUser appUser = await _userManager.Users
                    .Include(u => u.Baskets.Where(b => b.IsDeleted == false)).ThenInclude(b => b.Product).ThenInclude(p=>p.ProductImages.Where(pi=>pi.IsDeleted == false))
                    .FirstOrDefaultAsync(u => u.UserName == _contextAccessor.HttpContext.User.Identity.Name);

                if (appUser.Baskets != null && appUser.Baskets.Count() > 0)
                {
                    basketVMs = new List<BasketVM>();

                    foreach (Basket basket in appUser.Baskets)
                    {

                        BasketVM basketVM = new BasketVM();

                        basketVM.Id = (int)basket.ProductId;
                        basketVM.Count = basket.Count;
                        basketVM.EcoTax = basket.Product.EcoTax;
                        basketVM.Image = basket.Product.ProductImages.FirstOrDefault(b =>b.IsMainImage == true).Image;
                        basketVM.Price = basket.Product.DiscountedPrice > 0 ? basket.Product.DiscountedPrice : basket.Product.Price;
                        basketVM.Title = basket.Product.Title;

                        basketVMs.Add(basketVM);
                    }
                }
                else
                {
                    basketVMs = new List<BasketVM>();
                }

                string cookie = JsonConvert.SerializeObject(basketVMs);
                _contextAccessor.HttpContext.Response.Cookies.Append("basket", cookie);
            }
            else
            {
                string? cookie = _contextAccessor.HttpContext.Request.Cookies["basket"];

                if (string.IsNullOrWhiteSpace(cookie))
                {
                    basketVMs = new List<BasketVM>();
                    return basketVMs;
                }
                else
                {
                    basketVMs = JsonConvert.DeserializeObject<List<BasketVM>>(cookie);


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
            }



            return basketVMs;
        }

        public async Task<Dictionary<string, string>> GetSettingsAsync()
        {
            Dictionary<string, string> settings = await _context.Settings.ToDictionaryAsync(s => s.Key, s => s.Value);
            return settings;
        }
    }
}
