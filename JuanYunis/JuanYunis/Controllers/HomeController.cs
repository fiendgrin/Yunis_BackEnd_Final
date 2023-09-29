using Microsoft.AspNetCore.Mvc;

namespace JuanYunis.Controllers
{
    public class HomeController : Controller
    {
        public async Task<IActionResult>  Index()
        {
            return View();
        }
    }
}
