using System.ComponentModel.DataAnnotations;

namespace JuanYunis.Models
{
    public class Slider : BaseEntity
    {
        [StringLength(255)]
        public string Image { get; set; }
        [StringLength(1000)]
        public string Text { get; set; }
        [StringLength(100)]
        public string BtnText { get; set; }
        [StringLength(255)]
        public string Link { get; set; }
    }
}
