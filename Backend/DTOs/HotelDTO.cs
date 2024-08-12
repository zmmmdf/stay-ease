namespace StayEase.DTOs
{
    public class HotelDTO
    {
        public int HotelCode { get; set; }
        public string Title { get; set; }
        public string Subtitle { get; set; }
        public decimal Price { get; set; }
        public int Ratings { get; set; }
        public string City { get; set; }
        public List<HotelImageDTO> Images { get; set; }
        public List<string> Benefits { get; set; }
        public HotelReviewsDTO Reviews { get; set; }
    }
}