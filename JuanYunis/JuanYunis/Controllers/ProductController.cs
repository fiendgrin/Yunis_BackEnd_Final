using JuanYunis.DataAccessLayer;
using JuanYunis.Enums;
using JuanYunis.Models;
using JuanYunis.ViewModels;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace JuanYunis.Controllers
{
    public class ProductController : Controller
    {
        private readonly AppDbContext _context;
        private readonly int _pageSize = 9;
        private readonly UserManager<AppUser> _userManager;
        public ProductController(AppDbContext context, UserManager<AppUser> userManager)
        {
            _context = context;
            _userManager = userManager;
        }

        //1.Index
        //2.LoadMore
        //3.Search
        //4.Moadl
        //5.Detail
        //6.Review
        //1.Index
        public IActionResult Index( int currentPage = 1, int? categoryId = null)
        {
            ViewBag.LoadPageIndex = 1;
            IQueryable<Product>? products = null;
            if (categoryId == null)
            {
              products = _context.Products
                .Include(p => p.ProductImages.Where(pi => pi.IsDeleted == false))
                .Where(p => p.IsDeleted == false)
                .OrderByDescending(p => p.Id);
            }
            else 
            {
                products= _context.Products
                .Include(p => p.ProductImages.Where(pi => pi.IsDeleted == false))
                .Where(p => p.IsDeleted == false && p.CategoryId == categoryId)
                .OrderByDescending(p => p.Id);
            }
            

            return View(PageNatedList<Product>.Create(products, currentPage, _pageSize, 3,categoryId));
        }
        //2.LoadMore
        public async Task<IActionResult> LoadMore(int? pageIndex, int? categoryId = null)
        {

            if (pageIndex == null) return BadRequest();

            if (pageIndex <= 0) return BadRequest();

            IQueryable<Product>? products = null;
            if (categoryId == null)
            {
                products = _context.Products
                  .Include(p => p.ProductImages.Where(pi => pi.IsDeleted == false))
                  .Where(p => p.IsDeleted == false)
                  .OrderByDescending(p => p.Id);
            }
            else
            {
                products = _context.Products
                .Include(p => p.ProductImages.Where(pi => pi.IsDeleted == false))
                .Where(p => p.IsDeleted == false && p.CategoryId == categoryId)
                .OrderByDescending(p => p.Id);
            }



            int maxPage = (int)Math.Ceiling((decimal)products.Count() / _pageSize);
            if (pageIndex > maxPage) return BadRequest();

            products = products.Skip((int)pageIndex * _pageSize).Take(_pageSize);

            return PartialView("_LoadMorePartial", new List<Product>(products));
        }
        //3.Search
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
        //4.Moadl
        public async Task<IActionResult> Modal(int? id)
        {
            if (id == null) return BadRequest("Id is required");

            Product product = await _context.Products
                .Include(p => p.Reviews.Where(r => r.IsDeleted == false))
                .Include(p => p.ProductImages.Where(pi => pi.IsDeleted == false)).
                FirstOrDefaultAsync(p => p.IsDeleted == false && p.Id == id);

            if (product == null) return NotFound("This Id does not exist");

            return PartialView("_ModalPartial", product);
        }
        //5.Detail
        public async Task<IActionResult> Detail(int? id) 
        {
            if (id == null) return BadRequest();

            Product? product = await _context.Products
                .Include(p => p.Reviews.Where(r => r.IsDeleted == false)).ThenInclude(r => r.User)
                .Include(p=>p.ProductImages.Where(pi=>pi.IsDeleted == false))
                .FirstOrDefaultAsync(p => p.Id == id && p.IsDeleted == false);

            if (product == null) return NotFound();

            return View(product);
        }
        //6.Review
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Review(string? comment, int? productId, int? rating) 
        {
            if (!User.Identity.IsAuthenticated) return Unauthorized(); 

            if (productId == null || string.IsNullOrWhiteSpace(comment) || rating == null)
            {
                return BadRequest();
            }

            AppUser user = await _userManager.FindByNameAsync(User.Identity.Name);

            if (user == null)
            {
                return BadRequest();
            }

            Review review = new Review
            {
                Comment = comment,
                CreatedAt = DateTime.Now,
                CreatedBy = User.Identity.Name,
                IsDeleted = false,
                ProductId = productId,
                Rating = (Rating)rating,
                UserId = user.Id
            };

            await _context.Reviews.AddAsync(review);
            await _context.SaveChangesAsync();



            return RedirectToAction( "Detail","Product",new {id=productId } );
        }
    }
}
