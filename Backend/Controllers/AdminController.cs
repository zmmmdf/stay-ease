using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using StayEase.Data;
using StayEase.Models;

namespace RioHotel.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AdminController : ControllerBase
    {
        private readonly ApplicationDbContext _context;

        public AdminController(ApplicationDbContext context)
        {
            _context = context;
        }

        // 1. Create new hotels
        [HttpPost("hotels/create")]
        public async Task<IActionResult> CreateHotel([FromBody] Hotel hotel)
        {
            if (hotel == null)
            {
                return BadRequest("Hotel data is invalid.");
            }

            if (!ModelState.IsValid)
            {
                var errors = ModelState.Values.SelectMany(v => v.Errors).Select(e => e.ErrorMessage);
                return BadRequest(new { Errors = errors });
            }

            try
            {
                _context.Hotels.Add(hotel);
                await _context.SaveChangesAsync();
                return Ok(new { Message = "Hotel created successfully", HotelCode = hotel.HotelCode });
            }
            catch (DbUpdateException dbEx)
            {
                var innerExceptionMessage = dbEx.InnerException != null ? dbEx.InnerException.Message : "No inner exception";
                var errorMessage = $"Database update error: {dbEx.Message}\nInner Exception: {innerExceptionMessage}";
                Console.WriteLine(errorMessage);  // Or log to a file/monitoring system
                return StatusCode(500, new { Message = "Database update error occurred.", Details = errorMessage });
            }
            catch (Exception ex)
            {
                Console.WriteLine($"General error: {ex.Message}");
                return StatusCode(500, new { Message = "Internal server error.", Details = ex.Message });
            }
        }

        // 2. List all messages
        [HttpGet("messages/list_all")]
        public async Task<IActionResult> ListMessages()
        {
            var messages = await _context.ContactMessages.ToListAsync();
            return Ok(messages);
        }

        // 3. List all reservations
        [HttpGet("reservations/list_all")]
        public async Task<IActionResult> ListReservations()
        {
            var reservations = await _context.Reservations
                .Join(_context.Hotels,
                      reservation => reservation.hotel_code,
                      hotel => hotel.HotelCode,
                      (reservation, hotel) => new
                      {
                          reservation.booking_id,
                          HotelTitle = hotel.Title,
                          reservation.check_in_date,
                          reservation.check_out_date,
                          reservation.total_fare
                      })
                .ToListAsync();

            return Ok(reservations);
        }
    }
}
