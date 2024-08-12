-- MySQL dump 10.13  Distrib 8.3.0, for macos14.2 (arm64)
--
-- Host: localhost    Database: hotel_reservation
-- ------------------------------------------------------
-- Server version	8.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Apartments`
--

DROP TABLE IF EXISTS `Apartments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Apartments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `subtitle` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `bed_count` int DEFAULT NULL,
  `size` int NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `amenities` text,
  `BedCount` int DEFAULT NULL,
  `info` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Apartments`
--

LOCK TABLES `Apartments` WRITE;
/*!40000 ALTER TABLE `Apartments` DISABLE KEYS */;
INSERT INTO `Apartments` VALUES (1,'Ocean View Suite','Luxurious suite with ocean view',150.00,2,50,'ocean_view_suite.jpg','Ocean view, Wi-Fi, Air Conditioning, Mini Bar',2,'SAMPLEPLP  INFOOOO'),(2,'Mountain Cabin','Cozy cabin with mountain view',100.00,4,60,'mountain_cabin.jpg','Mountain view, Wi-Fi, Fireplace, Kitchen',2,'SAMPLEPLP  INFOOOO'),(3,'City Center Studio','Modern studio in the city center',80.00,1,30,'city_center_studio.jpg','City view, Wi-Fi, Air Conditioning, Kitchen',2,'SAMPLEPLP  INFOOOO'),(4,'Penthouse Suite','Exclusive penthouse with luxury amenities',250.00,3,100,'penthouse_suite.jpg','Panoramic city view, Wi-Fi, Private Pool, Spa',2,'SAMPLEPLP  INFOOOO'),(5,'Family Suite','Spacious suite ideal for families',180.00,5,70,'family_suite.jpg','Family-friendly, Wi-Fi, Kitchen, Balcony',2,'SAMPLEPLP  INFOOOO');
/*!40000 ALTER TABLE `Apartments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `apartment_id` int DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `number_of_kids` int DEFAULT NULL,
  `number_of_adults` int DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `booking_country` varchar(255) DEFAULT NULL,
  `special_requests` text,
  `total_price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `apartment_id` (`apartment_id`),
  CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`apartment_id`) REFERENCES `apartments` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` VALUES (1,1,'2024-08-01','2024-08-07',1,2,'John','Doe','john.doe@example.com','1234567890','USA','Late check-in requested',900.00),(2,2,'2024-08-10','2024-08-15',0,2,'Jane','Smith','jane.smith@example.com','0987654321','Canada','No special requests',500.00),(3,3,'2024-08-20','2024-08-25',0,1,'Emily','Johnson','emily.johnson@example.com','1122334455','UK','Early check-in requested',400.00),(4,4,'2024-09-01','2024-09-10',2,2,'Michael','Williams','michael.williams@example.com','2233445566','Australia','Honeymoon setup',2250.00),(5,5,'2024-09-15','2024-09-20',2,3,'Sarah','Brown','sarah.brown@example.com','3344556677','Germany','Pet-friendly room requested',900.00);
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_messages`
--

DROP TABLE IF EXISTS `contact_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_messages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `message` text,
  `datetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_messages`
--

LOCK TABLES `contact_messages` WRITE;
/*!40000 ALTER TABLE `contact_messages` DISABLE KEYS */;
INSERT INTO `contact_messages` VALUES (1,'Alice Walker','alice.walker@example.com','Inquiry about availability for August.','2024-07-25 10:30:00'),(2,'Bob Martin','bob.martin@example.com','Request for additional amenities in the family suite.','2024-07-26 05:15:00'),(3,'Carol Davis','carol.davis@example.com','Complaint about room cleanliness.','2024-07-27 07:45:00'),(4,'David Lee','david.lee@example.com','Booking confirmation request.','2024-07-28 12:00:00'),(5,'Eva Green','eva.green@example.com','Question about parking facilities.','2024-07-29 04:20:00'),(6,'John Doe','johndoe@example.com','I had a great stay at the RioHotel! The service was excellent.','2024-08-05 10:30:00'),(7,'Jane Smith','janesmith@example.com','Is there a possibility for a late checkout? My flight leaves in the evening.','2024-08-06 05:15:00'),(8,'Alice Johnson','alicejohnson@example.com','The Wi-Fi in my room was slow. Please look into this.','2024-08-07 07:45:00'),(9,'Michael Brown','michaelbrown@example.com','I would like to book an apartment for next month. Can you assist?','2024-08-08 12:20:00'),(10,'Emily Davis','emilydavis@example.com','Thank you for the wonderful experience. I will definitely return!','2024-08-09 04:50:00');
/*!40000 ALTER TABLE `contact_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel_benefits`
--

DROP TABLE IF EXISTS `hotel_benefits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotel_benefits` (
  `BenefitId` int NOT NULL AUTO_INCREMENT,
  `HotelCode` int DEFAULT NULL,
  `Benefit` varchar(255) NOT NULL,
  PRIMARY KEY (`BenefitId`),
  KEY `HotelCode` (`HotelCode`),
  CONSTRAINT `hotel_benefits_ibfk_1` FOREIGN KEY (`HotelCode`) REFERENCES `Hotels` (`HotelCode`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel_benefits`
--

LOCK TABLES `hotel_benefits` WRITE;
/*!40000 ALTER TABLE `hotel_benefits` DISABLE KEYS */;
INSERT INTO `hotel_benefits` VALUES (1,71222,'Free cancellation'),(2,71222,'No prepayment needed – pay at the property'),(3,71223,'Free cancellation'),(4,71223,'No prepayment needed – pay at the property'),(5,71223,'Free wifi'),(6,71223,'Free lunch');
/*!40000 ALTER TABLE `hotel_benefits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel_images`
--

DROP TABLE IF EXISTS `hotel_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotel_images` (
  `ImageId` int NOT NULL AUTO_INCREMENT,
  `HotelCode` int DEFAULT NULL,
  `ImageUrl` varchar(255) NOT NULL,
  `AccessibleText` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ImageId`),
  KEY `HotelCode` (`HotelCode`),
  CONSTRAINT `hotel_images_ibfk_1` FOREIGN KEY (`HotelCode`) REFERENCES `Hotels` (`HotelCode`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel_images`
--

LOCK TABLES `hotel_images` WRITE;
/*!40000 ALTER TABLE `hotel_images` DISABLE KEYS */;
INSERT INTO `hotel_images` VALUES (1,71222,'/images/hotels/481481762/481481762.jpg','hyatt pune hotel'),(2,71222,'/images/hotels/481481762/525626081.jpg','hyatt pune hotel'),(3,71222,'/images/hotels/481481762/525626095.jpg','hyatt pune hotel'),(4,71222,'/images/hotels/481481762/525626104.jpg','hyatt pune hotel'),(5,71222,'/images/hotels/481481762/525626212.jpg','hyatt pune hotel'),(6,71223,'/images/hotels/465660377/465660377.jpg','Courtyard by Marriott Pune'),(7,71224,'/images/hotels/516847915/516847915.jpg','rio sample hotel exterior');
/*!40000 ALTER TABLE `hotel_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel_reviews`
--

DROP TABLE IF EXISTS `hotel_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotel_reviews` (
  `ReviewId` int NOT NULL AUTO_INCREMENT,
  `HotelCode` int DEFAULT NULL,
  `ReviewerName` varchar(255) DEFAULT NULL,
  `Rating` int DEFAULT NULL,
  `Review` text,
  `Date` date DEFAULT NULL,
  `Verified` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ReviewId`),
  KEY `HotelCode` (`HotelCode`),
  CONSTRAINT `hotel_reviews_ibfk_1` FOREIGN KEY (`HotelCode`) REFERENCES `Hotels` (`HotelCode`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel_reviews`
--

LOCK TABLES `hotel_reviews` WRITE;
/*!40000 ALTER TABLE `hotel_reviews` DISABLE KEYS */;
INSERT INTO `hotel_reviews` VALUES (1,71222,'Rahul Patel',5,'The hotel is very good and the staff is very friendly. The food is also very good.','2021-01-01',1),(2,71222,'Sara Johnson',3,'Great hotel with excellent service. The rooms are spacious and clean. The staff went above and beyond to ensure a comfortable stay. Highly recommended!','2021-02-15',0),(3,71223,'Alex Smith',4,'The hotel was comfortable, but the service could be improved. Overall, a decent stay.','2024-08-10',1),(8,71224,'Carlos Silva',4,'Great location near the beach, friendly staff, and clean rooms. Would stay again!','2022-05-10',1),(9,71224,'Maria Fernandes',5,'Absolutely loved the pool and the view of Copacabana from our room. Highly recommend this hotel.','2022-06-22',1);
/*!40000 ALTER TABLE `hotel_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Hotels`
--

DROP TABLE IF EXISTS `Hotels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Hotels` (
  `HotelCode` int NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) NOT NULL,
  `Subtitle` varchar(255) DEFAULT NULL,
  `Price` decimal(10,2) NOT NULL,
  `Ratings` int NOT NULL,
  `City` varchar(255) NOT NULL,
  PRIMARY KEY (`HotelCode`)
) ENGINE=InnoDB AUTO_INCREMENT=71225 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Hotels`
--

LOCK TABLES `Hotels` WRITE;
/*!40000 ALTER TABLE `Hotels` DISABLE KEYS */;
INSERT INTO `Hotels` VALUES (71222,'Hyatt Pune','Kalyani Nagar, Pune | 3.3 kms from city center',500.00,5,'pune'),(71223,'Courtyard by Marriott Pune Hinjewadi','500 meters from the Rajiv Gandhi Infotech Park',300.00,4,'rio de janeiro'),(71224,'Rio Sample Hotel','Copacabana, Rio de Janeiro | 2.5 kms from city center',300.00,4,'rio de janeiro');
/*!40000 ALTER TABLE `Hotels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservations`
--

DROP TABLE IF EXISTS `reservations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservations` (
  `booking_id` int NOT NULL AUTO_INCREMENT,
  `booking_date` date DEFAULT NULL,
  `hotel_code` int DEFAULT NULL,
  `check_in_date` date DEFAULT NULL,
  `check_out_date` date DEFAULT NULL,
  `total_fare` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`booking_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservations`
--

LOCK TABLES `reservations` WRITE;
/*!40000 ALTER TABLE `reservations` DISABLE KEYS */;
INSERT INTO `reservations` VALUES (1,'2024-08-10',71222,'2024-08-15','2024-08-20',2500.00),(2,'2024-08-12',71222,'2024-08-21','2024-08-24',1500.00),(3,'2024-08-12',71222,'2024-08-25','2024-08-27',1000.00);
/*!40000 ALTER TABLE `reservations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-12 10:43:05
