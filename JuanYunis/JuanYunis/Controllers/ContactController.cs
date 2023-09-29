using Microsoft.AspNetCore.Mvc;

namespace JuanYunis.Controllers
{
    public class ContactController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
