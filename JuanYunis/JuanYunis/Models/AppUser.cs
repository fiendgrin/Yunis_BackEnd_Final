using Microsoft.AspNetCore.Identity;
using System.ComponentModel.DataAnnotations;

namespace JuanYunis.Models
{
    public class AppUser : IdentityUser
    {
        public bool IsActive { get; set; }
        [StringLength(255)]
        public string? Name { get; set; }
        [StringLength(255)]
        public string? SurName { get; set; }
    }
}
