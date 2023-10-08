using System.ComponentModel.DataAnnotations;

namespace JuanYunis.ViewModels
{
    public class ForgotPasswordVM
    {
        [EmailAddress]
        public string Email { get; set; }
    }
}
