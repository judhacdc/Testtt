import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DetailScreen extends StatelessWidget {
  int nim;
  String alamat;
  String nama;
  String gender;

  DetailScreen(
      {required this.nim,
      required this.alamat,
      required this.nama,
      required this.gender});

  @override
  Widget build(BuildContext context) {
    var widget;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Details Data Mahasiswa"),
          backgroundColor: Color(0xffF5591F),
        ),
        body: Container(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              const Text(
                'Data Mahasiswa',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: " CabalBold"),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  const Text(
                    'NIM',
                    style: TextStyle(
                        color: Colors.orange,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 46),
                    child: Text(nim.toString(), style: TextStyle(fontSize: 16)),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Text(
                    'Alamat',
                    style: TextStyle(
                        color: Colors.orange,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Text(alamat, style: TextStyle(fontSize: 16)),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Text(
                    'Nama',
                    style: TextStyle(
                        color: Colors.orange,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 36),
                    child: Text(nama, style: TextStyle(fontSize: 16)),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Text(
                    'Gender',
                    style: TextStyle(
                        color: Colors.orange,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Text(gender, style: TextStyle(fontSize: 16)),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
