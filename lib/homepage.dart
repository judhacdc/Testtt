
import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  List<Tab> myTabs = [
    Tab(
      text: 'Input Data',
      icon: Icon(Icons.directions_car),
    ),
    Tab(
      text: 'List Data',
      icon: Icon(Icons.directions_transit),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        initialIndex: 0, // biar b
        length: myTabs.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Tab Bar'),
            bottom: TabBar(
              labelColor: Colors.black,
              unselectedLabelColor: Colors.white, // biar kalo ga di pilih warnanya putih 
              labelStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ), // yang di pilih biar boldddd
              unselectedLabelStyle: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.normal,
              ), // yang ga di pilih biar normal ajaaaa
              indicator: BoxDecoration(
                color: Colors.amber,
                border: Border(
                  bottom: BorderSide(
                    color: Colors.black,
                    width: 5,
                  ),
                ),
              ),
              tabs: myTabs,
            ),
          ),
          body: TabBarView(
            children: [
              Center(
                child: Text(
                  'Input Data',
                  style: TextStyle
                  (fontSize: 40
                  ),
                  ),
              ),
               Center(
                child: Text(
                  'List Data',
                  style: TextStyle
                  (fontSize: 40
                  ),
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
