import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/models/biodata.dart';
import 'package:flutter_application_1/sql_helper.dart';
import 'package:flutter_application_1/models/biodata.dart';
import 'package:flutter_application_1/pages/detail_screen.dart';

// Make Form with radio button
class HomePage extends StatefulWidget {
  @override
  _FormData createState() => _FormData();
}

class _FormData extends State<HomePage> {
  String? gender;
  final nim = TextEditingController();
  final nama = TextEditingController();
  final no_hp = TextEditingController();
  final address = TextEditingController();

  List<Map<String, dynamic>> _biodata = [];

  // Make Function, clear data when 'Cancel'
  void clearText() {
    nim.clear();
    nama.clear();
    no_hp.clear();
    address.clear();
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
      no_hp: int.parse(no_hp.text),
      address: address.text,
      gender: gender,
    );

    int id = await SQLHelper.createItem(biodata);
    print(id);
  }

  //fungsi update
  Future<int> _updateItem(int id) async {
    final db = await SQLHelper.db();

    final biodata = {
      'nim': int.parse(nim.text),
      'nama': nama.text,
      'no_hp': int.parse(no_hp.text),
      'address': address.text,
      'gender': gender,
    };

    final result =
        await db.update('mhsBio', biodata, where: 'id = ?', whereArgs: [id]);
    return result;
  }

  //fungsi panggil data
  Future<void> _getBiodata() async {
    final data = await SQLHelper.getItems();
    setState(() {
      _biodata = data;
    });
  }

  //fungsi hapus data
  Future<void> _deleteItem(int id) async {
    print(id);
    await SQLHelper.deleteItem(id);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffF5591F),
          title: const Text(
            "Mahasiswa",
          ),
          centerTitle: true,
          bottom: TabBar(
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
          ),
        ),
        body: TabBarView(children: [
          Scaffold(
            body: ListView(
              padding: EdgeInsets.all(16.0),
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
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.orange)),
                        labelText: 'NIM'),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    controller: nim,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.orange)),
                        labelText: 'Nama'),
                    controller: nama,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.orange)),
                        labelText: 'No HP'),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    controller: no_hp,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    maxLines: 3,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.orange)),
                        labelText: 'Alamat'),
                    controller: address,
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
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: 4, bottom: 4),
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
                        child: Text('Pria'),
                        value: "male",
                      ),
                      DropdownMenuItem(
                        child: Text('Wanita'),
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
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                    ),
                    SizedBox(
                      height: 40,
                      width: MediaQuery.of(context).size.width / 2 - 25,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Colors.blue,
                        ),
                        onPressed: () => [
                          showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              title: const Text("Alert"),
                              content: const Text("Data Berhasil Disimpan"),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(ctx).pop();
                                  },
                                  child: Container(
                                    color: Colors.blue,
                                    padding: const EdgeInsets.all(14),
                                    child: const Text(
                                      "okay",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          _createItem(),
                          clearText()
                        ],
                        child: Text('Submit'),
                      ),
                    ),
                    SizedBox(
                      width: 6.0,
                    ),
                    SizedBox(
                      height: 40,
                      width: MediaQuery.of(context).size.width / 2 - 25,
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
          ),
          Expanded(
            child: FutureBuilder(
              future: _getBiodata(),
              builder: (context, snapshot) {
                return ListView.builder(
                  itemCount: _biodata.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      // on tap nya disini
                      child: Card(
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Icon(Icons.person),
                          ),
                          trailing: SizedBox(
                            width: 150,
                            child: Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.details),
                                  onPressed: (() {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => DetailScreen(
                                              id: _biodata[index]['id'],
                                              gender: _biodata[index]['gender'],
                                              nim: _biodata[index]['nim'],
                                              nama: _biodata[index]['nama'],
                                              no_hp: _biodata[index]['no_hp'],
                                              address: _biodata[index]
                                                  ['address']),
                                        ));
                                  }),
                                ),
                                IconButton(
                                  icon: Icon(Icons.edit),
                                  onPressed: () =>
                                      _showForm(_biodata[index]['id']),
                                ),
                                IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (ctx) => AlertDialog(
                                          title: const Text("Alert"),
                                          content:
                                              const Text("Yakin Hapus Data?"),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () {
                                                _deleteItem(
                                                    _biodata[index]['id']);
                                                Navigator.of(ctx).pop();
                                              },
                                              child: Container(
                                                color: Colors.red,
                                                padding:
                                                    const EdgeInsets.all(14),
                                                child: const Text(
                                                  "Yes",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(ctx).pop();
                                              },
                                              child: Container(
                                                color: Colors.blue,
                                                padding:
                                                    const EdgeInsets.all(14),
                                                child: const Text(
                                                  "No",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }),
                              ],
                            ),
                          ),
                          title: Text(_biodata[index]['nama']),
                          subtitle: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10.0,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('NIM    : ${_biodata[index]['nim']}'),
                                Text("No HP  : ${_biodata[index]['no_hp']}"),
                                Text("Alamat : ${_biodata[index]['address']}"),
                                Text(
                                    'Gender : ${_biodata[index]['gender'] == 'male' ? 'Pria' : 'Wanita'}'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ]),
      ),
    );
  }

  Future<void> addItem(Biodata biodata) async {
    int result = await SQLHelper.createItem(biodata);
    if (result > 0) {
      nim.text = '';
      nama.text = '';
      no_hp.text = '';
      address.text = '';
      setState(() {
        gender = null;
      });
    }
  }

  void _showForm(int? id) {
    if (id != null) {
      // id == null -> create new item
      // id != null -> update an existing item
      final currentBiodata =
          _biodata.firstWhere((element) => element['id'] == id);
      nim.text = currentBiodata['nim'].toString();
      nama.text = currentBiodata['nama'];
      no_hp.text = currentBiodata['no_hp'].toString();
      address.text = currentBiodata['address'];
      gender = currentBiodata['gender'];
    }

    showModalBottomSheet(
      context: context,
      elevation: 5,
      isScrollControlled: true,
      builder: (_) => Scaffold(
        body: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            Container(
              padding: EdgeInsets.all(15),
              child: Text(
                'Update Mahasiswa',
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
                    // biar highlightnya berwarna
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange)),
                    labelText: 'NIM'),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                controller: nim,
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange)),
                    labelText: 'Nama'),
                controller: nama,
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange)),
                    labelText: 'No HP'),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                controller: no_hp,
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                maxLines: 3,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange)),
                    labelText: 'Alamat'),
                controller: address,
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
            Row(
              children: [
                Expanded(
                  child: RadioListTile(
                    contentPadding: EdgeInsets.only(left: 10, bottom: 30),
                    title: Text(
                      'Laki - Laki',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    value: 'male',
                    groupValue: gender,
                    toggleable: true,
                    dense: true,
                    onChanged: (value) {
                      setState(() {
                        gender = value.toString();
                      });
                    },
                  ),
                ),
                SizedBox(
                  width: 5.0,
                ),
                Expanded(
                  child: RadioListTile(
                    contentPadding: EdgeInsets.only(bottom: 30),
                    title: Text(
                      'Perempuan',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    value: 'Perempuan',
                    groupValue: gender,
                    toggleable: true,
                    dense: true,
                    onChanged: (value) {
                      setState(() {
                        gender = value.toString();
                      });
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10),
                ),
                SizedBox(
                  height: 40,
                  width: MediaQuery.of(context).size.width / 2 - 25,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Colors.blue,
                    ),
                    onPressed: () {
                      if (id != null) {
                        _updateItem(id);
                      }

                      Navigator.pop(context);
                      showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: const Text("Alert"),
                          content: const Text("Data Berhasil Diperbarui"),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                color: Colors.blue,
                                padding: const EdgeInsets.all(14),
                                child: const Text(
                                  "okay",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    child: Text('Update'),
                  ),
                ),
                SizedBox(
                  width: 6.0,
                ),
                SizedBox(
                  height: 40,
                  width: MediaQuery.of(context).size.width / 2 - 25,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Colors.red,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Cancel'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
