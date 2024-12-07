using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace WatchStore.Models
{
    [Table("Stores")]
    public class Stores
    {
        
        [Key]
        public int Id { get; set; }

        [Required]
        [StringLength(500)] // Adjust the length as needed
        public string Address { get; set; }

        [Required]
        public double Latitude { get; set; }

        [Required]
        public double Longitude { get; set; }

        [Required]
        public string OpenHours { get; set; }

        public string Description { get; set; }

        public string MenuUrl { get; set; }

        public string DeliveryUrl { get; set; }

        
        public DateTime? Created_at { get; set; }
        public int? Created_by { get; set; }

        public DateTime? Updated_at { get; set; }
        public int? Updated_by { get; set; }


        public int? Status { get; set; }
    }
}
