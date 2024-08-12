using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using StayEase.Data;
using StayEase.Models;

namespace RioHotel.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ReservationsController : ControllerBase
    {
        private readonly ApplicationDbContext _context;

        public ReservationsController(ApplicationDbContext context)
        {
            _context = context;
        }

        [HttpPost("create")]
        public async Task<IActionResult> CreateReservation([FromBody] Reservation reservation)
        {
            if (reservation == null)
            {
                return BadRequest("Invalid reservation data.");
            }

            try
            {
                if (!ModelState.IsValid)
                {
                    return BadRequest(ModelState);
                }

                // Set booking date to current date if not provided
                reservation.booking_date = reservation.booking_date == default ? DateTime.UtcNow.Date : reservation.booking_date;

                // Add reservation to the context
                _context.Reservations.Add(reservation);
                await _context.SaveChangesAsync();

                // Return a successful response with the reservation ID
                return Ok(new { success = true, reservationId = reservation.booking_id });
            }
            catch (DbUpdateException dbEx)
            {
                Console.WriteLine(dbEx.InnerException?.Message ?? dbEx.Message);
                return StatusCode(500, "An error occurred while saving the reservation.");
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.InnerException?.Message ?? ex.Message);
                return StatusCode(500, "An unexpected error occurred.");
            }
        }

        [HttpGet("list/{hotelCode}")]
        public async Task<IActionResult> ListReservations(int hotelCode)
        {
            try
            {
                var reservations = await _context.Reservations
                    .Join(_context.Hotels,
                          reservation => reservation.hotel_code,
                          hotel => hotel.HotelCode,
                          (reservation, hotel) => new
                          {
                              reservation.booking_id,
                              reservation.hotel_code,
                              reservation.check_in_date,
                              reservation.check_out_date,
                              reservation.total_fare
                          })
                    .Where(r => r.hotel_code == hotelCode)
                    .ToListAsync();

                if (reservations == null || reservations.Count == 0)
                {
                    return NotFound("No reservations found for the given hotel code.");
                }

                return Ok(reservations);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.InnerException?.Message ?? ex.Message);
                return StatusCode(500, "An error occurred while retrieving the reservations.");
            }
        }
    }
}
