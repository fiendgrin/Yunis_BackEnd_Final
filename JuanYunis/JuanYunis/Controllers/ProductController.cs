using JuanYunis.DataAccessLayer;
using JuanYunis.Models;
using JuanYunis.ViewModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace JuanYunis.Controllers
{
    public class ProductController : Controller
    {
        private readonly AppDbContext _context;
        private readonly int _pageSize = 9;
        public ProductController(AppDbContext context)
        {
            _context = context;
        }

        public IActionResult Index( int currentPage = 1)
        {
            ViewBag.LoadPageIndex = 1;
            IQueryable<Product> products = _context.Products
                .Include(p=>p.ProductImages.Where(pi=>pi.IsDeleted==false))
                .Where(p => p.IsDeleted == false)
                .OrderByDescending(p => p.Id);

            return View(PageNatedList<Product>.Create(products, currentPage, _pageSize, 3));
        }

        public async Task<IActionResult> LoadMore(int? pageIndex)
        {
            if (pageIndex == null) return BadRequest();

            if (pageIndex <= 0) return BadRequest();

            IQueryable<Product> products = _context.Products
                .Include(p => p.ProductImages.Where(pi => pi.IsDeleted == false))
                .Where(p => p.IsDeleted == false)
                .OrderByDescending(p => p.Id);


            int maxPage = (int)Math.Ceiling((decimal)products.Count() / _pageSize);
            if (pageIndex > maxPage) return BadRequest();

            products = products.Skip((int)pageIndex * _pageSize).Take(_pageSize);

            return PartialView("_LoadMorePartial", new List<Product>(products));
        }

        public async Task<IActionResult> Search(string search)
        {
            List<Product>? products = null;
            List<Category>? categories = await _context.Categories.Where(c => c.IsDeleted == false && c.Name.ToLower().Contains(search.ToLower())).ToListAsync();


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

        public async Task<IActionResult> Modal(int? id)
        {
            if (id == null) return BadRequest("Id is required");

            Product product = await _context.Products
                .Include(p => p.ProductImages.Where(pi => pi.IsDeleted == false && pi.IsMainImage == false)).
                FirstOrDefaultAsync(p => p.IsDeleted == false && p.Id == id);

            if (product == null) return NotFound("This Id does not exist");

            return PartialView("_ModalPartial", product);
        }


    }
}
