import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

class Tapasucouncil extends StatefulWidget {
  const Tapasucouncil({super.key});

  @override
  State<Tapasucouncil> createState() => _TapasucouncilState();
}

class _TapasucouncilState extends State<Tapasucouncil> {
  final List<Map<String, String>> councilMembers = [
    {
      'name': 'Dr. P. Periasamy',
      'role': 'President',
      'icon': 'assets/icons/1.png',
    },
    {
      'name': 'Dr. Rajesh Rajendran',
      'role': 'Secretary',
      'icon': 'assets/icons/2.png',
    },
    {
      'name': 'Dr. J. Induja',
      'role': 'Treasurer',
      'icon': 'assets/icons/3.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'TAPASU COUNCIL',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
            ),

            // List of Members
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(30)),
                ),
                child: ListView.builder(
                  itemCount: councilMembers.length,
                  itemBuilder: (context, index) {
                    final member = councilMembers[index];
                    return FadeInUp(
                      delay: Duration(milliseconds: 100 * index),
                      child: Card(
                        elevation: 6,
                        margin: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.deepOrange.shade400,
                                Colors.orange.shade300,
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
                                      imagePath: member['icon'] ?? '',
                                    ),
                                  ),
                                );
                              },
                              child: Hero(
                                tag: member['icon'] ?? '',
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Colors.white,
                                  backgroundImage:
                                  AssetImage(member['icon'] ?? ''),
                                ),
                              ),
                            ),
                            title: Text(
                              member['name'] ?? '',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              member['role'] ?? '',
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 15,
                              ),
                            ),
                            trailing: const Icon(Icons.arrow_forward_ios,
                                color: Colors.white70, size: 18),
                          ),
                        ),
                      ),
                    );
                  },
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
