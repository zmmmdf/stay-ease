using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using StayEase.Data;
using StayEase.DTOs;
using System.Linq;
using System.Threading.Tasks;

namespace RioHotel.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class HotelsController : ControllerBase
    {
        private readonly ApplicationDbContext _context;

        public HotelsController(ApplicationDbContext context)
        {
            _context = context;
        }

        [HttpGet("list_all")]
        public async Task<IActionResult> ListAll()
        {
            var hotels = await _context.Hotels
                .Include(h => h.Images)
                .Include(h => h.Benefits)
                .Include(h => h.Reviews)
                .ToListAsync();

            var hotelDtos = hotels.Select(h => new HotelDTO
            {
                HotelCode = h.HotelCode,
                Title = h.Title,
                Subtitle = h.Subtitle,
                Price = h.Price,
                Ratings = h.Ratings,
                City = h.City,
                Images = h.Images.Select(i => new HotelImageDTO
                {
                    ImageUrl = i.ImageUrl,
                    AccessibleText = i.AccessibleText
                }).ToList(),
                Benefits = h.Benefits.Select(b => b.Benefit).ToList(),
                Reviews = new HotelReviewsDTO
                {
                    Data = h.Reviews.Select(r => new HotelReviewDTO
                    {
                        ReviewerName = r.ReviewerName,
                        Rating = r.Rating,
                        Review = r.Review,
                        Date = $"Date of stay: {r.Date:yyyy-MM-dd}",
                        Verified = r.Verified
                    }).ToList()
                }
            }).ToList();

            return Ok(hotelDtos);
        }

        [HttpGet("{hotelCode}")]
        public async Task<IActionResult> GetHotel(int hotelCode)
        {
            var hotel = await _context.Hotels
                .Include(h => h.Images)
                .Include(h => h.Benefits)
                .Include(h => h.Reviews)
                .FirstOrDefaultAsync(h => h.HotelCode == hotelCode);

            if (hotel == null)
            {
                return NotFound("Hotel not found.");
            }

            var hotelDto = new HotelDTO
            {
                HotelCode = hotel.HotelCode,
                Title = hotel.Title,
                Subtitle = hotel.Subtitle,
                Price = hotel.Price,
                Ratings = hotel.Ratings,
                City = hotel.City,
                Images = hotel.Images.Select(i => new HotelImageDTO
                {
                    ImageUrl = i.ImageUrl,
                    AccessibleText = i.AccessibleText
                }).ToList(),
                Benefits = hotel.Benefits.Select(b => b.Benefit).ToList(),
                Reviews = new HotelReviewsDTO
                {
                    Data = hotel.Reviews.Select(r => new HotelReviewDTO
                    {
                        ReviewerName = r.ReviewerName,
                        Rating = r.Rating,
                        Review = r.Review,
                        Date = $"Date of stay: {r.Date:yyyy-MM-dd}",
                        Verified = r.Verified
                    }).ToList()
                }
            };

            return Ok(hotelDto);
        }
    }
}
