import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EventVenue {
  final String name;
  final String address;
  final String contactNumber; // Phone Number
  final String email; // Contact Email
  final String imageUrl; // Image URL
  final String mapUrl; // Google Maps URL

  EventVenue({
    required this.name,
    required this.address,
    required this.contactNumber,
    required this.email,
    required this.imageUrl,
    required this.mapUrl,
  });
}

List<EventVenue> sampleVenues = [
  EventVenue(
    name: "Conference Center",
    address: "123 Main St, City, State 12345",
    contactNumber: "1234567890",
    email: "info@conferencecenter.com",
    imageUrl: "https://ormatrix.in/tapasucon2025/images/stall112.jpg",  // Replace with an actual image URL
    mapUrl: "https://maps.app.goo.gl/FaUa7MiF621V3XjQ7",
  ),
  EventVenue(
    name: "Expo Hall",
    address: "Ormatrix, First floor, No 72, Pudupalayam Rd, Seetharam Nagar, Pudupalayam, Cuddalore, Tamil Nadu 607001",
    contactNumber: "08754652446",
    email: "inbarajbe@gmail.com",
    imageUrl: "https://ormatrix.in/tapasucon2025/images/volleyball.jpg",  // Replace with an actual image URL
    mapUrl: "https://maps.app.goo.gl/FaUa7MiF621V3XjQ7",
  ),
  // Add more venues as needed
];

void main() {
  runApp(VenueApp());
}

class VenueApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Event Venues',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: VenueListScreen(),
    );
  }
}

class VenueListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Event Venues', style: TextStyle(
        color: Colors.blue,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),),),
      body: ListView.builder(
        itemCount: sampleVenues.length,
        itemBuilder: (context, index) {
          final venue = sampleVenues[index];
          return Card(
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                Image.network(venue.imageUrl, fit: BoxFit.cover),
                ListTile(
                  title: Text(venue.name),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(venue.address),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                            onPressed: () => _makePhoneCall(venue.contactNumber),
                            child: Text('Call'),
                          ),
                          TextButton(
                            onPressed: () => _sendEmail(venue.email),
                            child: Text('Email'),
                          ),
                          TextButton(
                            onPressed: () => _openMap(venue.mapUrl),
                            child: Text('Map'),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<void> _makePhoneCall(String number) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: number,
    );
    await _launchInBrowser(launchUri);
  }

  Future<void> _sendEmail(String email) async {
    final Uri launchUri = Uri(
      scheme: 'mailto',
      path: email,
    );
    await _launchInBrowser(launchUri);
  }

  Future<void> _openMap(String url) async {
    final Uri launchUri = Uri.parse(url);
    await _launchInBrowser(launchUri);
  }

  Future<void> _launchInBrowser(Uri uri) async {
    if (await canLaunch(uri.toString())) {
      await launch(uri.toString());
    } else {
      throw 'Could not launch $uri';
    }
  }
}