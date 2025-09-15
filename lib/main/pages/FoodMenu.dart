import 'package:flutter/material.dart';

class FoodZonePage extends StatelessWidget {
  const FoodZonePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("🍽️ Food Zone"),
        backgroundColor: Colors.deepOrange,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          dayMenu(
            context,
            "September 19",
            [
              {"name": "Lunch", "img": "assets/food/lunch1.jpg"},
              {"name": "Conference Dinner", "img": "assets/food/conference_dinner.jpg"},
            ],
          ),
          dayMenu(
            context,
            "September 20",
            [
              {"name": "Breakfast", "img": "assets/food/breakfast2.jpg"},
              {"name": "Lunch", "img": "assets/food/lunch2.jpg"},
              {"name": "Gala Dinner", "img": "assets/food/gala_dinner.jpg"},
            ],
          ),
          dayMenu(
            context,
            "September 21",
            [
              {"name": "Breakfast", "img": "assets/food/breakfast3.jpg"},
              {"name": "Lunch", "img": "assets/food/lunch3.jpg"},
            ],
          ),
        ],
      ),
    );
  }

  // Widget for Day Menu
  Widget dayMenu(BuildContext context, String day, List<Map<String, String>> meals) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              day,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange,
              ),
            ),
            const SizedBox(height: 10),
            ...meals.map((meal) => ListTile(
              leading: const Icon(Icons.restaurant_menu, color: Colors.orange),
              title: Text(meal["name"]!),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => FullScreenImage(imgPath: meal["img"]!),
                  ),
                );
              },
            )),
          ],
        ),
      ),
    );
  }
}

// Fullscreen Image Page
class FullScreenImage extends StatelessWidget {
  final String imgPath;

  const FullScreenImage({super.key, required this.imgPath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: InteractiveViewer(
          child: Image.asset(imgPath, fit: BoxFit.contain),
        ),
      ),
    );
  }
}
