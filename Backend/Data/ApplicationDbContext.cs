using Microsoft.EntityFrameworkCore;
using StayEase.Models; // Import the Models namespace

namespace StayEase.Data
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options) { }

        public DbSet<Hotel> Hotels { get; set; }
        public DbSet<HotelImage> HotelImages { get; set; }
        public DbSet<HotelBenefit> HotelBenefits { get; set; }
        public DbSet<HotelReview> HotelReviews { get; set; }
        public DbSet<ContactMessage> ContactMessages { get; set; }
        public DbSet<Reservation> Reservations { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            modelBuilder.Entity<Hotel>(entity =>
            {
                entity.ToTable("hotels");
                entity.HasKey(h => h.HotelCode); // Set HotelCode as the primary key
            });

            modelBuilder.Entity<HotelImage>(entity =>
            {
                entity.ToTable("hotel_images");
                entity.HasKey(i => i.ImageId); // Set ImageId as the primary key
            });

            modelBuilder.Entity<HotelBenefit>(entity =>
            {
                entity.ToTable("hotel_benefits");
                entity.HasKey(b => b.BenefitId); // Set BenefitId as the primary key
            });

            modelBuilder.Entity<HotelReview>(entity =>
            {
                entity.ToTable("hotel_reviews");
                entity.HasKey(r => r.ReviewId); // Set ReviewId as the primary key
            });

            modelBuilder.Entity<Reservation>(entity =>
            {
                entity.ToTable("reservations");
                entity.HasKey(r => r.booking_id); // Set booking_id as the primary key
                entity.Property(r => r.booking_date).IsRequired(); // Add BookingDate configuration
                entity.Property(r => r.hotel_code).HasMaxLength(255); // Configure HotelName
                entity.Property(r => r.total_fare).HasColumnType("decimal(10,2)"); // Configure TotalFare precision
            });

            modelBuilder.Entity<ContactMessage>(entity =>
            {
                entity.ToTable("contact_messages");
                entity.HasKey(c => c.Id); // Set Id as the primary key
            });

            // Define relationships
            modelBuilder.Entity<Hotel>()
                .HasMany(h => h.Images)
                .WithOne(i => i.Hotel)
                .HasForeignKey(i => i.HotelCode);

            modelBuilder.Entity<Hotel>()
                .HasMany(h => h.Benefits)
                .WithOne(b => b.Hotel)
                .HasForeignKey(b => b.HotelCode);

            modelBuilder.Entity<Hotel>()
                .HasMany(h => h.Reviews)
                .WithOne(r => r.Hotel)
                .HasForeignKey(r => r.HotelCode);

            // Define relationships for Reservation if necessary
            // For example, if you want to link Reservation to Hotel
            modelBuilder.Entity<Reservation>()
                .HasOne<Hotel>() // Assuming Reservation has a navigation property to Hotel
                .WithMany() // Assuming Hotel has many Reservations
                .HasForeignKey(r => r.hotel_code);
        }
    }
}
