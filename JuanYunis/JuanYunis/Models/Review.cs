using JuanYunis.Enums;

namespace JuanYunis.Models
{
    public class Review : BaseEntity
    {
        public string? Comment { get; set; }
        public Rating Rating { get; set; }
        public string? UserId { get; set; }
        public AppUser? User { get; set; }
        public int? ProductId { get; set; }
        public Product? Product { get; set; }
    }
}
