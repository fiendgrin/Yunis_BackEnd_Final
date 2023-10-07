using Microsoft.EntityFrameworkCore.Metadata.Internal;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace JuanYunis.Models
{
    public class OrderProduct : BaseEntity
    {
        [StringLength(255)]
        public string Title { get; set; }
        [Column(TypeName = "money")]
        public double Price { get; set; }
        [Range(0, int.MaxValue)]
        public int Count { get; set; }
        [Column(TypeName = "money")]
        public double EcoTax { get; set; }


        public int? ProductId { get; set; }
        public Product? Product { get; set; }
        public int? OrderId { get; set; }
        public Order? Order { get; set; }
    }
}
