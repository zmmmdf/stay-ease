namespace StayEase.Models
{
    public class HotelReview
    {
        public int ReviewId { get; set; }
        public int HotelCode { get; set; }
        public string ReviewerName { get; set; }
        public int Rating { get; set; }
        public string Review { get; set; }
        public DateTime Date { get; set; }
        public bool Verified { get; set; }
        public Hotel Hotel { get; set; } // Navigation property
    }
}