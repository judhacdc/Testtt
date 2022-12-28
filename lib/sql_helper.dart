import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:flutter_application_1/models/biodata.dart';

class SQLHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE mhsBio(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        nim INTEGER,
        nama text,
        no_hp INTEGER,
        address TEXT,
        gender TEXT, 
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
      """);
  }

  // create database
  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'mhsBio.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  // create new data ( insert ) ( bio )
  static Future<int> createItem(Biodata biodata) async {
    final db = await SQLHelper.db();

    final data = {
      'nim': biodata.nim,
      'nama': biodata.nama,
      'no_hp': biodata.no_hp, // <--- 'no_hp
      'address': biodata.address,
      'gender': biodata.gender
    };

    final id = await db.insert('mhsBio', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  // read data ( select ) ( bio )
  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SQLHelper.db();
    return db.query('mhsBio', orderBy: "id");
  }

  // read single data ( IMPORTANTE )
  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await SQLHelper.db();
    return db.query('mhsBio', where: "id = ?", whereArgs: [id], limit: 1);
  }

  // update data ( update ) ( bio )
  static Future<int> updateItem(
      int id, int nim, int no_hp,String nama, String address, String gender) async {
    final db = await SQLHelper.db();

    final data = {
      'nim': nim,
      'nama': nama,
      'no_hp': no_hp, // <--- 'no_hp
      'address': address,
      'gender': gender
    };

    final result =
        await db.update('mhsBio', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  // delete data ( delete ) ( bio )
  static Future<void> deleteItem(int id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete("mhsBio", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Cannot delete bio: $err");
    }
  }
}