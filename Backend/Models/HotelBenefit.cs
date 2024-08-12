namespace StayEase.Models
{
    public class HotelBenefit
    {
        public int BenefitId { get; set; }
        public int HotelCode { get; set; }
        public string Benefit { get; set; }
        public Hotel Hotel { get; set; } // Navigation property
    }
}