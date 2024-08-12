namespace StayEase.Models
{
    public class Reservation
    {
        public int booking_id { get; set; } // Changed from Id to booking_id
        public DateTime booking_date { get; set; } // Added BookingDate
        public int hotel_code { get; set; } // Changed from ApartmentId to HotelCode
        public DateTime check_in_date { get; set; }
        public DateTime check_out_date { get; set; }
        public decimal total_fare { get; set; } // Changed from TotalPrice to TotalFare_
    }
}