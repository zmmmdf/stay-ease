import React from 'react';

/**
 * AboutUs component
 * @returns {jsx}
 */
const AboutUs = () => {
  return (
    <div className="container mx-auto px-4 py-8">
      <h1 className="text-4xl font-extrabold text-brand mb-2">About Us</h1>
      <p className="text-lg mb-8">
        Welcome to <span className="text-brand">StayEase</span>, your trusted partner in finding the perfect hotel stay. We are committed to delivering an exceptional booking experience, ensuring that your travels are smooth and enjoyable.
      </p>

      <h2 className="text-3xl font-extrabold text-brand mb-2">Our Mission</h2>
      <p className="text-lg mb-8">
        At <span className="text-brand">StayEase</span>, our mission is to simplify hotel bookings and enhance your travel experiences. We strive to provide a seamless platform that connects you with the best accommodations tailored to your preferences.
      </p>

      <h2 className="text-3xl font-extrabold text-brand mb-2">What Sets Us Apart</h2>
      <ul className="list-disc ml-6 mb-8">
        <li className="text-lg mb-3">
          Discover a wide variety of lodging options, from high-end hotels to charming boutique stays, designed to suit all preferences and budgets.
        </li>
        <li className="text-lg mb-3">
          Enjoy our intuitive platform that makes booking quick and effortless. Find and book your ideal stay with just a few easy steps.
        </li>
        <li className="text-lg mb-3">
          Our responsive support team is available around the clock to assist you with any questions or concerns, ensuring a stress-free booking process.
        </li>
        <li className="text-lg mb-3">
          Your privacy and security are our top priorities. Trust that your personal information and transactions are protected with the highest standards.
        </li>
      </ul>

      <h2 className="text-3xl font-extrabold text-brand mb-2">Get in Touch</h2>
      <p className="text-lg mb-4">
        Have any questions or need support? Contact our team at{' '}
        <a
          className="text-brand hover:underline"
          href="mailto:support@stayease.com"
        >
          support@stayease.com
        </a>
        . We’re here to assist you!
      </p>
      <p className="text-lg">
        Thank you for choosing <span className="text-brand">StayEase</span>. We are excited to help you find the perfect accommodations for your next trip.
      </p>
    </div>
  );
};

export default AboutUs;
