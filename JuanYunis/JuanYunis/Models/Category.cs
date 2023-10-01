using System.ComponentModel.DataAnnotations;

namespace JuanYunis.Models
{
    public class Category:BaseEntity
    {
        [StringLength(100)]
        public string Name { get; set; }

        IEnumerable<Product> products { get; set; }
    }
}
