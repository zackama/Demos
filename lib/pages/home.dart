import 'package:mapview/pages/list.dart';
import 'package:mapview/pages/map.dart';
import 'package:flutter/material.dart';



class HomePage extends StatefulWidget{
  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  int myIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Get from Json"),
        ),
        backgroundColor: const Color.fromARGB(255, 90, 153, 184),
      ), 
      body:
      myIndex == 0 ? DataList() : Container(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 90, 153, 184),
        selectedItemColor: Colors.white,
        onTap: (index) {
          setState(() {
          myIndex =index;   
          });
        },
        currentIndex: myIndex,
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.list), label: "List"),
        BottomNavigationBarItem(icon: Icon(Icons.map), label: "Map"),
      ],
      ),
      
    );
  }
}