using JuanYunis.Areas.Manage.ViewModels.OrderVMs;
using JuanYunis.DataAccessLayer;
using JuanYunis.Enums;
using JuanYunis.Models;
using JuanYunis.ViewModels;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace JuanYunis.Areas.Manage.Controllers
{
    [Area("Manage")]
    [Authorize(Roles = "SuperAdmin, Admin")]
    public class OrderController : Controller
    {
        private readonly AppDbContext _context;
        public OrderController(AppDbContext context) 
        {
            _context = context;
        }
        public IActionResult Index(int currentPage = 1)
        {
            IQueryable<Order> queries = _context.Orders
                .Include(o => o.OrderProducts.Where(op => op.IsDeleted == false))
                .Where(o => o.IsDeleted == false);
            return View(PageNatedList<Order>.Create(queries,currentPage,5,10));
        }

        public async Task<IActionResult> Detail(int? id)
        {
            if (id == null)
            {
                return BadRequest();
            }
            Order order = await _context.Orders
                .Include(o=>o.User)
                .Include(o => o.OrderProducts.Where(op => op.IsDeleted == false))
                .ThenInclude(op=>op.Product).ThenInclude(p=>p.ProductImages.Where(pi=>pi.IsDeleted == false))
                .FirstOrDefaultAsync(o=>o.IsDeleted == false && o.Id == id);

            if (order == null)
            {
                return NotFound();
            }
            return View(order);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Update(OrderVM orderVM) 
        {

            Order dbOrder = await _context.Orders
              .FirstOrDefaultAsync(o => o.IsDeleted == false && o.Id == orderVM.Id);

            if (dbOrder == null) return NotFound();

            if (!ModelState.IsValid) 
            {
                return View("Detail", dbOrder);
            }

            dbOrder.Comment = orderVM.Comment;
            dbOrder.Status = orderVM.Status;

            await _context.SaveChangesAsync();

            return RedirectToAction(nameof(Index));
        }
    }
}
