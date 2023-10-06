using System.ComponentModel.DataAnnotations;

namespace JuanYunis.Areas.Manage.ViewModels
{
    public class ForgotPasswordVM
    {
        [EmailAddress]
        public string Email { get; set; }
    }
}
