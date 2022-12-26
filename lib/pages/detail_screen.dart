import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DetailScreen extends StatelessWidget {
   int nim;
   String alamat;
   String nama;
   String gender;

   DetailScreen({required this.nim,  required this.alamat, required this.nama, required this.gender});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(nim.toString()),
          Text(alamat),
          Text(nama),
          Text(gender),
        ],
      ),
    );
  }
}
