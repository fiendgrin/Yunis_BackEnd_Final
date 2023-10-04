using JuanYunis.DataAccessLayer;
using JuanYunis.Models;
using JuanYunis.ViewModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Drawing.Drawing2D;

namespace JuanYunis.Areas.Manage.Controllers
{
    [Area("manage")]
    public class CategoryController : Controller
    {
        private readonly AppDbContext _context;

        public CategoryController(AppDbContext context)
        {
            _context = context;
        }

        //1.Index
        //2.Detail
        //3.Create(Get)
        //4.Create(Post)
        //5.Update(Get)
        //6.Update(Post)
        //7.Delete(Get)
        //8.DeleteBrand(Get)


        //1.Index
        public async Task<IActionResult> Index(int currentPage = 1)
        {
            IQueryable<Category> queries = _context.Categories
                .Include(b => b.Products.Where(p => p.IsDeleted == false))
                .Where(b => b.IsDeleted == false)
                .OrderByDescending(b => b.Id);

            return View(PageNatedList<Category>.Create(queries, currentPage, 5, 8));
        }

        //2.Detail
        public async Task<IActionResult> Detail(int? id)
        {
            if (id == null) return BadRequest();

            Category category = await _context.Categories
                .Include(b => b.Products.Where(p => p.IsDeleted == false))
                .FirstOrDefaultAsync(b => b.IsDeleted == false && b.Id == id);
            if (category == null) return NotFound();

            return View(category);
        }

        //3.Create(Get)
        public IActionResult Create()
        {
            return View();
        }

        //4.Create(Post)
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(Category category)
        {
            if (!ModelState.IsValid) return View(category);

            if (await _context.Categories.AnyAsync(b => b.IsDeleted == false && b.Name.ToLower() == category.Name.Trim().ToLower()))
            {
                ModelState.AddModelError("Name", $"{category.Name} already exists");
                return View(category);
            }

            category.Name = category.Name.Trim();

            await _context.Categories.AddAsync(category);
            await _context.SaveChangesAsync();

            return RedirectToAction(nameof(Index));
        }

        //5.Update(Get)
        public async Task<IActionResult> Update(int? id)
        {
            if (id == null) return BadRequest();

            Category category = await _context.Categories
                .FirstOrDefaultAsync(b => b.IsDeleted == false && b.Id == id);
            if (category == null) return NotFound();

            return View(category);
        }

        //6.Update(Post)
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Update(int? id, Category category)
        {
            if (id == null) return BadRequest();

            if (id != category.Id) return BadRequest();

            if (!ModelState.IsValid) return View(category);


            Category dbCatgeory = await _context.Categories
                .FirstOrDefaultAsync(b => b.IsDeleted == false && b.Id == id);

            if (dbCatgeory == null) return NotFound();


            if (await _context.Categories.AnyAsync(b => b.IsDeleted == false && b.Name.ToLower() == category.Name.Trim().ToLower() && b.Id != dbCatgeory.Id))
            {
                ModelState.AddModelError("Name", $"{category.Name} already exists");
                return View(category);
            }

            dbCatgeory.Name = category.Name.Trim();
            dbCatgeory.UpdatedBy = "User";
            dbCatgeory.UpdatedAt = DateTime.Now;

            await _context.SaveChangesAsync();

            return RedirectToAction(nameof(Index));
        }

        //7.Delete(Get)
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null) return BadRequest();

            Category category = await _context.Categories
                .Include(b => b.Products.Where(p => p.IsDeleted == false))
                .FirstOrDefaultAsync(b => b.IsDeleted == false && b.Id == id);
            if (category == null) return NotFound();

            return View(category);
        }

        //8.DeleteBrand(Get)
        public async Task<IActionResult> DeleteCategory(int? id)
        {
            if (id == null) return BadRequest();

            Category category = await _context.Categories
                .Include(b => b.Products.Where(p => p.IsDeleted == false))
                .FirstOrDefaultAsync(b => b.IsDeleted == false && b.Id == id);
            if (category == null) return NotFound();

            category.IsDeleted = true;
            category.DeletedBy = "User";
            category.DeletedAt = DateTime.Now;

            if (category.Products != null && category.Products.Count() > 0)
            {
                foreach (Product product in category.Products)
                {
                    product.CategoryId = null;
                }
            }
            await _context.SaveChangesAsync();

            return RedirectToAction(nameof(Index));
        }
    }
}
