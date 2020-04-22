import 'package:flutter/material.dart';
import 'package:greenway/views/result_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  List<Widget> _children = [

    ResultPage(),
    HomePage(),

  ];


  void onTabTapped(int index){
    setState(() {
      _currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.shifting,
          selectedItemColor: Colors.purple,
          unselectedItemColor: Colors.black,
          elevation: 5,
          iconSize: 30,

          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              title: Text("camera"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.arrow_right),
              title: Text("result"),
            ),


          ],
        ),
        body: _children[_currentIndex]
    );
  }
}