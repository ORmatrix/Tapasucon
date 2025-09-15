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
    imageUrl: "https://ormatrix.in/tapasucon2025/images/location.png",  // Replace with an actual image URL
    mapUrl: "https://maps.app.goo.gl/FaUa7MiF621V3XjQ7",
  ),
  EventVenue(
    name: "Dr.R.VINOTH KUMAR",
    address: "Organising Secretary \n TAPASUCON 2025",
    contactNumber: "1234567890",
    email: "info@conferencecenter.com",
    imageUrl: "",  // Replace with an actual image URL
    mapUrl: "",
  ),
  EventVenue(
    name: "Conference Center",
    address: "123 Main St, City, State 12345",
    contactNumber: "1234567890",
    email: "info@conferencecenter.com",
    imageUrl: "",  // Replace with an actual image URL
    mapUrl: "",
  ),

  // Add more venues as needed
];

void main() {
  runApp(Contact());
}

class Contact extends StatelessWidget {
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
      appBar: AppBar(title: Text('Contact', style: TextStyle(
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