using JuanYunis.DataAccessLayer;
using JuanYunis.Models;
using JuanYunis.ViewModels.HomeVMs;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace JuanYunis.Controllers
{
    public class HomeController : Controller
    {
        private readonly AppDbContext _context;

        public HomeController(AppDbContext context)
        {
            _context = context;
        }

        public async Task<IActionResult> Index()
        {
            HomeVM homeVMs = new HomeVM
            {
                Sliders = await _context.Sliders.Where(s => s.IsDeleted == false).ToListAsync(),
                TopSellers = await _context.Products
                .Include(p=>p.ProductImages.Where(pi=>pi.IsDeleted==false))
                .Where(p=>p.IsDeleted ==false && p.IsTopSeller == true).OrderByDescending(p => p.Id).Take(4).ToListAsync(),
                OurProducts = await _context.Products
                .Include(p => p.ProductImages.Where(pi => pi.IsDeleted == false))
                .Where(p => p.IsDeleted == false && p.IsOurProduct == true).OrderByDescending(p => p.Id).ToListAsync(),

            };
            return View(homeVMs);
        }
    }
}
