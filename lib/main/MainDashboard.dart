import 'package:flutter/material.dart';
import 'package:http/http.dart' as http ;
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:tapasucon/main/pages/Contact.dart';
import 'package:tapasucon/main/pages/Dashboard.dart';
import 'package:tapasucon/main/pages/Gallery.dart';
import 'package:tapasucon/main/pages/NotePad.dart';
import 'package:tapasucon/main/pages/Venue.dart';

class MainDashboard extends StatefulWidget {
  @override
  _MainDashboardState createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> {
  int _currentIndex=0;
  final List<Widget> _children = [
    Dashboard(),
    Contact(),
    Gallery(),

    VenueApp(),
    NoteList()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.blue[800],
      body: _children[_currentIndex],

      bottomNavigationBar: SalomonBottomBar(
        backgroundColor: Colors.white,
        items: [
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
            selectedColor: Colors.blue[600],
            unselectedColor: Colors.lightBlue,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.call),
            title: Text("Contact"),
            selectedColor: Colors.blue[600],
            unselectedColor: Colors.lightBlue,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.camera),
            title: Text("Gallery"),
            selectedColor: Colors.blue[600],
            unselectedColor: Colors.lightBlue,
          ),

          SalomonBottomBarItem(
            icon: Icon(Icons.location_pin),
            title: Text("Venue"),
            selectedColor: Colors.blue[600],
            unselectedColor: Colors.lightBlue,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.edit_note),
            title: Text("Note"),
            selectedColor: Colors.blue[600],
            unselectedColor: Colors.lightBlue,

          ),

        ],
        currentIndex: _currentIndex,
        onTap: (_index){
          setState(() {
            _currentIndex = _index;
          });
          // _onTap();
        },),


    );

  }

}
