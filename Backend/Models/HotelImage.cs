namespace StayEase.Models
{
    public class HotelImage
    {
        public int ImageId { get; set; }
        public int HotelCode { get; set; }
        public string ImageUrl { get; set; }
        public string AccessibleText { get; set; }
        public Hotel Hotel { get; set; } // Navigation property
    }
}
