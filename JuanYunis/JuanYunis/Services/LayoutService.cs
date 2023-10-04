using JuanYunis.DataAccessLayer;
using JuanYunis.Interfaces;
using JuanYunis.Models;
using JuanYunis.ViewModels.BasketVMs;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;

namespace JuanYunis.Services
{
    public class LayoutService : ILayoutService
    {
        private readonly AppDbContext _context;
        private readonly IHttpContextAccessor _contextAccessor;
    

        public LayoutService(IHttpContextAccessor contextAccessor, AppDbContext context)
        {
            _contextAccessor = contextAccessor;
            _context = context;

        }


     

        public async Task<List<BasketVM>> GetBasketsAsync() 
        {
            List<BasketVM>? basketVMs = null;

            string? cookie = _contextAccessor.HttpContext.Request.Cookies["basket"];

            if (!string.IsNullOrWhiteSpace(cookie))
            {
                basketVMs = JsonConvert.DeserializeObject<List<BasketVM>>(cookie);
            }
            else
            {
                basketVMs = new List<BasketVM>();
            }

            foreach (BasketVM basketVM in basketVMs)
            {
                Product product = await _context.Products
                    .Include(p=>p.ProductImages.Where(pi=>pi.IsDeleted==false && pi.IsMainImage==true))
                    .FirstOrDefaultAsync(p => p.Id == basketVM.Id);
                basketVM.Title = product.Title;
                basketVM.Image = product.ProductImages.FirstOrDefault().Image;
                basketVM.Price = product.DiscountedPrice > 0 ? product.DiscountedPrice : product.Price;
                basketVM.EcoTax = product.EcoTax;

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
