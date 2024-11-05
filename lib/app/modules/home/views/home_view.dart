import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocc/app/modules/auth/views/phone.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(  
        backgroundColor: Colors.green,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(top:20),
          child: TextField(
            
            decoration: InputDecoration(
              hintText: "Search",
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),
              fillColor: Colors.white,
              filled: true,
            ),
          ),
        ),


        actions: [
          Padding(
          padding: const EdgeInsets.only(top:20),
            child: IconButton(
              icon: const Icon(Icons.qr_code_scanner),
              onPressed: () {},
            ),
          ),
        ],
    
    
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Category Icons Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildCategoryImage("images/home-icon-Food.png", "Food"),
                _buildCategoryImage("images/home-icon-Mart.png", "Mart"),
                _buildCategoryImage("images/home-icon-Delivery.png", "Express"),
                _buildCategoryImage("images/home-icon-Transport.png", "Transport"),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildCategoryImage("images/home-icon-Pay.png", "Offers"),
                _buildCategoryImage("images/home-icon-Gift.png", "Gift Cards"),
                _buildCategoryImage("images/dots.png", "More"),
              ],
            ),
            const SizedBox(height: 20),

            // Swipe to Pay Banner
            GestureDetector(
              onTap: () {
                Get.to(Phone());
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 46, 63, 46),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(child: Text("Swipe to pay", style: TextStyle(color: Colors.white))),
              ),
            ),
            const SizedBox(height: 10),

            // Points and Activation Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildInfoCard("Activate", "GrabPay", Icons.credit_card, Colors.green),
                _buildInfoCard("Use Points", "758", Icons.loyalty, Colors.blue),
              ],
            ),
            const SizedBox(height: 20),

            // Promotional Section
            const Text(
              "Celebrate Mid-Autumn Festival",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // Promotion Cards
            Row(
              children: [
                Expanded(child: _buildPromoCard(
      'images/Banner 01.png',  // Your image path
      "Order mooncakes to gift & enjoy",
      "Until 21 Sep",
      "Free gift",
      "Until 21 Sep",
    ),
),
                const SizedBox(width: 10),
                Expanded(child: _buildPromoCard(
      'images/Banner 2.png',  // Your image path
      "Get a DIY lantern with a min. spend of \$80",
      "Until 31 Aug",
      "Free gift",
      "Until 31 Aug",
    ),
),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.receipt), label: "Activity"),
          BottomNavigationBarItem(icon: Icon(Icons.payment), label: "Payment"),
          BottomNavigationBarItem(icon: Icon(Icons.inbox), label: "Inbox"),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: "Account"),
        ],
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
      ),
    );
  }

// Helper Method to build category images
Widget _buildCategoryImage(String imagePath, String label) {
  return Column(
    children: [
      Container(
        width: 50, // Set width to keep it consistent
        height: 50, // Set Color.fromARGB(255, 9, 15, 9)nsistent
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25), // Make it circular
          color: Colors.green.shade50,
        ),
        child: ClipOval(
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover, // Cover the entire circular area
          ),
        ),
      ),
      const SizedBox(height: 5),
      Text(label, style: const TextStyle(fontSize: 12)),
    ],
  );
}

  // Helper Method to build info cards
  Widget _buildInfoCard(String title, String subtitle, IconData icon, Color color) {
    return Container(
      width: 150,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(icon, color: color),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontSize: 12)),
              Text(subtitle, style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }

// Helper Method to build promotional cards
Widget _buildPromoCard(String imagePath, String title, String subtitle, String label, String expiryDate) {
  return Container(
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          blurRadius: 5,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Image with label overlay
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imagePath,
                height: 100, // Adjust as needed
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 8,
              left: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                color: Colors.black.withOpacity(0.7),
                child: Text(
                  label,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        // Title
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        // Subtitle
        Text(
          subtitle,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 10),
        // Expiry Date
        Row(
          children: [
            const Icon(Icons.calendar_today, color: Colors.grey, size: 14),
            const SizedBox(width: 5),
            Text(
              expiryDate,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

}
