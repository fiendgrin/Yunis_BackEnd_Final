﻿using Microsoft.AspNetCore.Identity;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace JuanYunis.Models
{
    public class AppUser : IdentityUser
    {
        [NotMapped]
        public IList<string> Roles { get; set; }
        public bool IsActive { get; set; }
        [StringLength(255)]
        public string? Name { get; set; }
        [StringLength(255)]
        public string? SurName { get; set; }
    }
}
