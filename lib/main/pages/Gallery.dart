import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Gallery extends StatefulWidget
{
  const Gallery({super.key});
  @override
  State<Gallery> createState() => _GalleryState();

}
class _GalleryState extends State<Gallery> {

  List<dynamic> _images = [];

  @override
  void initState() {
    super.initState();
    _fetchImages();
  }

  Future<void> _fetchImages() async {
    final response = await http.get(Uri.parse('http://192.168.29.86/Customer Projects/Tapasucon2025/images/get_slides.php'));

    if (response.statusCode == 200) {
      setState(() {
        _images = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load images');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gallery', style: TextStyle(
          color: Colors.blue,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),),
      ),
      body: _images.isEmpty
          ? Center(child: CircularProgressIndicator())
          : GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
        ),
        itemCount: _images.length,
        itemBuilder: (context, index) {

          return Card(
            child: Column(
              children: [
                Expanded(
                  child: Image.network(
                    _images[index]['image_url'],
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    _images[index]['caption'],
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}