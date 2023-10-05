﻿using System.ComponentModel.DataAnnotations;

namespace JuanYunis.Areas.Manage.ViewModels.AccountVMs
{
    public class LoginVM
    {
        [EmailAddress]
        public string Email { get; set; }
        [DataType(DataType.Password)]
        public string Password { get; set; }

        public bool RememberMe { get; set; }
    }
}
