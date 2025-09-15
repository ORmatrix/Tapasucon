import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:tapasucon/main/config/app_config.dart';


class IndustryPartners extends StatefulWidget
{
  const IndustryPartners({super.key});
  @override
  State<IndustryPartners> createState() => _IndustryPartnersState();

}


class _IndustryPartnersState extends State<IndustryPartners> with SingleTickerProviderStateMixin {
  List<dynamic> _products_p = [];
  List<dynamic> _products_g= [];
  List<dynamic> _products_s = [];
  List<dynamic> _products_o = [];


  Future<void> _fetchProducts() async {
    final response_p = await http.get(Uri.parse(AppConfig.connectionString +'Industry_Partner_Platinum_API.php'));
    final response_g = await http.get(Uri.parse(AppConfig.connectionString +'Industry_Partner_Gold_API.php'));
    final response_s = await http.get(Uri.parse(AppConfig.connectionString +'Industry_Partner_Silver_API.php'));
    final response_o = await http.get(Uri.parse(AppConfig.connectionString +'Industry_Partner_Others_API.php'));

    if (response_p.statusCode == 200) {
      setState(() {
        _products_p = json.decode(response_p.body);
      });
    } else {
      throw Exception('Failed to load products');
    }
    if (response_g.statusCode == 200) {
      setState(() {
        _products_g = json.decode(response_g.body);
      });
    } else {
      throw Exception('Failed to load products');
    }
    if (response_s.statusCode == 200) {
      setState(() {
        _products_s = json.decode(response_s.body);
      });
    } else {
      throw Exception('Failed to load products');
    }
    if (response_o.statusCode == 200) {
      setState(() {
        _products_o = json.decode(response_o.body);
      });
    } else {
      throw Exception('Failed to load products');
    }
  }
  late TabController _tabController;
  double _width = 100;
  double _height = 100;
  Color _color = Colors.blue;
  void _animateContainer() {
    setState(() {
      _width = _width == 100 ? 200 : 100;
      _height = _height == 100 ? 200 : 100;
      _color = _color == Colors.blue ? Colors.green : Colors.blue;
    });
  }
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    _fetchProducts();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(221, 1, 1, 25.0),
      appBar: AppBar(
        title: Text('Industry Partner'),
        titleTextStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Color.fromRGBO(221, 1, 1, 1.0),
        ),
        bottom: TabBar(
            controller: _tabController,
            tabs: [
              Tab(text: 'Platinum'),
              Tab(text: 'Gold+'),
              Tab(text: 'Gold'),
              Tab(text: 'Silver'),
              Tab(text: 'Bronze'),
            ]
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Center(

            child: _products_p.isEmpty
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
              itemCount: _products_p.length,
              itemBuilder: (context, index) {
                return Card(

                  elevation: 6,
                  // Adjust elevation for shadow depth
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),

                    // Rounded corners
                  ),

                  child: Padding(
                    padding: EdgeInsets.all(5),



                    child: Row(
                      children: [
                        // Display the product image with fixed size
                        Container(
                          width: 100, // Fixed width for image
                          height: 100, // Fixed height for image
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(AppConfig.connectionString_Img+_products_p[index]['image_url']),
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
                                _products_p[index]['stall_name'],
                                style: TextStyle(fontWeight: FontWeight.bold,

                                  color: Color.fromRGBO(221, 1, 1, 1.0),
                                  fontSize: 16,),
                              ),
                              SizedBox(height: 4), // Add some spacing
                              Text(
                                'Stall No:${_products_p[index]['stall_no'].toString()}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,),
                              ),
                              SizedBox(height: 4), // Add some spacing
                              Text(
                                'Cell:${_products_p[index]['contact_no'].toString()}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,),
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


          ),
          Center(

            child: _products_p.isEmpty
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
              itemCount: _products_p.length,
              itemBuilder: (context, index) {
                return Card(

                  elevation: 6,
                  // Adjust elevation for shadow depth
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),

                    // Rounded corners
                  ),

                  child: Padding(
                    padding: EdgeInsets.all(5),



                    child: Row(
                      children: [
                        // Display the product image with fixed size
                        Container(
                          width: 100, // Fixed width for image
                          height: 100, // Fixed height for image
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(AppConfig.connectionString_Img+_products_p[index]['image_url']),
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
                                _products_p[index]['stall_name'],
                                style: TextStyle(fontWeight: FontWeight.bold,

                                  color: Color.fromRGBO(221, 1, 1, 1.0),
                                  fontSize: 16,),
                              ),
                              SizedBox(height: 4), // Add some spacing
                              Text(
                                'Stall No:${_products_p[index]['stall_no'].toString()}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,),
                              ),
                              SizedBox(height: 4), // Add some spacing
                              Text(
                                'Cell:${_products_p[index]['contact_no'].toString()}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,),
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


          ),
          Center(
            child: _products_g.isEmpty
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
              itemCount: _products_g.length,
              itemBuilder: (context, index) {
                return Card(

                  elevation: 6,
                  // Adjust elevation for shadow depth
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),

                    // Rounded corners
                  ),

                  child: Padding(
                    padding: EdgeInsets.all(5),



                    child: Row(
                      children: [
                        // Display the product image with fixed size
                        Container(
                          width: 100, // Fixed width for image
                          height: 100, // Fixed height for image
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(AppConfig.connectionString_Img+_products_g[index]['image_url']),
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
                                _products_g[index]['stall_name'],
                                style: TextStyle(fontWeight: FontWeight.bold,

                                  color: Color.fromRGBO(221, 1, 1, 1.0),
                                  fontSize: 16,),
                              ),
                              SizedBox(height: 4), // Add some spacing
                              Text(
                                'Stall No:${_products_g[index]['stall_no'].toString()}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,),
                              ),
                              SizedBox(height: 4), // Add some spacing
                              Text(
                                'Cell:${_products_g[index]['contact_no'].toString()}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,),
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

          ),

          Center(
            child: _products_s.isEmpty
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
              itemCount: _products_s.length,
              itemBuilder: (context, index) {
                return Card(

                  elevation: 6,
                  // Adjust elevation for shadow depth
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),

                    // Rounded corners
                  ),

                  child: Padding(
                    padding: EdgeInsets.all(5),



                    child: Row(
                      children: [
                        // Display the product image with fixed size
                        Container(
                          width: 100, // Fixed width for image
                          height: 100, // Fixed height for image
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(AppConfig.connectionString_Img+_products_s[index]['image_url']),
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
                                _products_s[index]['stall_name'],
                                style: TextStyle(fontWeight: FontWeight.bold,

                                  color: Color.fromRGBO(221, 1, 1, 1.0),
                                  fontSize: 16,),
                              ),
                              SizedBox(height: 4), // Add some spacing
                              Text(
                                'Stall No:${_products_s[index]['stall_no'].toString()}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,),
                              ),
                              SizedBox(height: 4), // Add some spacing
                              Text(
                                'Cell:${_products_s[index]['contact_no'].toString()}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,),
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

          ),
          Center(

            child: _products_o.isEmpty
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
              itemCount: _products_o.length,
              itemBuilder: (context, index) {
                return Card(

                  elevation: 6,
                  // Adjust elevation for shadow depth
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),

                    // Rounded corners
                  ),

                  child: Padding(
                    padding: EdgeInsets.all(5),



                    child: Row(
                      children: [
                        // Display the product image with fixed size
                        Container(
                          width: 100, // Fixed width for image
                          height: 100, // Fixed height for image
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(AppConfig.connectionString_Img+_products_o[index]['image_url']),
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
                                _products_o[index]['stall_name'],
                                style: TextStyle(fontWeight: FontWeight.bold,

                                  color: Color.fromRGBO(221, 1, 1, 1.0),
                                  fontSize: 16,),
                              ),
                              SizedBox(height: 4), // Add some spacing
                              Text(
                                'Stall No:${_products_o[index]['stall_no'].toString()}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,),
                              ),
                              SizedBox(height: 4), // Add some spacing
                              Text(
                                'Cell:${_products_o[index]['contact_no'].toString()}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,),
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

          ),
        ],
      ),
    );
  }
}