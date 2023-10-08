using JuanYunis.Models;

namespace JuanYunis.ViewModels.AccountVMs
{
    public class ProfileVM
    {
        public ProfileAccountVM ProfileAcoountVM { get; set; }

        public IEnumerable<Address> Addresses { get; set; }
        public IEnumerable<Order> Orders { get; set; }

        public Address Address { get; set; }
    }
}
