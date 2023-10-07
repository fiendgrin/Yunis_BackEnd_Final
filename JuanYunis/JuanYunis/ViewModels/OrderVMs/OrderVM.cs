using JuanYunis.Models;
using JuanYunis.ViewModels.BasketVMs;

namespace JuanYunis.ViewModels.OrderVMs
{
    public class OrderVM
    {
        public Order Order { get; set; }
        public IEnumerable<BasketVM>? BasketVMs { get; set; }
    }
}
