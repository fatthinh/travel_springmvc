-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: traveldb
-- ------------------------------------------------------
-- Server version	8.2.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `activity`
--

DROP TABLE IF EXISTS `activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity` (
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `transport` enum('PLANE','LIMOUSINE','FERRY') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `price` double DEFAULT NULL,
  `destination` int DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `destination` (`destination`),
  CONSTRAINT `activity_ibfk_1` FOREIGN KEY (`destination`) REFERENCES `destination` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity`
--

LOCK TABLES `activity` WRITE;
/*!40000 ALTER TABLE `activity` DISABLE KEYS */;
INSERT INTO `activity` VALUES ('Hiking 500 steps to the top of the mountain to enjoy the breaktaking views of river, mountain and Ninh Binh City - Visit dry Cave - Visit lotus farm with colorful flowers with amazing photos.',NULL,12,4,9,'Mua Caves'),('Having sampan boat trip on Ngo Dong River to pass three water caves, among limestone mountains by local rowers.',NULL,18,4,10,'Tam Coc'),('Visit an ancient pagoda, was built in 1428 in the village. Climb 200 steps to see three parts of pagoda: the lower pagoda at the foot of mountain, the middle pagoda at the half of mountain and the top pagoda on the top of mountain.',NULL,22,4,11,'Bich Dong Pagoda'),('Visit the first ancient capital of Vietnam in 10th and 11th century. Walk about 50 minutes to see King temples.',NULL,16,4,12,' Hoa Lu District'),('7.15 â 07:40: Pick up guests in hotels from Hanoi Old Quarter 09:20: Arrive at Hoa Lu ancient capital, Visit Dinh King temple 11:00: Visit Mua Cave and enjoy the breathtaking panoramic river and mountains view by climb 500 steps up tp Lying Dragon Mountain 12:30: Enjoy traditional Vietnamese set menu lunch at local Bungalow 13:30: Enjoy a sampan boat trip in Tam Coc, passing through three caves: Hang Ca- Frist cave, Hang Hai â the second cave and Hang Ba- third Cave. 15:30: Cycle through the rice fields and villages to visit Bich Dong Pagoda 16:00: Visit the ancient pagoda- Bich Dong was built in 1428 16: 45: Leave Tam Coc for Hanoi after having a fair-well drink 19:00: The tour is ended in Hanoi.',NULL,27,4,13,'Hoa Lu temples of the Dinh & Le Dynasties'),('7:30AM-8AM The bus & tour guide will pick you up from Hanoi Old Quarter Uncover the cultural and natural heritage of the Ninh Binh province on a guided day trip from Hanoi. Pay a visit to the Bai Dinh Temple Complex, float through the tranquil rivers of Trang An, and climb to the top of Mua Caves for striking panoramic views of rocky hills. Get picked up from your hotel in Hanoi and depart toward Ninh Binh. Stop at Bai Dinh, the biggest complex of Buddhist temples in Vietnam, to gaze at the imposing pagoda. Take a Lunch. Continue to the Trang An Landscape Complex, a UNESCO World Heritage Site featured in the 2017 movie Kong Hop on a wooden boat to navigate through its quiet rivers, discover mysterious caves, and admire towering limestone karsts covered with tropical plants. Finally, climb up 500 steps to the viewpoint of Mua Caves to marvel at panoramic views of Tam Coc. You will later spend the night at a Ninh Binh Bungalow. 19:00 Dinner serve at Ninh Binh Bungalow.',NULL,32,4,14,'Ninh Binh 01'),('07:20 â 07:50 - Driver and tour guide will pick you at hotel in Hanoi Old Quarter 10:45 â Visit Hoa Lu Ancient Citadel with Dinh King Temple and Le King Temple dating back to the 17th Century. 12:00 â Enjoy the lunch at our restaurant with the great local cuisines. 13:30 â Leave for the Trang An Grottoes, an out-standing natural beauty of majestic limestone massif at 20 square kilometer rise dramatically out from rice paddy fields. Deep into the linked chains of towering mountain are pristine places of mystical valleys, numerous fresh water ponds, and jungle. Embark on a traditional sampan gently rowed down the exquisite river through numerous caves: Lam Cave, Vang Cave, Dai Cave, Thanh Truot Cave,...and Cao SÆ¡n Temple, Suoi Tien Temple, Vu Lam Templeâ¦ 15:30 â Arrive Mua Cave and start an amazing trek up to the top of Ngoa Long mountain for watching the spectacular rice valley with specious view of the nature. 17:15 â Transfer to Ninh Binh Bungalow and stay overnight at Bungalow.',NULL,30,4,15,'Ninh Binh 02'),('07h30 â 7h50: Pick up from your hotel in the Old Quarter area and departure for Ninh Binh. 10h00- 10h30: Arrive at Hoa Lu, the ancient capital of Vietnam in the 10th century, visit the temple of King Dinh and King Le. Under the introduction of our local guide, you will get to know more about the Vietnamese history. Taking a bike and start riding to explore the beautiful scenery and limestone mountains with an unique route. 12h00: Enjoy buffet lunch at a local restaurant 13h30: Visit Tam Coc by a Sampan boat rowed by a local people for about 1.5 hours. Known as âHalong Bay on landâ, the boat trip is a nice journey along the river with the peaceful scenery of Limestone Mountains, rice paddy if traveling during harvest season. 15h45: Get back to Limousine Bus then leave for Mua Cave. Walk up almost 500 steps, you can reach the top of Lying Dragon Mountain & have an amazing panoramic view of Tam Coc from here 17h00- 17h30: Drop off at Ninh Binh Bungalow and stay overnight here.',NULL,48,4,16,'Ninh Binh 03'),('Discovery Trang An',NULL,12,4,17,'Trang An Landscape Complex'),('7:00-7:30 am After breakfast the Limousine bus will pick you up at Bungalow and transfer to Halong Bay. Embark at Halong Port. Enjoy a welcoming drink and cruise briefing. Have lunch while cruising to Bai Tu Long Bay, admiring the fascinating rock formations in the bay. Visiting Thien Canh Son Cave with many interesting stalactite and stalagmite in different amazing shapes â¦Enjoy sunbathing or spending 30 minutes for kayaking to discovering of Bai Tu Long Bay landscape. Join cooking class with professional chef and also enjoy with sunset party during time sunset in Halong Bay. Vietnamese seafood style set dinner is served on board. Take some leisure time to enjoy chatting at the bar or enjoy some night squids fishing. Stay overnight on the cruise. Discovery Bai Tu Long Bay which is quiet area and less tourist boat.',NULL,18,7,18,'Bai Tu Long Bay'),('07:00 - 7:30AM The Limousine bus will pick you up at Ninh Binh Bungalow and transfer to Halong. 12:00 Boarding time, check in your cabin. Followed by activities such as: boarding the Cruise for departure, Welcome drink will be served and cruise briefing, safety instructions 13:30 Great lunch is served while cruising passing by islets. 15:30 Kayaking around Luon Cave about an hour, then visit Titop Island. Free choice of activities such as sunbathing, swimming and conquering the peak of the biggest island in Halong and taking panoramic photos of Halong bay. The back to cruise for looking sunset and relaxing 18.00 Cooking Class. Our Chef will demonstrate the preparation of a particular Vietnamese cuisine in the dining room. Our guide will let you know what item will be prepared and will explain the process during the demonstration. 19:30 Luxury set menu dinner is served with variety of Vietnamese and Asian foods 21:00 Joining the squid fishing on boat Overnight on Cruises.',NULL,52,7,19,'Halong Bay'),('07h00 - 07h30: The Limousine bus will pick you up at the Bungalow and transfer to Halong Bay. Embark at the Port. Enjoy a welcoming drink and cruise briefing. Have lunch while cruising to through Da Chong Islet, Con Vit Islet many other islands. The Cruise sails through Lan Ha Bay and completes its entry through Cua Van Area. The area is surrounding of extraordinary limestone karsts landscapes. Kayaking and/or enjoy swimming in the crystal clear waters of the Bay:, there are 2 options depend about tide. Option 1: visit Ba Trai Dao Beach about an hour kayaking in Tra Bau Area of Lan Ha Bay - a quiet tourist paradise. Option 2: Visit Dark Cave & Bright Cave by bamboo boat or kayaking to the Dark & Bright Cave about an hour. Enjoy the complimentary sunset party on the sundeck with local wine and fresh fruits. Dinner is served on board. Take some leisure time to enjoy chatting at the bar/sundeck, Squid Fishing, Relaxing and overnight on the cruise.',NULL,24,7,20,'Lan Ha Bay'),('The beautiful Cave Bai Tu Long Bay',NULL,10,7,21,' Thien Canh Son Cave'),('Around 8:00AM. We depart from Ho Chi Minh City to Mekong Delta region. Sit back, relax and enjoy the landscapes and scenery of green rice fields along the way. The first stop is Vinh Trang pagoda. Take some time to explore this beautiful temple. Continue your trip to My Tho and take a boat cruise along the Mekong River where you can escape the busy town. Enjoy a sampan ride through the coconut trees-lined canals. Disembark and explore the village on foot. Visit local families where you can enjoy fruits, honey tea and wine while listening to traditional music performed by the villagers. Enjoy a local lunch.',NULL,47,9,22,'My Tho'),('The boat cruises to Ben Tre province known as \"The Land of Coconut\" where you can tour a coconut farm and witness the process of making coconut candy, rice paper, and other coconut-based products. In the afternoon, head to Can Tho City â the heart of the Mekong Delta region. Check-in hotel, free time to explore the city at night.',NULL,52,9,23,'Ben Tre'),('Start your day at around 6:00AM to visit the famous Cai Rang Floating Market. The market is most vibrant in the early hours of the morning. Witness the hustle and bustle of boats selling fruits, vegetables, and various local products. During your boat tour, make a pit stop at one of the boats selling vermicelli and coffee. You can choose to buy and enjoy these local delicacies while soaking in the unique atmosphere of the market. Continue your boat tour to visit a Rice Noodle Factory. Here, you can witness the traditional process of making rice noodles.',NULL,62,9,24,'Cai Rang Floating Market'),('We\'ll also take some time to explore a bustling local market, where colorful stalls are brimming with fresh produce, spices, and vegetables. Around 9:00AM to 9:30AM: Return to your hotel for check-out, enjoy breakfast and freshening up after the morning\'s activities. After that, begin your journey back to Ho Chi Minh City. En route, make a stop at the 10 Vo ancient house. Explore this historic Vietnamese house, learn about its architectural details, and gain insights into local traditions and customs. Try your hand at making traditional Vietnamese pancakes, known as \"bÃ¡nh xÃ¨o.\" This hands-on experience will give you a taste of the local culture. Enjoy a local lunch. If you have the energy, take a leisurely bike ride around the area, exploring the picturesque surroundings and interacting with the local community. After your day of exploration, make your way back to Ho Chi Minh City. Arrive at around 4:00PM approximately.',NULL,32,5,25,'Back to HCM'),('The Saigon Opera House, a stunning architectural gem in the heart of Ho Chi Minh City, stands as a testament to the city\'s rich cultural heritage and vibrant arts scene. Built in 1897 by French architect EugÃ¨ne Ferret, this magnificent edifice boasts an exquisite blend of French colonial and Renaissance architectural styles. Its elegant faÃ§ade, adorned with intricate carvings and statues, draws visitors into a world of artistic splendor. Inside, the opulent interior, featuring grand staircases, chandeliers, and plush seating, provides an ideal setting for a variety of performances, from classical concerts and ballets to modern theatrical productions. Located on the bustling Dong Khoi Street, the Saigon Opera House not only serves as a cultural hub but also as a historical landmark, offering a glimpse into the city\'s colonial past while celebrating its contemporary artistic spirit. ',NULL,28,5,26,'Saigon Opera House (Ho Chi Minh Municipal Theater)'),('BÃ¬nh TÃ¢y Market, located in the bustling heart of Ho Chi Minh City\'s Cholon (District 5), is a vibrant, historical marketplace renowned for its rich cultural tapestry and architectural splendor. Established in the 1920s, this iconic market showcases traditional Vietnamese and Chinese influences, offering visitors an immersive shopping experience. Wander through its labyrinthine alleys, where stalls brim with an eclectic array of goods, from fresh produce and exotic spices to textiles, handicrafts, and souvenirs. The market\'s central courtyard, adorned with a beautiful clock tower, provides a tranquil respite amidst the lively commerce. Taste authentic local delicacies at the food court, where the tantalizing aromas of street food fill the air. Whether you\'re seeking a unique shopping adventure or a glimpse into Saigon\'s cultural heritage, BÃ¬nh TÃ¢y Market promises an unforgettable journey for all who visit.',NULL,12,5,27,'Binh Tay Market'),('Thien Hau Temple, nestled in district 5 of Ho Chi Minh City, is a captivating sanctuary dedicated to the sea goddess Mazu. Built in the early 19th century by Chinese immigrants, this temple is a vibrant testament to the rich cultural tapestry of Vietnam\'s Chinese community. As you step through its ornate entrance, you\'re greeted by the scent of incense spirals hanging from the ceiling, each carrying prayers for protection and good fortune. The temple\'s intricate wood carvings, colorful dioramas, and detailed porcelain figures depict ancient legends and the goddessâs divine deeds. The serene courtyard, adorned with bonsai trees and a beautiful altar, offers a peaceful escape from the city\'s hustle and bustle. Thien Hau Temple is not just a place of worship but a cultural treasure, inviting visitors to explore its mystical ambiance and historical significance. Whether seeking spiritual solace or cultural enrichment, a visit to Thien Hau Temple promises a deeply enriching experience.',NULL,18,5,28,'Ba Thien Hau Temple'),('Standing majestically in the heart of Saigon, the Reunification Palace, also known as Independence Palace, is a powerful symbol of Vietnam\'s turbulent history & resilient spirit. This architectural marvel, completed in 1966, served as the presidential headquarters during the Vietnam War. Today, it offers visitors a captivating glimpse into the past with its well-preserved rooms, war command bunkers, historical artifacts. Explore the opulent state rooms, the president\'s living quarters, and the grand conference hall where critical decisions were made. The palace\'s stunning 1960s design, featuring elegant lines & spacious interiors, reflects a blend of traditional Vietnamese & modernist styles. The lush gardens & iconic tank display add to the historical ambiance. Visit to the Reunification Palace is not just a step back in time but a profound journey through Vietnam\'s path to peace and reunification, making it a must-see landmark for history enthusiasts and curious travelers alike.',NULL,32,5,29,'The Independence Palace'),('Experience a unique dining adventure amidst the grandeur of the Saigon Central Post Office. Step into this architectural masterpiece, where history and gastronomy intertwine in a captivating fusion. Savor a traditional Vietnamese lunch served in the elegant surroundings of this iconic landmark. Delight in a menu crafted to tantalize your taste buds with authentic flavors and local delicacies. As you dine, marvel at the soaring ceilings, ornate columns, and exquisite architectural details that adorn the post office\'s interior. Let the ambiance transport you to a bygone era while you indulge in a culinary journey through Vietnam\'s rich culinary heritage. From fragrant pho and savory banh mi to delicate spring rolls and vibrant salads, each dish is a celebration of the country\'s diverse and vibrant cuisine. Whether you\'re a history enthusiast, a food lover, or simply seeking a memorable dining experience, lunch at the Saigon Central Post Office promises to be an unforgettable affair.',NULL,22,5,30,'Central Post Office'),('Indulge in a culinary feast at Ganh Buffet, located in the elegant Bong Sen Hotel in Ho Chi Minh City. This renowned buffet offers an exceptional dining experience, showcasing the diverse and flavorful cuisine of Vietnam. Step into a welcoming atmosphere where traditional Vietnamese dÃ©cor meets modern comfort. Savor an extensive array of dishes, from fresh seafood and succulent meats to vibrant salads and delectable desserts. Each dish is expertly prepared using the finest ingredients, reflecting the rich culinary heritage of Vietnam. Enjoy live cooking stations where talented chefs prepare your favorite dishes to perfection, adding a touch of theater to your dining experience. Whether you\'re craving classic Vietnamese favorites or exploring new flavors, Ganh Buffet promises a gastronomic adventure that will delight your senses. Perfect for family gatherings, business meetings, or a special night out, Ganh Buffet offers an unforgettable journey through the tastes of Vietnam.',NULL,15,5,31,'Bong Sen Saigon Hotel'),('The Jade Emperor Pagoda, also known as Chua Ngoc Hoang, is a mystical gem in the heart of Ho Chi Minh City. Built in 1909, this Taoist temple is dedicated to the Jade Emperor, the King of Heaven in Chinese mythology. Stepping into the pagoda, you are enveloped in an atmosphere thick with the scent of burning incense and the glow of candlelight. The temple\'s intricate wood carvings, elaborate statues, and colorful tile work captivate the eye, each piece telling a story from ancient lore. The main hall houses the majestic statue of the Jade Emperor, surrounded by a pantheon of deities and guardian figures. Outside, a tranquil pond filled with turtles, symbolizing longevity, adds to the serene ambiance. The Jade Emperor Pagoda is not just a place of worship but a spiritual oasis, offering a glimpse into the rich cultural and religious heritage of Vietnam. Whether you seek peace, blessings, or cultural insight, this enchanting pagoda promises a deeply fulfilling experience.',NULL,32,5,32,'Emperor Jade Pagoda'),('Discover the exquisite craftsmanship and timeless beauty of Vietnamese artistry at the Dai Viet Lacquerware Factory, located in the heart of Ho Chi Minh city. This renowned factory invites you into a world where tradition meets innovation, showcasing the meticulous process behind the creation of stunning lacquerware. As you explore the factory, you\'ll witness skilled artisans at work, transforming raw materials into intricate masterpieces through techniques passed down through generations. Each piece, whether a decorative plate, vase, or jewelry box, embodies the rich cultural heritage and artistic finesse of Vietnam. The vibrant colors and intricate designs are a testament to the dedication and passion of the craftsmen. At Dai Viet, you can also try your hand at this ancient craft, creating your own lacquered souvenir under the guidance of expert artisans. A visit to Dai Viet Factory is not just a shopping experience but a journey into the heart of Vietnamese artistry and tradition.',NULL,17,5,33,'Son mai Dai Viet'),('The War Remnants Museum, located in the heart of Ho Chi Minh City, is a profound journey through Vietnam\'s turbulent history. Established in 1975, this museum offers a stark, compelling look at the impact of the Vietnam War. Its exhibits include haunting photographs, poignant personal artifacts, and military equipment like tanks, helicopters, and fighter jets. The museum\'s most gripping feature is the collection of graphic imagery and detailed accounts of wartime atrocities, highlighting the resilience and suffering of the Vietnamese people. The War Remnants Museum is more than a historical archive; it\'s a sobering reminder of the horrors of war and a powerful call for peace.',NULL,8,5,34,'War Remnants Museum'),('Lam Phat Handicapped Handicrafts is more than just a workshop; it\'s a beacon of hope & creativity in the heart of Vietnam. Nestled in the bustling streets of Saigon City, this unique establishment empowers individuals with disabilities to showcase their talent and craftsmanship. Step inside Lam Phat and discover a world of exquisite handmade products, from intricately woven baskets to beautifully embroidered textiles. Every piece tells a story of resilience, determination, and the boundless potential of the human spirit. Witness artisans at work, honing their skills and creating stunning works of art with precision and care. From vibrant paintings to delicate ceramics, each creation is a testament to the indomitable spirit of its maker. By supporting Lam Phat Handicapped Handicrafts, you\'re not just purchasing a product; you\'re investing in a brighter future for individuals with disabilities. Join us in celebrating their talents and spreading joy through the beauty of handmade crafts.',NULL,12,5,35,'Son mai Lam Phat - Handicapped & Handicraft'),('The Cu Chi Tunnels system is a fascinating journey into Vietnam\'s wartime history. This unique system offers a hands-on experience, allowing visitors to explore the intricate network of underground tunnels used by VC soldiers during the Vietnam War. As you navigate the narrow, dimly lit passages, you\'ll gain a firsthand understanding of the ingenious strategies & sheer resilience that defined the Vietnamese resistance. The museum features original tunnel entrances, hidden trapdoors, and living quarters, providing an authentic glimpse into the daily life of the soldiers. Interactive exhibits, including wartime relics and poignant photographs, vividly depict the harsh realities of tunnel warfare. Above ground, visitors can see craters from B-52 bombings and try their hand at shooting era-specific firearms. The Cu Chi Tunnels is more than a historical site; it\'s a powerful tribute to human ingenuity and endurance, offering an unforgettable, immersive experience that brings history to life.',NULL,32,5,36,'Ben Dinh Tunnel'),('Tan Son Nhat Airport, the bustling gateway to Ho Chi Minh City, is Vietnam\'s largest and busiest airport, seamlessly blending modern amenities with warm Vietnamese hospitality. Conveniently located just 6 kilometers from the city center, it offers travelers a smooth transition between their flights and the vibrant life of HCMC. The airport boasts state-of-the-art facilities, including a variety of dining options that cater to international tastes and local flavors, extensive shopping areas featuring duty-free and luxury brands, and efficient services to ensure a comfortable journey. Free Wi-Fi, comfortable lounges, and efficient security procedures make your travel experience pleasant and hassle-free. With its welcoming atmosphere and efficient design, Tan Son Nhat Airport is more than just a transit point; it\'s the perfect introduction to the rich culture and dynamic energy of Vietnam. Once you\'re arriving or departing, the airport provides a convenient & comfortable adventure.',NULL,21,5,37,'Tan Son Nhat Airport'),('After breakfast visit Domain de Marie Church, Emperor Bao Daiâs villa, Youâll visit Truc Lam Pagoda by cable car and Tuyen Lam Lake to visit attractive Flower Garden. After lunch at local restaurant then visit Da Lat Railway Station. It was designed in 1932 by French architects Moncet and Reveron, and opened in 1938. Largely unused since abandonment of the railway during the later years of the Vietnam War, it was returned to a limited level of service in the 1990s with the reopening of a 7 km (4.3 mi) section of track leading to the nearby village of Trai Mat, operated as a tourist attraction. Overnight in Da Lat City.',NULL,22,1,38,'Domaine de Marie Church'),('After breakfast visit Domain de Marie Church, Emperor Bao Daiâs villa, Youâll visit Truc Lam Pagoda by cable car and Tuyen Lam Lake to visit attractive Flower Garden. After lunch at local restaurant then visit Da Lat Railway Station. It was designed in 1932 by French architects Moncet and Reveron, and opened in 1938. Largely unused since abandonment of the railway during the later years of the Vietnam War, it was returned to a limited level of service in the 1990s with the reopening of a 7 km (4.3 mi) section of track leading to the nearby village of Trai Mat, operated as a tourist attraction. Overnight in Da Lat City.',NULL,18,1,39,'Bao Dai\'s Palace - King\'s Palace 1 (Dinh 1)'),('After breakfast visit Domain de Marie Church, Emperor Bao Daiâs villa, Youâll visit Truc Lam Pagoda by cable car and Tuyen Lam Lake to visit attractive Flower Garden. After lunch at local restaurant then visit Da Lat Railway Station. It was designed in 1932 by French architects Moncet and Reveron, and opened in 1938. Largely unused since abandonment of the railway during the later years of the Vietnam War, it was returned to a limited level of service in the 1990s with the reopening of a 7 km (4.3 mi) section of track leading to the nearby village of Trai Mat, operated as a tourist attraction. Overnight in Da Lat City.',NULL,12,1,40,' Thien Vien Truc Lam'),('After breakfast visit Domain de Marie Church, Emperor Bao Daiâs villa, Youâll visit Truc Lam Pagoda by cable car and Tuyen Lam Lake to visit attractive Flower Garden. After lunch at local restaurant then visit Da Lat Railway Station. It was designed in 1932 by French architects Moncet and Reveron, and opened in 1938. Largely unused since abandonment of the railway during the later years of the Vietnam War, it was returned to a limited level of service in the 1990s with the reopening of a 7 km (4.3 mi) section of track leading to the nearby village of Trai Mat, operated as a tourist attraction. Overnight in Da Lat City',NULL,9,1,41,'Dalat Railway Station'),('After breakfast visit Domain de Marie Church, Emperor Bao Daiâs villa, Youâll visit Truc Lam Pagoda by cable car and Tuyen Lam Lake to visit attractive Flower Garden. After lunch at local restaurant then visit Da Lat Railway Station. It was designed in 1932 by French architects Moncet and Reveron, and opened in 1938. Largely unused since abandonment of the railway during the later years of the Vietnam War, it was returned to a limited level of service in the 1990s with the reopening of a 7 km (4.3 mi) section of track leading to the nearby village of Trai Mat, operated as a tourist attraction. Overnight in Da Lat City.',NULL,5,1,42,' Tuyen Lam Lake'),('7:0AM â Tour guide & driver pick you up at your hotel in Ho Chi Minh City center and departure for Da Lat. Along the way stop in Bao Loc for a visit to a tea and coffee processing plant and then scenic Dambri Waterfall. Within have lunch at local restaurant, then got to Da Lat City, check in the hotel. The rest of day is free to explore this quaint city. Overnight in Da Lat City.',NULL,19,5,43,'Ho Chi Minh City - Da Lat'),('ter breakfast visit Ho Xuan Huong & flower garden & Da Lat Market. Check our hotel then return to Ho Chi Minh City. On the way, we visit Prenn waterfalls and have Lunch at local restaurant. Arrival Ho Chi Minh City. The end .',NULL,7,1,44,'Xuan Huong Lake'),('After breakfast visit Ho Xuan Huong & flower garden & Da Lat Market. Check our hotel then return to Ho Chi Minh City. On the way, we visit Prenn waterfalls and have Lunch at local restaurant. Arrival Ho Chi Minh City. The end.',NULL,7,1,45,'Dalat Flower Park'),('After breakfast visit Ho Xuan Huong & flower garden & Da Lat Market. Check our hotel then return to Ho Chi Minh City. On the way, we visit Prenn waterfalls and have Lunch at local restaurant. Arrival Ho Chi Minh City.',NULL,12,1,46,' Prenn Falls');
/*!40000 ALTER TABLE `activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_transaction`
--

DROP TABLE IF EXISTS `bill_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill_transaction` (
  `id` int NOT NULL,
  `method` enum('BANKING','CASH') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `bill_transaction_ibfk_1` FOREIGN KEY (`id`) REFERENCES `invoice` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_transaction`
--

LOCK TABLES `bill_transaction` WRITE;
/*!40000 ALTER TABLE `bill_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog`
--

DROP TABLE IF EXISTS `blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog` (
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `thumbnail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `quote` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `category` int DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category` (`category`),
  CONSTRAINT `blog_ibfk_1` FOREIGN KEY (`category`) REFERENCES `category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog`
--

LOCK TABLES `blog` WRITE;
/*!40000 ALTER TABLE `blog` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_image`
--

DROP TABLE IF EXISTS `blog_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_image` (
  `blog_id` int NOT NULL,
  `image_id` int NOT NULL,
  PRIMARY KEY (`blog_id`,`image_id`),
  KEY `image_id` (`image_id`),
  CONSTRAINT `blog_image_ibfk_1` FOREIGN KEY (`blog_id`) REFERENCES `blog` (`id`),
  CONSTRAINT `blog_image_ibfk_2` FOREIGN KEY (`image_id`) REFERENCES `image` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_image`
--

LOCK TABLES `blog_image` WRITE;
/*!40000 ALTER TABLE `blog_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `status` enum('PAID','DEPOSIT') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `notes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `tour` int NOT NULL,
  `customer` int NOT NULL,
  `receptionist` int NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tour` (`tour`),
  KEY `customer` (`customer`),
  KEY `receptionist` (`receptionist`),
  CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`tour`) REFERENCES `tour` (`id`),
  CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`customer`) REFERENCES `customer` (`id`),
  CONSTRAINT `booking_ibfk_3` FOREIGN KEY (`receptionist`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Adventure'),(2,'City'),(3,'Cruises'),(4,'Sea'),(5,'Travel'),(6,'Wedding');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `last_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `dob` date DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `phone` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `destination`
--

DROP TABLE IF EXISTS `destination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `destination` (
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `thumbnail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `destination`
--

LOCK TABLES `destination` WRITE;
/*!40000 ALTER TABLE `destination` DISABLE KEYS */;
INSERT INTO `destination` VALUES (NULL,'https://images.pexels.com/photos/8942812/pexels-photo-8942812.jpeg',NULL,NULL,'Da Lat, located in the southern part of Vietnam\'s Central Highlands, is renowned for its temperate climate, lush landscapes, and French colonial architecture. Often called the \"City of Eternal Spring,\" it boasts cool weather year-round, making it a popular retreat from Vietnam\'s tropical heat. Da Lat is characterized by its flower gardens, pine forests, and serene lakes, such as Xuan Huong Lake. The city is also known for its coffee plantations and vibrant markets offering local produce and handicrafts. Its scenic beauty and relaxed atmosphere attract both domestic and international tourists seeking a tranquil escape.',NULL,1,'Đà Lạt'),(NULL,'https://images.unsplash.com/photo-1678785205231-90d61135750f?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',NULL,NULL,'Vung Tau is a coastal city in southern Vietnam known for its beautiful beaches, seafood, and French colonial architecture. It\'s a popular weekend destination from Ho Chi Minh City, offering scenic views, water sports, and a relaxed atmosphere by the sea.',NULL,2,'Vung Tau'),(NULL,'https://images.unsplash.com/photo-1603852452378-a4e8d84324a2?q=80&w=1964&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',NULL,NULL,'Da Nang, located on Vietnam\'s central coast, is a dynamic city known for its sandy beaches, modern bridges, and rich history. It\'s a gateway to UNESCO-listed heritage sites like the ancient town of Hoi An and the Hindu temples of My Son. Da Nang itself is characterized by its Marble Mountains, offering panoramic views of the city and coastline, and the Dragon Bridge, which breathes fire and water on weekends. With a mix of cultural attractions, vibrant nightlife, and pristine beaches, Da Nang attracts both local and international travelers seeking a blend of relaxation and exploration.',NULL,3,'Da Nang'),(NULL,'https://images.unsplash.com/photo-1531737212413-667205e1cda7?q=80&w=1934&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',NULL,NULL,'Ninh Binh, located in northern Vietnam, is celebrated for its stunning karst landscapes, lush rice paddies, and historic sites. Often referred to as \"Halong Bay on land,\" it features limestone mountains rising dramatically from flat plains and winding rivers. Visitors can explore ancient temples like Bai Dinh Pagoda and the ancient capital of Hoa Lu, offering a glimpse into Vietnam\'s rich history. Ninh Binh\'s natural beauty and cultural heritage make it a popular destination for those seeking tranquility and scenic wonders.',NULL,4,'Ninh Binh'),(NULL,'https://images.unsplash.com/photo-1536086845112-89de23aa4772?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',NULL,NULL,'Ho Chi Minh City, commonly known as Saigon, is the largest city in Vietnam and a bustling metropolis in the southern part of the country. It\'s a vibrant hub of commerce, culture, and history, with its skyline dotted by modern skyscrapers alongside colonial-era buildings. The city is known for its lively street food scene, bustling markets like Ben Thanh Market, and historical landmarks such as the War Remnants Museum and Notre-Dame Cathedral Basilica of Saigon. Ho Chi Minh City offers a dynamic blend of traditional Vietnamese culture and rapid economic development, making it a fascinating destination for visitors from around the world.',NULL,5,'Ho Chi Minh City'),(NULL,'https://images.unsplash.com/photo-1558334466-afce6bf36c69?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',NULL,NULL,'Hoi An, located on Vietnam\'s central coast, is a charming ancient town known for its well-preserved architecture, lantern-lit streets, and rich cultural heritage. Once a bustling trading port during the 15th to 19th centuries, Hoi An retains its historic charm with its wooden shop-houses, Chinese temples, and Japanese covered bridge. The town is famous for its tailor shops offering custom-made clothing and its vibrant lantern festival, held monthly on the full moon. With its picturesque riverside setting, delectable cuisine, and relaxed atmosphere, Hoi An is a UNESCO World Heritage site and a beloved destination for tourists seeking a glimpse into Vietnam\'s past.',NULL,6,'Hoi An'),(NULL,'https://images.unsplash.com/photo-1605645854141-9f81b7f47fbc?q=80&w=2054&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',NULL,NULL,'Ha Long Bay, located in northeastern Vietnam, is a UNESCO World Heritage site famous for its emerald waters and thousands of towering limestone islands topped with rainforests. These limestone karsts jut dramatically from the sea, creating a spectacular seascape that has captivated travelers for centuries. Visitors to Ha Long Bay can cruise among the islands, explore hidden grottoes and caves, and kayak in tranquil waters surrounded by stunning natural beauty. The bay is also home to floating fishing villages where locals live on boats and rafts, maintaining a traditional way of life. Ha Long Bay is a must-visit destination for those seeking awe-inspiring landscapes and a glimpse into Vietnam\'s natural wonders.',NULL,7,'Halong Bay'),(NULL,'https://images.unsplash.com/photo-1621094305060-081171d1c171?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',NULL,NULL,'\r\nChatGPT\r\nPhu Quoc is a picturesque island located off the southwest coast of Vietnam in the Gulf of Thailand. Renowned for its stunning white-sand beaches, clear turquoise waters, and lush tropical landscapes, Phu Quoc attracts visitors seeking relaxation and natural beauty. The island is also known for its fish sauce production and pepper plantations. In recent years, it has seen development with luxury resorts, yet retains pockets of pristine wilderness, making it a popular destination for both leisure travelers and nature enthusiasts alike.',NULL,8,'Phu Quoc'),(NULL,'https://res.cloudinary.com/dzjhqjxqj/image/upload/v1719211100/xv5idjacyo4pmbqgsxt7.jpg',NULL,NULL,'Traveling through the Mekong Delta in Vietnam offers a captivating journey into the heart of rural Vietnamese life. You\'ll navigate a maze of lush waterways, passing emerald rice paddies and coconut groves. Floating markets buzz with activity as boats laden with colorful fruits and vegetables ply the river. Villages reveal traditional crafts like rice paper making and coconut candy production. Delve into local cuisine with dishes like fresh seafood and tropical fruits. Whether cruising on a sampan or cycling along quiet paths, exploring the Mekong Delta promises an authentic glimpse into Vietnam\'s rich cultural and agricultural heritage.',NULL,9,'Mekong delta');
/*!40000 ALTER TABLE `destination` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `destination_image`
--

DROP TABLE IF EXISTS `destination_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `destination_image` (
  `destination_id` int NOT NULL,
  `image_id` int NOT NULL,
  PRIMARY KEY (`destination_id`,`image_id`),
  KEY `image_id` (`image_id`),
  CONSTRAINT `destination_image_ibfk_1` FOREIGN KEY (`destination_id`) REFERENCES `destination` (`id`),
  CONSTRAINT `destination_image_ibfk_2` FOREIGN KEY (`image_id`) REFERENCES `image` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `destination_image`
--

LOCK TABLES `destination_image` WRITE;
/*!40000 ALTER TABLE `destination_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `destination_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `image` (
  `src` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES ('https://media.tacdn.com/media/attractions-splice-spp-674x446/0f/53/ea/14.jpg',1,'ninhbinh01'),('https://media.tacdn.com/media/attractions-splice-spp-674x446/07/ad/c0/37.jpg',2,'ninhbinh02'),('https://media.tacdn.com/media/attractions-splice-spp-674x446/07/ae/ab/a1.jpg',3,'ninhbinh03'),('https://media.tacdn.com/media/attractions-splice-spp-674x446/0f/3f/26/99.jpg',4,'ninhbinh04'),('https://media.tacdn.com/media/attractions-splice-spp-674x446/0f/53/ea/13.jpg',5,'ninhbinh05'),('https://media.tacdn.com/media/attractions-splice-spp-674x446/11/ac/19/e2.jpg',6,'halong01'),('https://media.tacdn.com/media/attractions-splice-spp-674x446/12/36/f6/fc.jpg',7,'halong02'),('https://media.tacdn.com/media/attractions-splice-spp-674x446/10/7b/d4/24.jpg',8,'halong03'),('https://media.tacdn.com/media/attractions-splice-spp-674x446/10/7b/d4/61.jpg',9,'halong04'),('https://media.tacdn.com/media/attractions-splice-spp-674x446/10/7b/d4/9b.jpg',10,'halong05'),('https://media.tacdn.com/media/attractions-splice-spp-674x446/10/7b/d4/9d.jpg',11,'halong06'),('https://media.tacdn.com/media/attractions-splice-spp-674x446/10/74/4a/67.jpg',12,'halong07'),('https://media.tacdn.com/media/attractions-splice-spp-674x446/07/17/9f/89.jpg',13,'mekongdelta01'),('https://media.tacdn.com/media/attractions-splice-spp-674x446/12/1a/74/02.jpg',14,'mekongdelta02'),('https://media.tacdn.com/media/attractions-splice-spp-674x446/10/3e/61/6a.jpg',15,'mekongdelta03'),('https://media.tacdn.com/media/attractions-splice-spp-674x446/11/d8/64/69.jpg',16,'mekongdelta04'),('https://media.tacdn.com/media/attractions-splice-spp-674x446/07/17/9f/8d.jpg',17,'mekongdelta05'),('https://media.tacdn.com/media/attractions-splice-spp-674x446/12/8e/83/54.jpg',18,'saigon01'),('https://media.tacdn.com/media/attractions-splice-spp-674x446/0f/8f/29/22.jpg',19,'saigon02'),('https://media.tacdn.com/media/attractions-splice-spp-674x446/0f/8f/29/23.jpg',20,'saigon03'),('https://media.tacdn.com/media/attractions-splice-spp-674x446/0f/8f/2d/05.jpg',21,'saigon04'),('https://media.tacdn.com/media/attractions-splice-spp-674x446/0f/8f/2d/06.jpg',22,'saigon05'),('https://media.tacdn.com/media/attractions-splice-spp-674x446/0f/8f/2d/07.jpg',23,'saigon06'),('https://media.tacdn.com/media/attractions-splice-spp-674x446/0f/8f/2d/08.jpg',24,'saigon07'),('https://media.tacdn.com/media/attractions-splice-spp-674x446/0f/84/11/5d.jpg',25,'saigon08'),('https://media.tacdn.com/media/attractions-splice-spp-674x446/0f/8f/2d/5a.jpg',26,'saigon09'),('https://media.tacdn.com/media/attractions-splice-spp-674x446/0f/84/11/5e.jpg',27,'saigon10'),('https://media.tacdn.com/media/attractions-splice-spp-674x446/06/f2/73/20.jpg',28,'dalat01'),('https://media.tacdn.com/media/attractions-splice-spp-674x446/06/f2/73/21.jpg',29,'dalat02'),('https://media.tacdn.com/media/attractions-splice-spp-674x446/07/96/1c/44.jpg',30,'dalat03'),('https://media.tacdn.com/media/attractions-splice-spp-674x446/07/96/1c/47.jpg',31,'dalat04'),('https://media.tacdn.com/media/attractions-splice-spp-674x446/07/96/1c/49.jpg',32,'dalat05'),('https://media.tacdn.com/media/attractions-splice-spp-674x446/07/96/1c/4a.jpg',33,'dalat06');
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `cashier` int NOT NULL,
  `amount` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cashier` (`cashier`),
  CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`id`) REFERENCES `booking` (`id`),
  CONSTRAINT `invoice_ibfk_2` FOREIGN KEY (`cashier`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice`
--

LOCK TABLES `invoice` WRITE;
/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `rating` enum('BANKING','CASH') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `booking` int NOT NULL,
  `tour` int NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `booking` (`booking`),
  KEY `tour` (`tour`),
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`booking`) REFERENCES `booking` (`id`),
  CONSTRAINT `review_ibfk_2` FOREIGN KEY (`tour`) REFERENCES `tour_detail` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `ticket_type` int DEFAULT NULL,
  `booking` int DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `dob` date DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ticket_type` (`ticket_type`),
  KEY `booking` (`booking`),
  CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`ticket_type`) REFERENCES `ticket_type` (`id`),
  CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`booking`) REFERENCES `booking` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_type`
--

DROP TABLE IF EXISTS `ticket_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `deduction` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_type`
--

LOCK TABLES `ticket_type` WRITE;
/*!40000 ALTER TABLE `ticket_type` DISABLE KEYS */;
INSERT INTO `ticket_type` VALUES (1,'Adult','Over 18 years old',0),(2,'Child','Less than 5 years old',0.5);
/*!40000 ALTER TABLE `ticket_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tour`
--

DROP TABLE IF EXISTS `tour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tour` (
  `id` int NOT NULL AUTO_INCREMENT,
  `departure_date` date DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `tour_detail` int NOT NULL,
  `tour_guide` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tour_detail` (`tour_detail`),
  KEY `tour_guide` (`tour_guide`),
  CONSTRAINT `tour_ibfk_1` FOREIGN KEY (`tour_detail`) REFERENCES `tour_detail` (`id`),
  CONSTRAINT `tour_ibfk_2` FOREIGN KEY (`tour_guide`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tour`
--

LOCK TABLES `tour` WRITE;
/*!40000 ALTER TABLE `tour` DISABLE KEYS */;
INSERT INTO `tour` VALUES (1,'2024-06-29',0,1,NULL),(2,'2024-06-29',0,2,NULL),(3,'2024-06-29',0,3,NULL),(7,'2024-06-29',0,4,NULL),(8,'2024-06-29',0.12,5,NULL),(9,'2024-06-30',0.16,1,NULL),(10,'2024-06-30',0,2,NULL),(11,'2024-06-30',0,3,NULL),(12,'2024-06-30',0.1,4,NULL),(13,'2024-06-30',0,5,NULL);
/*!40000 ALTER TABLE `tour` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tour_activity`
--

DROP TABLE IF EXISTS `tour_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tour_activity` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tour_id` int DEFAULT NULL,
  `activity_id` int DEFAULT NULL,
  `day` int NOT NULL,
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tour_id` (`tour_id`),
  KEY `activity_id` (`activity_id`),
  CONSTRAINT `tour_activity_ibfk_1` FOREIGN KEY (`tour_id`) REFERENCES `tour_detail` (`id`),
  CONSTRAINT `tour_activity_ibfk_2` FOREIGN KEY (`activity_id`) REFERENCES `activity` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tour_activity`
--

LOCK TABLES `tour_activity` WRITE;
/*!40000 ALTER TABLE `tour_activity` DISABLE KEYS */;
INSERT INTO `tour_activity` VALUES (1,1,9,1,NULL),(2,1,10,2,NULL),(3,1,11,3,NULL),(4,1,12,4,NULL),(5,1,13,5,NULL),(6,2,21,1,NULL),(7,2,17,2,NULL),(8,2,18,3,NULL),(9,2,19,4,NULL),(10,2,20,5,NULL),(11,2,16,6,NULL),(12,2,15,7,NULL),(13,2,14,8,NULL),(14,3,22,1,NULL),(15,3,23,2,NULL),(16,3,24,3,NULL),(17,3,25,4,NULL),(18,4,26,1,NULL),(19,4,27,2,NULL),(20,4,28,3,NULL),(21,4,29,4,NULL),(22,4,30,5,NULL),(23,4,31,6,NULL),(24,4,32,7,NULL),(25,4,33,8,NULL),(26,4,34,9,NULL),(27,4,35,10,NULL),(28,4,36,11,NULL),(29,4,37,12,NULL),(30,5,43,1,NULL),(31,5,38,2,NULL),(32,5,39,3,NULL),(33,5,40,4,NULL),(34,5,41,5,NULL),(35,5,42,6,NULL),(36,5,44,7,NULL),(37,5,45,8,NULL),(38,5,46,9,NULL);
/*!40000 ALTER TABLE `tour_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tour_category`
--

DROP TABLE IF EXISTS `tour_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tour_category` (
  `tour_detail_id` int NOT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`tour_detail_id`,`category_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `tour_category_ibfk_1` FOREIGN KEY (`tour_detail_id`) REFERENCES `tour_detail` (`id`),
  CONSTRAINT `tour_category_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tour_category`
--

LOCK TABLES `tour_category` WRITE;
/*!40000 ALTER TABLE `tour_category` DISABLE KEYS */;
INSERT INTO `tour_category` VALUES (2,1),(3,1),(2,2),(3,2),(4,2),(4,3),(5,3),(2,4),(5,4);
/*!40000 ALTER TABLE `tour_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tour_detail`
--

DROP TABLE IF EXISTS `tour_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tour_detail` (
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `price` double DEFAULT NULL,
  `capacity` int DEFAULT NULL,
  `thumbnail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `destination` int DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `destination` (`destination`),
  CONSTRAINT `tour_detail_ibfk_1` FOREIGN KEY (`destination`) REFERENCES `destination` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tour_detail`
--

LOCK TABLES `tour_detail` WRITE;
/*!40000 ALTER TABLE `tour_detail` DISABLE KEYS */;
INSERT INTO `tour_detail` VALUES ('Skip the hassle of piecing together boats and bike rentals and savor Ninh Binh’s highlights on this guided door-to-door experience. You’ll visit Hoa Lu, once capital of Vietnam, explore Mua Cave and take in views from the mountain above, ride a boat through the Tam Coc caves, and cycle through the fields to Bich Dong Pagoda cave temples. Your day includes a restaurant lunch and small-group transfers by limousine minivan.',NULL,15,'https://res.cloudinary.com/dzjhqjxqj/image/upload/v1719209145/u8qxtunvcjglq7ao1izq.jpg',4,1,'Full-Day Ninh Binh Highlights Tour from Hanoi'),('Explore Ninh Binh\'s famous Trang An Cave, and ancient Bai Dinh Temple, Mua Cave, experiencing local culture during a 1-night home-stay. Ha Long overnight 5 star cruise, kayaking, swimming, fishing. Feast your eyes on the towering limestone karst formations at Trang An Visit Bai Dinh Pagoda, the largest complex of Buddhist temples in the country Visit the ancient Dinh King temple in the Hoa Lu Citadel Hike 500 steps to the top of Mua Mountain and take in the panoramic views Enjoy a Vietnamese buffet lunch Take a three-hour sampan boat trip through Trang An landscapes Pass through natural emerald water caves Sail upstream to the grottoes of Trang An aboard a traditional wooden boat A luxury cruise service of the highest safety standard discovery Halong & Lan Ha Private Balcony Cabin, Kayaking, Swimming, Cooking Class, Squid fishing Free set-up honeymoon/anniversary cabin (please send email request) Free a birthday cake if customer have a birthday date on trip (please email).',NULL,24,'https://res.cloudinary.com/dzjhqjxqj/image/upload/v1719210187/yy31vrkleccfetq0wkfd.jpg',7,2,'Hanoi-Ninh Binh-Halong-Lan Ha Bay 5 Star Cruise & Balcony'),('Escape the bustle of Ho Chi Minh City in favor of the tranquil Mekong Delta on a 2-day tour that provides a great introduction for first-time visitors. A guide takes care of planning activities, accommodation, and transfers so you don’t have to, and provides an insider’s perspective into the culture of southern Vietnam. You’ll explore Cai Rang Floating Market, the biggest in the region, and enjoy the convenience of hotel pickup and drop-off in Ho Chi Minh City District 1.',NULL,42,'https://res.cloudinary.com/dzjhqjxqj/image/upload/v1719211614/nzyy57ou7qky4v3kfate.jpg',9,3,'Cai Rang Floating Market & Mekong Delta'),('Discover the South of Vietnam with our exclusive Ho Chi Minh City Private Package Tour, spanning 3 days and 2 nights. Begin your adventure with a full-day exploration of Ho Chi Minh City, where you\'ll visit iconic landmarks, bustling markets, and historic sites, immersing yourself in the vibrant culture and dynamic energy of the city. On the second day, venture into the serene Mekong Delta. Cruise along picturesque rivers, visit traditional coconut candy workshops, savor tropical fruits, and experience local life through a sampan ride and a visit to a honey bee farm. Enjoy a delicious lunch at a local restaurant and be enchanted by traditional folk music. Conclude your journey with a fascinating tour of the Cu Chi Tunnels, uncovering the secrets of Vietnam’s wartime history. Crawl through the intricate tunnel systems, walk through the jungle, and gain insights into the resourcefulness of the Viet Cong. This tour offers a perfect blend of history, culture, and natural beauty.',NULL,12,'https://res.cloudinary.com/dzjhqjxqj/image/upload/v1719213519/h3pgfbukdsa4amasqzdv.jpg',5,4,'Ho Chi Minh City Private Package'),('Dalat today has been kept the role of the economic, political, and cultural center of Lam Dong province. Thanks to its mild climate, beautiful natural scenery and diverse French architectural heritages, Dalat is also known as many fascinating names: “foggy City”, “City of Flower”, “Home to Cherry Blossoms” or “Little Paris”.',NULL,24,'https://res.cloudinary.com/dzjhqjxqj/image/upload/v1719215250/xbx6syvx6wymzn1bm6lf.jpg',1,5,'Da Lat Highland tour from Ho Chi Minh City');
/*!40000 ALTER TABLE `tour_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tour_image`
--

DROP TABLE IF EXISTS `tour_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tour_image` (
  `tour_detail_id` int NOT NULL,
  `image_id` int NOT NULL,
  PRIMARY KEY (`tour_detail_id`,`image_id`),
  KEY `image_id` (`image_id`),
  CONSTRAINT `tour_image_ibfk_1` FOREIGN KEY (`tour_detail_id`) REFERENCES `tour_detail` (`id`),
  CONSTRAINT `tour_image_ibfk_2` FOREIGN KEY (`image_id`) REFERENCES `image` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tour_image`
--

LOCK TABLES `tour_image` WRITE;
/*!40000 ALTER TABLE `tour_image` DISABLE KEYS */;
INSERT INTO `tour_image` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(2,6),(2,7),(2,8),(2,9),(2,10),(2,11),(2,12),(3,13),(3,14),(3,15),(3,16),(3,17),(4,18),(4,19),(4,20),(4,21),(4,22),(4,23),(4,24),(4,25),(4,26),(4,27),(5,28),(5,29),(5,30),(5,31),(5,32),(5,33);
/*!40000 ALTER TABLE `tour_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `role` enum('ADMIN','CUSTOMER','CASHIER','RECEPTIONIST','TOUR_GUIDE') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `last_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `dob` date DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `phone` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('$2a$10$uGIJ7Wc/UFBaR3QnEoItL.p8b5QzHWVcmsTkbw2Csfs2g7qEtkuDq','https://res.cloudinary.com/dzjhqjxqj/image/upload/v1719465234/qlgb6hmsm3ryeszladwr.jpg','ADMIN',2,'Lam','Thinh',NULL,'pthinh.lama@gmail.com','0335037042',NULL),('$2a$10$o1d8yPycA35Z5sTLcKknhOjx9oXAT8ToQmDj5WNS6KrAM2Z7Gj4uK','https://res.cloudinary.com/dzjhqjxqj/image/upload/v1719465499/n43pn9m0sxrsl4nvj9io.jpg','RECEPTIONIST',3,'Yen','Vy',NULL,'yenvy@gmail.com','0335037213',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-28  0:43:35
