import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart'; // make sure animate_do is in pubspec.yaml

class Entertainment extends StatefulWidget {
  const Entertainment({super.key});

  @override
  State<Entertainment> createState() => _EntertainmentState();
}

class _EntertainmentState extends State<Entertainment> {
  // Example data grouped by category
  final Map<String, List<Map<String, String>>> committee = {
    "CHIEF PATRON": [
      {
        "name": "Dr. A. S. Ganesan",
        "role": "Chancellor - VMRF-DU",
        "icon": "assets/icons/4.png",
      }
    ],
    "PATRONS": [
      {
        "name": "Dr. Rakesh Sehgal",
        "role": "Dean - AVMC",
        "icon": "assets/icons/5.png",
      },
      {
        "name": "Dr. Gurunath",
        "role": "Past Secretary",
        "icon": "assets/icons/6.png",
      },
      {
        "name": "Dr. Janarthanan",
        "role": "Sr. Urologist",
        "icon": "assets/icons/7.png",
      },
      {
        "name": "Dr. Vijay Oza",
        "role": "President - PGMEB, NMC",
        "icon": "assets/icons/25.png",
      },
    ],
    "ORGANISING COMMITTEE": [
      {
        "name": "Dr. K. Sudhakar",
        "role": "Chairman",
        "icon": "assets/icons/8.png",
      },
      {
        "name": "Dr. K. Saravanan",
        "role": "Co Chairman",
        "icon": "assets/icons/9.png",
      },
      {
        "name": "Dr. Arunagiri",
        "role": "Co Chairman",
        "icon": "assets/icons/10.png",
      },
      {
        "name": "Dr. R. Vinoth Kumar",
        "role": "Secretary",
        "icon": "assets/icons/11.png",
      },
    ],
    "TRADE COMMITTEE": [
      {
        "name": "Dr. Rathnavelu Kamaraj",
        "role": "Treasurer",
        "icon": "assets/icons/14.png",
      },
      {
        "name": "Dr. P. V. Srinivasan",
        "role": "",
        "icon": "assets/icons/15.png",
      },
      {
        "name": "Dr. Sudhakar",
        "role": "",
        "icon": "assets/icons/16.png",
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "ORGANISING COMMITTEE",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
            ),

            // Members list
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(30)),
                ),
                child: ListView(
                  children: committee.entries.map((entry) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Section Title
                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 10),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 6),
                            decoration: BoxDecoration(
                              color: Colors.lightBlue.shade100,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              entry.key,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue[900],
                              ),
                            ),
                          ),
                        ),

                        // Members
                        ...entry.value.asMap().entries.map((memberEntry) {
                          int index = memberEntry.key;
                          var member = memberEntry.value;
                          return FadeInUp(
                            delay: Duration(milliseconds: 100 * index),
                            child: Card(
                              elevation: 5,
                              margin: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 4),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.lightBlue.shade400,
                                      Colors.blue.shade300,
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: ListTile(
                                  contentPadding: const EdgeInsets.all(16),
                                  leading: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => ImageZoomPage(
                                            imagePath: member["icon"] ?? "",
                                          ),
                                        ),
                                      );
                                    },
                                    child: Hero(
                                      tag: member["icon"] ?? "",
                                      child: CircleAvatar(
                                        radius: 28,
                                        backgroundColor: Colors.white,
                                        backgroundImage:
                                        AssetImage(member["icon"] ?? ""),
                                      ),
                                    ),
                                  ),
                                  title: Text(
                                    member["name"] ?? "",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  subtitle: Text(
                                    member["role"] ?? "",
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// ============================
/// FULL SCREEN ZOOM PAGE
/// ============================
class ImageZoomPage extends StatelessWidget {
  final String imagePath;
  const ImageZoomPage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Center(
          child: Hero(
            tag: imagePath,
            child: InteractiveViewer(
              panEnabled: true,
              minScale: 0.8,
              maxScale: 4,
              child: Image.asset(imagePath),
            ),
          ),
        ),
      ),
    );
  }
}
