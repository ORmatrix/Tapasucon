import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:url_launcher/url_launcher.dart';

class SightSeeingPage extends StatelessWidget {
  SightSeeingPage({super.key});

  final List<Map<String, dynamic>> places = [
    {
      "name": "Chidambaram Natarajar Temple",
      "image": "assets/places/chidambaram.jpg",
      "distance": "59 Km from AVMC, PY",
      "mapUrl":
      "https://www.google.com/maps/search/?api=1&query=Chidambaram+Natarajar+Temple"
    },
    {
      "name": "Pichavaram Backwater",
      "image": "assets/places/pichavaram.jpg",
      "distance": "56 Km from AVMC, PY",
      "mapUrl":
      "https://www.google.com/maps/search/?api=1&query=Pichavaram+Backwater"
    },
    {
      "name": "Thiruvanthipuram Temple",
      "image": "assets/places/thiruvanthipuram.jpg",
      "distance": "16 Km from AVMC, PY",
      "mapUrl":
      "https://www.google.com/maps/search/?api=1&query=Thiruvanthipuram+Temple+Cuddalore"
    },
    {
      "name": "Auroville",
      "image": "assets/places/auroville.jpg",
      "distance": "25 Km from AVMC, PY",
      "mapUrl": "https://www.google.com/maps/search/?api=1&query=Auroville"
    },
    {
      "name": "Aurobindo Ashram",
      "image": "assets/places/ashram.jpg",
      "distance": "15 Km from AVMC, PY",
      "mapUrl":
      "https://www.google.com/maps/search/?api=1&query=Aurobindo+Ashram+Pondicherry"
    },
    {
      "name": "Silver Beach (Cuddalore)",
      "image": "assets/places/silver_beach.jpg",
      "distance": "13 Km from AVMC, PY",
      "mapUrl":
      "https://www.google.com/maps/search/?api=1&query=Silver+Beach+Cuddalore"
    },
    {
      "name": "Rock Beach (Pondy)",
      "image": "assets/places/rock_beach.jpg",
      "distance": "15 Km from AVMC, PY",
      "mapUrl":
      "https://www.google.com/maps/search/?api=1&query=Rock+Beach+Pondicherry"
    },
    {
      "name": "Chunnambar Boat House",
      "image": "assets/places/chunnambar.jpg",
      "distance": "7 Km from AVMC, PY",
      "mapUrl":
      "https://www.google.com/maps/search/?api=1&query=Chunnambar+Boat+House+Pondicherry"
    },
    {
      "name": "Manakula Vinayagar Temple",
      "image": "assets/places/manakula.jpg",
      "distance": "15 Km from AVMC, PY",
      "mapUrl":
      "https://www.google.com/maps/search/?api=1&query=Manakula+Vinayagar+Temple+Pondicherry"
    },
  ];

  Future<void> _openMap(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw "Could not launch $url";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFF8C00), Color(0xFF6A1B9A)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "From French Charm to Tamil Traditions\nExplore the Best of Both Worlds",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    height: 1.4,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: places.length,
                  itemBuilder: (context, index) {
                    final place = places[index];
                    return FadeInUp(
                      delay: Duration(milliseconds: 100 * index),
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Colors.white, Color(0xFFFDEBD0)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black26,
                                blurRadius: 6,
                                offset: Offset(2, 4))
                          ],
                        ),
                        child: Row(
                          children: [
                            // Image with zoom on tap
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => FullScreenImage(
                                      tag: place["name"],
                                      imagePath: place["image"],
                                    ),
                                  ),
                                );
                              },
                              child: Hero(
                                tag: place["name"],
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    bottomLeft: Radius.circular(20),
                                  ),
                                  child: Image.asset(
                                    place["image"],
                                    height: 110,
                                    width: 110,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      place["name"],
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      place["distance"],
                                      style: const TextStyle(
                                        fontSize: 13,
                                        color: Colors.black54,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    ElevatedButton.icon(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.orange,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(30),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12, vertical: 6),
                                      ),
                                      icon: const Icon(Icons.place_sharp, size: 18,  color: Colors.white,),
                                      label: const Text(
                                        "Open in Maps",
                                        style: TextStyle(fontSize: 13,  color: Colors.white,),
                                      ),
                                      onPressed: () =>
                                          _openMap(place["mapUrl"]),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Full screen image page
class FullScreenImage extends StatelessWidget {
  final String imagePath;
  final String tag;

  const FullScreenImage({super.key, required this.imagePath, required this.tag});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Center(
          child: Hero(
            tag: tag,
            child: InteractiveViewer(
              child: Image.asset(imagePath, fit: BoxFit.contain),
            ),
          ),
        ),
      ),
    );
  }
}
