using JuanYunis.DataAccessLayer;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace JuanYunis.ViewComponents
{
    public class CategoryViewComponent : ViewComponent
    {
        private readonly AppDbContext _context;

        public CategoryViewComponent(AppDbContext context)
        {
            _context = context;
        }

        public async Task<IViewComponentResult> InvokeAsync()
        {
            return View(await _context.Categories
                .Include(c=>c.Products.Where(p=>p.IsDeleted == false))
                .Where(c => c.IsDeleted == false).ToListAsync());
        }
    }
}
