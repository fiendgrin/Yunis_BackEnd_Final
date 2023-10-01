using JuanYunis.DataAccessLayer;
using JuanYunis.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace JuanYunis.Controllers
{
    public class ProductController : Controller
    {
        private readonly AppDbContext _context;

        public ProductController(AppDbContext context)
        {
            _context = context;
        }

        public IActionResult Index()
        {
            return View();
        }

        public async Task<IActionResult> Search(string search)
        {
            List<Product>? products = null;
            List<Category>? categories = await _context.Categories.Where(c=>c.IsDeleted == false && c.Name.ToLower().Contains(search.ToLower())).ToListAsync();

           
                products = await _context.Products
                  .Include(p => p.ProductImages.Where(pi => pi.IsDeleted == false))
                  .Where(p => p.IsDeleted == false && p.Title.ToLower().Contains(search.ToLower())).ToListAsync();

            if (categories != null && categories.Count() > 0)
            {
                foreach (Category category in categories)
                {
                    products.AddRange(await _context.Products
                  .Include(p => p.ProductImages.Where(pi => pi.IsDeleted == false))
                  .Where(p => p.IsDeleted == false && category.Id == p.CategoryId).ToListAsync());
                }
            }


            return PartialView("_SearchPartial", products);

        }

    }
}
