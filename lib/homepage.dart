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
              unselectedLabelColor:
                  Colors.white, // biar kalo ga di pilih warnanya putih
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
              Column(
                children: [
                  // create input border box
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                    padding: EdgeInsets.only(left: 20, right: 20),
                    height: 54,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey[200],
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Input NIM',
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                    padding: EdgeInsets.only(left: 20, right: 20),
                    height: 54,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey[200],
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Input Nama',
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                    padding: EdgeInsets.only(left: 20, right: 20),
                    height: 54,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey[200],
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Input Alamat',
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                    padding: EdgeInsets.only(left: 20, right: 20),
                    height: 54,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey[200],
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Input Nomer Telepon',
                      ),
                    ),
                  ),
                  // create radio button
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                    padding: EdgeInsets.only(left: 20, right: 20),
                    height: 54,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey[200],
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Text('Jenis Kelamin'),
                        Radio(
                          value: 1,
                          groupValue: 1,
                          onChanged: (value) {},
                        ),
                        Text('Laki'),
                        Radio(
                          value: 2,
                          groupValue: 1,
                          onChanged: (value) {},
                        ),
                        Text('Perempuan'),
                      ],
                    ),
                  ),
              
// CREATE BUTTON row
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 54,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.grey[200],
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: FlatButton(
                            onPressed: () {},
                            child: Text('Batal'),
                          ),
                        ),
                        Container(
                          height: 54,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.amber,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: FlatButton(
                            onPressed: () {},
                            child: Text('Simpan'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
               
                //create card
                children: [
                  Card(
                   margin: EdgeInsets.only(top: 20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    elevation: 0,
                    color: Colors.amber,
                    child: const SizedBox(
                      width: 350,
                      height: 80,
                      child: Center(child: Text('TEST DATA 1')),
                    ),
                  ),
                  Card(
                     margin: EdgeInsets.only(top: 20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    elevation: 0,
                    color: Colors.amber,
                    child: const SizedBox(
                      width: 350,
                      height: 80,
                      child: Center(child: Text('TEST DATA 1')),
                    ),
                  ),
                  Card(
                     margin: EdgeInsets.only(top: 20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    elevation: 0,
                    color: Colors.amber,
                    child: const SizedBox(
                      width: 350,
                      height: 80,
                      child: Center(child: Text('TEST DATA 1')),
                    ),
                  ),
                  Card(
                     margin: EdgeInsets.only(top: 20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    elevation: 0,
                    color: Colors.amber,
                    child: const SizedBox(
                      width: 350,
                      height: 80,
                      child: Center(child: Text('TEST DATA 1')),
                    ),
                  ),
                  Card(
                     margin: EdgeInsets.only(top: 20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    elevation: 0,
                    color: Colors.amber,
                    child: const SizedBox(
                      width: 350,
                      height: 80,
                      child: Center(child: Text('TEST DATA 1')),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: Center(
                      child: Container(
                        height: 54,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.grey[200],
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: FlatButton(
                          onPressed: () {},
                          child: Text('Kembali'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
