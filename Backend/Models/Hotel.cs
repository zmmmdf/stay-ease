namespace StayEase.Models
{
    public class Hotel
    {
        public int HotelCode { get; set; }
        public string Title { get; set; }
        public string Subtitle { get; set; }
        public decimal Price { get; set; }
        public int Ratings { get; set; }
        public string City { get; set; }
        public List<HotelImage> Images { get; set; }
        public List<HotelBenefit> Benefits { get; set; }
        public List<HotelReview> Reviews { get; set; }
    }
}