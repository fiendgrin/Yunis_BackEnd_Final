using Microsoft.AspNetCore.Mvc;

namespace JuanYunis.Controllers
{
    public class BlogController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
