namespace StayEase.DTOs
{
    public class HotelReviewDTO
    {
        public string ReviewerName { get; set; }
        public int Rating { get; set; }
        public string Review { get; set; }
        public string Date { get; set; }
        public bool Verified { get; set; }
    }
}