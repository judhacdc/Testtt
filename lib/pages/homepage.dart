// Tab Bar
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/pages/detail_screen.dart';

import '../models/biodata.dart';
import '../sql_helper.dart';

TabBar get _tabBar => TabBar(
      tabs: [
        Tab(
          icon: Icon(Icons.account_box),
          text: "INPUT DATA",
        ),
        Tab(
          icon: Icon(Icons.list_alt),
          text: "LIST DATA",
        ),
      ],
    );

// Make Form with radio button
class HomePage extends StatefulWidget {
  @override
  _FormData createState() => _FormData();
}

// Form Data Mahasiswa
class _FormData extends State<HomePage> {
  String? gender;
  final nim = TextEditingController();
  final nama = TextEditingController();
  final alamat = TextEditingController();

  List<Biodata> _biodata = [];

// Make Function, clear data when 'Cancel'
  void clearText() {
    nim.clear();
    nama.clear();
    alamat.clear();
    setState(() {
      gender = null;
    });
  }

  //fungsi tambah
  Future<void> _createItem() async {
    print('call');
    Biodata biodata = Biodata(
      nim: int.parse(nim.text),
      nama: nama.text,
      address: alamat.text,
      gender: gender,
    );

    int id = await SQLHelper.createItem(biodata);
    print(id);
  }

  //fungsi panggil data
  Future<void> _getBiodata() async {
    List<Biodata> biodata = await SQLHelper.getItems();
    setState(() {
      _biodata = biodata;
    });
  }

  //fungsi hapus data
  Future<void> _deleteItem(int id) async {
    print(id);
    await SQLHelper.deleteItem(id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        // add tabBarTheme
        tabBarTheme: const TabBarTheme(
            labelColor: Color(0xffF5591F),
            labelStyle: TextStyle(color: Colors.black),
            unselectedLabelColor: Colors.black,
            indicator: UnderlineTabIndicator(
                borderSide: BorderSide(color: Color(0xffF5591F)))),
        // deprecated,
      ),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            centerTitle: true,
            bottom: PreferredSize(
              preferredSize: _tabBar.preferredSize,
              child: Material(
                color: Colors.white,
                child: _tabBar,
              ),
            ),
            title: const Text('Mahasiswa'),
            backgroundColor: Color(0xffF5591F),
          ),
          body: TabBarView(
            children: <Widget>[
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      'Biodata Mahasiswa',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), labelText: 'NIM'),
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      controller: nim,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), labelText: 'Nama'),
                      controller: nama,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      maxLines: 3,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), labelText: 'Alamat'),
                      controller: alamat,
                    ),
                  ),
                  




                  Container(
                    padding: EdgeInsets.only(left: 12, top: 10),
                    child: Row(
                      children: [
                        Text(
                          'Jenis Kelamin',
                          style: TextStyle(fontSize: 17),
                        ),
                      ],
                    ),
                  ),

                  // create dropdown to select gender
                   Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                  padding: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
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
                  child: DropdownButton(
                    isExpanded: true,
                    underline: SizedBox(),
                    hint: Text('Jenis Kelamin'),
                    items: [
                      DropdownMenuItem(
                        child: Text('Laki - Laki'),
                        value: "Laki - Laki",

                      ),
                      DropdownMenuItem(
                        child: Text('Perempuan'),
                        value: "Perempuan",
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        gender = value.toString();
                      });
                    },
                  ),
                ),

                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10, top: 10),
                      ),
                      SizedBox(
                        height: 40,
                        width: MediaQuery.of(context).size.width / 2 - 13,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            primary: Colors.white,
                            backgroundColor: Colors.blue,
                          ),
                          onPressed: () {
                            _createItem();
                          },
                          child: Text('Submit'),
                        ),
                      ),
                      SizedBox(
                        width: 6.0,
                      ),
                      SizedBox(
                        height: 40,
                        width: MediaQuery.of(context).size.width / 2 - 13,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            primary: Colors.white,
                            backgroundColor: Colors.red,
                          ),
                          onPressed: clearText,
                          child: Text('Cancel'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Expanded(
                child: FutureBuilder(
                  future: _getBiodata(),
                  builder: (context, snapshot) {
                    return ListView.builder(
                      itemCount: _biodata.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            leading: CircleAvatar(
                              child: Icon(Icons.person),
                            ),
                            trailing: IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                _deleteItem(_biodata[index].id!);
                              },
                            ),
                            title: Text(_biodata[index].nama!),
                            subtitle: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10.0,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('NIM : ${_biodata[index].nim}'),
                                  Text('Alamat : ${_biodata[index].address!}'),
                                  Text(
                                      'Jenis Kelamin : ${_biodata[index].gender! == 'male' ? 'Laki - Laki' : 'Perempuan'}'),
                                  ElevatedButton(
                                      onPressed: (() {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailScreen(
                                                      nim: _biodata[index].nim!,
                                                      nama:
                                                          _biodata[index].nama!,
                                                      alamat: _biodata[index]
                                                          .address!,
                                                      gender: _biodata[index]
                                                          .gender!,
                                                    )));
                                      }),
                                      child: Text("Detail"))
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
