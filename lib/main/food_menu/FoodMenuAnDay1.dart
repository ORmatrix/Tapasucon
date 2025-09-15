import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:tapasucon/main/config/app_config.dart';

class FoodMenuAnDay1 extends StatefulWidget
{
  const FoodMenuAnDay1({super.key});
  @override
  State<FoodMenuAnDay1> createState() => _FoodMenuAnDay1State();

}
class _FoodMenuAnDay1State extends State<FoodMenuAnDay1> {
  List<dynamic> _products = [];

  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  Future<void> _fetchProducts() async {
    final response = await http.get(Uri.parse(AppConfig.connectionString + 'Food_Day1_FN_API.php'));

    if (response.statusCode == 200) {
      setState(() {
        _products = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load products');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color.fromRGBO(255, 165, 0, 1.0),
      appBar: AppBar(
        title: Text('Menu',
          style: TextStyle(
            color: Color.fromRGBO(255, 165, 0, 1.0),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),),
      ),
      body: _products.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: _products.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(4.0),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                children: [
                  // Display the product image with fixed size
                  Container(
                    width: 60, // Fixed width for image
                    height: 60, // Fixed height for image
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(AppConfig.connectionString_Img+_products[index]['image_url']),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: Colors.grey), // Optional border
                    ),
                  ),
                  SizedBox(width: 10), // Add spacing
                  // Display product details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _products[index]['item'],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),


                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}