using JuanYunis.Models;

namespace JuanYunis.ViewModels.HomeVMs
{
    public class HomeVM
    {
        public IEnumerable<Slider> Sliders { get; set; }
        public IEnumerable<Product> OurProducts { get; set; }
        public IEnumerable<Product> TopSellers { get; set; }
    }
}
