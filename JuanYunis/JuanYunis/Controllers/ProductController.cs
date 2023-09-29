using Microsoft.AspNetCore.Mvc;

namespace JuanYunis.Controllers
{
    public class ProductController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
