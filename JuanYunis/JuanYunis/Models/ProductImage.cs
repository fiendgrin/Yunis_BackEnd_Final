using System.ComponentModel.DataAnnotations;

namespace JuanYunis.Models
{
    public class ProductImage:BaseEntity
    {
        [StringLength(255)]
        public string Image { get; set; }
        public bool IsMainImage { get; set; }

        public int ProductId { get; set; }
        public Product Product { get; set; }
    }
}
