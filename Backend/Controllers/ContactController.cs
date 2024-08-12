using Microsoft.AspNetCore.Mvc;
using StayEase.Data;
using StayEase.Models;

namespace RioHotel.Controllers;

[ApiController]
[Route("api/[controller]")]
public class ContactController : ControllerBase
{
    private readonly ApplicationDbContext _context;

    public ContactController(ApplicationDbContext context)
    {
        _context = context;
    }

    [HttpPost]
    public async Task<IActionResult> SaveMessage([FromBody] ContactMessage message)
    {
        _context.ContactMessages.Add(message);
        await _context.SaveChangesAsync();
        return Ok(message);
    }
}