import 'dart:math' as math;
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  // static const List<Widget> _widgetOptions = <Widget>[
  //   Text('Home Page',
  //       style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  //   Text('Search Page',
  //       style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  //   Text('Profile Page',
  //       style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  // ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.amber[200],
          toolbarHeight: 45,
          title: Row(
            children: [
              Center(
                child: Text('Kassis',
                    style: TextStyle(color: Colors.black, fontSize: 25)),
              )
            ],
          )),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Container(
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 70,
                  ),
                  height: 220),
              SizedBox(
                width: 105,
              ),
              Text('O.M.', style: TextStyle(fontSize: 20))
            ]),
            SizedBox(height: 25),
            Text('History', style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('images/home.png')), label: 'Home'),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('images/explore.png')),
                label: 'Explore'),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('images/search.png')),
                label: 'Search'),
          ],
          currentIndex: _selectedIndex,
          backgroundColor: Colors.white,
          onTap: _onItemTapped),
    );
  }
}
