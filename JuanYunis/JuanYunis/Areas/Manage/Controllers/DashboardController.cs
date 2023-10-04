using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace JuanYunis.Areas.Manage.Controllers
{
    public class DashboardController : Controller
    {
        [Area("Manage")]
        public IActionResult Index()
        {
            return View();
        }
    }
}
