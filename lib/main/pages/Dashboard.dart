import 'package:flutter/material.dart';
import 'package:tapasucon/main/pages/DelegateRegistration.dart';
import 'package:tapasucon/main/pages/Entertainment.dart';
import 'package:tapasucon/main/pages/FoodMenu.dart';
import 'package:tapasucon/main/pages/IndustryPartners.dart';
import 'package:tapasucon/main/pages/OrganiseComity.dart';


import 'package:tapasucon/main/pages/ScientificSchedule.dart';
import 'package:tapasucon/main/pages/SiteSeeing.dart';
import 'package:tapasucon/main/pages/SportsCategory.dart';
import 'package:tapasucon/main/pages/TapasuCouncil.dart';
import 'package:tapasucon/main/pages/Venue.dart';
//import 'package:tapasucon/utils/exercises_title.dart';
import 'package:tapasucon/utils/menu_layout3.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:tapasucon/main/config/app_config.dart';


class Dashboard extends StatefulWidget
{
  const Dashboard({super.key});
  @override
  State<Dashboard> createState() => _DashboardState();

}

class _DashboardState extends State<Dashboard> {

  List<String> _imageUrls = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchImages();
  }

  Future<void> _fetchImages() async {
    try {
      var response = await http.get(Uri.parse(AppConfig.connectionString + 'slider_API.php'));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        setState(() {
          _imageUrls = List<String>.from(data);
          _isLoading = false;
        });
      } else {
        throw Exception('Failed to load images');
      }
    } catch (e) {
      print(e); // Handle errors as needed
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
            children: [
              //Greeting row
              _isLoading
                  ? Center(child: CircularProgressIndicator())
                  : CarouselSlider.builder(
                itemCount: _imageUrls.length,
                itemBuilder: (context, index, realIndex) {
                  final imageUrl = _imageUrls[index];
                  return Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(AppConfig.connectionString_Img+imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
                options: CarouselOptions(
                  height:180,
                  viewportFraction: 1.0,
                  autoPlay: true,
                  enlargeCenterPage: false,
                  enableInfiniteScroll: true,
                ),
              ),

              Expanded(
                child: Container(
                  padding: EdgeInsets.all(15),
                  color: Colors.white,
                  child: Center(
                    child: Column(
                      children: [

                        //Listview of exercises
                        Expanded(
                          child: ListView(
                            children: [
                              ExercisesTitle(
                                icon: Icons.menu_book,
                                exerciseName: 'TAPASU COUNCIL',
                                color: Colors.orange,
                                page: Tapasucouncil(),
                              ),
                              ExercisesTitle(
                                icon: Icons.groups,
                                exerciseName: 'ORGANISING COMMITTEE',
                                color: Color.fromRGBO(37,200,229, 1.0),
                                page: OrganiseComity(),
                              ),
                              ExercisesTitle(
                                icon: Icons.handshake,
                                exerciseName: 'INDUSTRY PARTNERS',
                                color: Colors.red,
                                page: IndustryPartners(),
                              ),
                              ExercisesTitle(
                                icon: Icons.science_sharp,
                                exerciseName: 'SCIENTIFIC SCHEDULE',
                                color: Color.fromRGBO(58, 66, 86, 1.0),
                                page: Scientificschedule(),
                              ),

                              // 🔹 NEW ITEM: Pre Conference Workshop
                              ExercisesTitle(
                                icon: Icons.work_history,   // workshop-looking icon
                                exerciseName: 'PRE CONFERENCE WORKSHOP',
                                color: Colors.purple,
                                page: Container(   // <-- replace with your actual page
                                  child: Center(child: Text("Pre Conference Workshop Page")),
                                ),
                              ),

                              ExercisesTitle(
                                icon: Icons.beach_access_sharp,
                                exerciseName: 'SIGHT SEEING',
                                color: Color.fromRGBO(135, 0, 0, 1.0),
                                page: SightSeeingPage(),
                              ),

                              // 🔹 Updated Entertainment with better icon
                              ExercisesTitle(
                                icon: Icons.celebration,   // 🎉 better entertainment icon
                                exerciseName: 'ENTERTAINMENT',
                                color: Color.fromRGBO(65, 140, 149, 1.0),
                                page: Entertainment(),
                              ),

                              ExercisesTitle(
                                icon: Icons.fastfood,
                                exerciseName: 'FOOD ZONE',
                                color: Color.fromRGBO(235, 123, 0, 1.0),
                                page: FoodZonePage(),
                              ),
                              ExercisesTitle(
                                icon: Icons.sports_baseball,
                                exerciseName: 'SPORTS',
                                color: Color.fromRGBO(21, 102, 54, 1.0),
                                page: SportsPage(),
                              ),
                            ],
                          ),
                        ),




                      ],
                    ),
                  ),
                ),
              )
            ],
          )),
    );

  }
}
