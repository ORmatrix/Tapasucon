import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:tapasucon/main/config/app_config.dart';

class Workshop extends StatefulWidget
{
  const Workshop({super.key});
  @override
  State<Workshop> createState() => _WorkshopState();

}


class _WorkshopState extends State<Workshop> with SingleTickerProviderStateMixin {
  List<dynamic> _products_d1_fn = [];
  List<dynamic> _products_d1_an = [];
  List<dynamic> _products_d2_fn = [];
  List<dynamic> _products_d2_an = [];


  Future<void> _fetchProducts() async {
    final response_d1_fn = await http.get(Uri.parse(AppConfig.connectionString +'SS_Day1_FN_API.php'));
    final response_d1_an = await http.get(Uri.parse(AppConfig.connectionString +'SS_Day1_AN_API.php'));
    final response_d2_fn = await http.get(Uri.parse(AppConfig.connectionString +'SS_Day2_FN_API.php'));
    final response_d2_an = await http.get(Uri.parse(AppConfig.connectionString +'SS_Day2_AN_API.php'));
    if (response_d1_fn.statusCode == 200) {
      setState(() {
        _products_d1_fn = json.decode(response_d1_fn.body);
      });
    } else {
      throw Exception('Failed to load products');
    }
    if (response_d1_an.statusCode == 200) {
      setState(() {
        _products_d1_an = json.decode(response_d1_an.body);
      });
    } else {
      throw Exception('Failed to load products');
    }
    if (response_d2_fn.statusCode == 200) {
      setState(() {
        _products_d2_fn = json.decode(response_d2_fn.body);
      });
    } else {
      throw Exception('Failed to load products');
    }
    if (response_d2_an.statusCode == 200) {
      setState(() {
        _products_d2_an = json.decode(response_d2_an.body);
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
    _tabController = TabController(length: 4, vsync: this);
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
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      appBar: AppBar(
        title: Text('Scientific Schedule'),
        titleTextStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Color.fromRGBO(58, 66, 86, 1.0),
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab( child: Text(
              '10-Sep FN',
              style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold), // Custom font size
            ),),
            Tab( child: Text(
              '10-Sep AN',
              style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold), // Custom font size
            ),),
            Tab( child: Text(
              '11-Sep FN',
              style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold), // Custom font size
            ),),
            Tab( child: Text(
              '11-Sep AN',
              style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold), // Custom font size
            ),),
          ],

        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Center(

            child: _products_d1_fn.isEmpty
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
              itemCount: _products_d1_fn.length,
              itemBuilder: (context, index) {
                return Card(

                  elevation: 6,
                  // Adjust elevation for shadow depth
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),

                    // Rounded corners
                  ),

                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _products_d1_fn[index]['session'] + _products_d1_fn[index]['event_name'],
                                style: TextStyle(fontWeight: FontWeight.bold,

                                  color: Color.fromRGBO(58, 66, 86, 1.0),
                                  fontSize: 16,),
                              ),
                              SizedBox(height: 2), // Add some spacing
                              Text(
                                _products_d1_fn[index]['hall'].toString(),
                                style: TextStyle(fontWeight: FontWeight.bold,),
                              ),
                              SizedBox(height: 2), // Add some spacing
                              Text(
                                _products_d1_fn[index]['l1'].toString() + _products_d1_fn[index]['l2'].toString(),
                                style: TextStyle(fontWeight: FontWeight.bold,),
                              ),
                              SizedBox(height: 2), // Add some spacing
                              Text(
                                "Chairperson (s)"+_products_d1_fn[index]['chairperson1'].toString() +" "+ _products_d1_fn[index]['chairperson2'].toString(),
                                style: TextStyle(color: Colors.blue,
                                  fontWeight: FontWeight.bold,),
                              ),
                              SizedBox(height: 2), // Add some spacing
                              Text(
                                "Moderator (s)"+_products_d1_fn[index]['moderator1'].toString() +" "+ _products_d1_fn[index]['moderator2'].toString(),
                                style: TextStyle(color: Colors.blue,
                                  fontWeight: FontWeight.bold,),
                              ),
                              SizedBox(height: 2), // Add some spacing
                              Text(
                                "Time: "+_products_d1_fn[index]['start_time'].toString() +" - "+ _products_d1_fn[index]['end_time'].toString(),
                                style: TextStyle(color: Colors.blue,
                                  fontWeight: FontWeight.bold,),
                              ),
                              // Text(
                              //   _products[index]['status'].toString(),
                              //   style: TextStyle(color: Colors.blue,
                              //     fontWeight: FontWeight.bold,),
                              // ),
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

            child: _products_d1_an.isEmpty
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
              itemCount: _products_d1_an.length,
              itemBuilder: (context, index) {
                return Card(

                  elevation: 6,
                  // Adjust elevation for shadow depth
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),

                    // Rounded corners
                  ),

                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _products_d1_an[index]['session'] + _products_d1_an[index]['event_name'],
                                style: TextStyle(fontWeight: FontWeight.bold,

                                  color: Color.fromRGBO(58, 66, 86, 1.0),
                                  fontSize: 16,),
                              ),
                              SizedBox(height: 2), // Add some spacing
                              Text(
                                _products_d1_an[index]['hall'].toString(),
                                style: TextStyle(fontWeight: FontWeight.bold,),
                              ),
                              SizedBox(height: 2), // Add some spacing
                              Text(
                                _products_d1_an[index]['l1'].toString() + _products_d1_an[index]['l2'].toString(),
                                style: TextStyle(fontWeight: FontWeight.bold,),
                              ),
                              SizedBox(height: 2), // Add some spacing
                              Text(
                                "Chairperson (s)"+_products_d1_an[index]['chairperson1'].toString() +" "+ _products_d1_an[index]['chairperson2'].toString(),
                                style: TextStyle(color: Colors.blue,
                                  fontWeight: FontWeight.bold,),
                              ),
                              SizedBox(height: 2), // Add some spacing
                              Text(
                                "Moderator (s)"+_products_d1_an[index]['moderator1'].toString() +" "+ _products_d1_an[index]['moderator2'].toString(),
                                style: TextStyle(color: Colors.blue,
                                  fontWeight: FontWeight.bold,),
                              ),
                              SizedBox(height: 2), // Add some spacing
                              Text(
                                "Time: "+_products_d1_an[index]['start_time'].toString() +" - "+ _products_d1_an[index]['end_time'].toString(),
                                style: TextStyle(color: Colors.blue,
                                  fontWeight: FontWeight.bold,),
                              ),
                              // Text(
                              //   _products[index]['status'].toString(),
                              //   style: TextStyle(color: Colors.blue,
                              //     fontWeight: FontWeight.bold,),
                              // ),
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

            child: _products_d2_fn.isEmpty
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
              itemCount: _products_d2_fn.length,
              itemBuilder: (context, index) {
                return Card(

                  elevation: 6,
                  // Adjust elevation for shadow depth
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),

                    // Rounded corners
                  ),

                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _products_d2_fn[index]['session'] + _products_d2_fn[index]['event_name'],
                                style: TextStyle(fontWeight: FontWeight.bold,

                                  color: Color.fromRGBO(58, 66, 86, 1.0),
                                  fontSize: 16,),
                              ),
                              SizedBox(height: 2), // Add some spacing
                              Text(
                                _products_d2_fn[index]['hall'].toString(),
                                style: TextStyle(fontWeight: FontWeight.bold,),
                              ),
                              SizedBox(height: 2), // Add some spacing
                              Text(
                                _products_d2_fn[index]['l1'].toString() + _products_d2_fn[index]['l2'].toString(),
                                style: TextStyle(fontWeight: FontWeight.bold,),
                              ),
                              SizedBox(height: 2), // Add some spacing
                              Text(
                                "Chairperson (s)"+_products_d2_fn[index]['chairperson1'].toString() +" "+ _products_d2_fn[index]['chairperson2'].toString(),
                                style: TextStyle(color: Colors.blue,
                                  fontWeight: FontWeight.bold,),
                              ),
                              SizedBox(height: 2), // Add some spacing
                              Text(
                                "Moderator (s)"+_products_d2_fn[index]['moderator1'].toString() +" "+ _products_d2_fn[index]['moderator2'].toString(),
                                style: TextStyle(color: Colors.blue,
                                  fontWeight: FontWeight.bold,),
                              ),
                              SizedBox(height: 2), // Add some spacing
                              Text(
                                "Time: "+_products_d2_fn[index]['start_time'].toString() +" - "+ _products_d2_fn[index]['end_time'].toString(),
                                style: TextStyle(color: Colors.blue,
                                  fontWeight: FontWeight.bold,),
                              ),
                              // Text(
                              //   _products[index]['status'].toString(),
                              //   style: TextStyle(color: Colors.blue,
                              //     fontWeight: FontWeight.bold,),
                              // ),
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

            child: _products_d2_an.isEmpty
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
              itemCount: _products_d2_an.length,
              itemBuilder: (context, index) {
                return Card(

                  elevation: 6,
                  // Adjust elevation for shadow depth
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),

                    // Rounded corners
                  ),

                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _products_d2_an[index]['session'] + _products_d2_an[index]['event_name'],
                                style: TextStyle(fontWeight: FontWeight.bold,

                                  color: Color.fromRGBO(58, 66, 86, 1.0),
                                  fontSize: 16,),
                              ),
                              SizedBox(height: 2), // Add some spacing
                              Text(
                                _products_d2_an[index]['hall'].toString(),
                                style: TextStyle(fontWeight: FontWeight.bold,),
                              ),
                              SizedBox(height: 2), // Add some spacing
                              Text(
                                _products_d2_an[index]['l1'].toString() + _products_d2_an[index]['l2'].toString(),
                                style: TextStyle(fontWeight: FontWeight.bold,),
                              ),
                              SizedBox(height: 2), // Add some spacing
                              Text(
                                "Chairperson (s)"+_products_d2_an[index]['chairperson1'].toString() +" "+ _products_d2_an[index]['chairperson2'].toString(),
                                style: TextStyle(color: Colors.blue,
                                  fontWeight: FontWeight.bold,),
                              ),
                              SizedBox(height: 2), // Add some spacing
                              Text(
                                "Moderator (s)"+_products_d2_an[index]['moderator1'].toString() +" "+ _products_d2_an[index]['moderator2'].toString(),
                                style: TextStyle(color: Colors.blue,
                                  fontWeight: FontWeight.bold,),
                              ),
                              SizedBox(height: 2), // Add some spacing
                              Text(
                                "Time: "+_products_d2_an[index]['start_time'].toString() +" - "+ _products_d2_an[index]['end_time'].toString(),
                                style: TextStyle(color: Colors.blue,
                                  fontWeight: FontWeight.bold,),
                              ),
                              // Text(
                              //   _products[index]['status'].toString(),
                              //   style: TextStyle(color: Colors.blue,
                              //     fontWeight: FontWeight.bold,),
                              // ),
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