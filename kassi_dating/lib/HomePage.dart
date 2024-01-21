import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kassi_dating/pfp.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Uint8List? _image;
  int _selectedIndex = 0;

  List<Widget> get _widgetOptions => [
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: CircleAvatar(
                backgroundColor: Colors.black,
                radius: 70,
                backgroundImage: _image != null ? MemoryImage(_image!) : null,
              ),
              height: 220,
            ),
            SizedBox(
              width: 105,
            ),
            Positioned(
              child: IconButton(
                onPressed: () {
                  selectImage();
                },
                icon: const Icon(Icons.add_a_photo),
              ),
              bottom: -10,
              left: 80,
            ),
            Text('Aditya.', style: TextStyle(fontSize: 20)),
          ],
        ),
        SizedBox(height: 25),
        Text('History', style: TextStyle(fontSize: 20)),
      ],
    ),
    Text('Profile Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Container(
      margin: EdgeInsets.only(top: 25, left: 25, right: 25),
      child: Column(
        children: [
          Row(
            children: [
              Flexible(
                flex: 1,
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                    fillColor: Colors.black,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    hintText: 'Search',
                    hintStyle: TextStyle(
                      color: Color.fromARGB(255, 218, 213, 213),
                      fontSize: 18,
                    ),
                    prefixIcon: Container(
                      padding: EdgeInsets.all(15),
                      child: Image.asset('images/search.png'),
                      width: 18,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    ),
  ];

  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

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
              child: Text('Kassis', style: TextStyle(color: Colors.black, fontSize: 25)),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: _widgetOptions[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('images/home.png')),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('images/explore.png')),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('images/search.png')),
            label: 'Search',
          ),
        ],
        currentIndex: _selectedIndex,
        backgroundColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
