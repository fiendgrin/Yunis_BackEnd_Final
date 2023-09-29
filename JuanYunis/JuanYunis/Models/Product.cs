﻿using Microsoft.EntityFrameworkCore.Metadata.Internal;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace JuanYunis.Models
{
    public class Product : BaseEntity
    {
        [StringLength(255)]
        public string Title { get; set; }
        [Column(TypeName = "money")]
        public double Price { get; set; }
        [Column(TypeName = "money")]
        public double DiscountedPrice { get; set; }
        [Column(TypeName = "money")]
        public double EcoTax { get; set; }
        [Range(0, int.MaxValue)]
        public int Count { get; set; }
        [StringLength(1000)]
        public string SmallDescription { get; set; }
        [StringLength(5000)]
        public string FullDescription { get; set; }
        public bool IsTopSeller { get; set; }
        public bool IsOurProduct { get; set; }

        public int CategoryId { get; set; }
        public Category Category { get; set; }


    }
}
