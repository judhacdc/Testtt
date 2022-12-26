import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'models/biodata.dart';

// data
// table name = biodata
// id = integer, primary key, auto increment
// nim = integer
// name = text
// address = text
// gender = radio button ( text )

// define SQLHelper class
// this will create the table
class SQLHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE biodata(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        nim INTEGER,
        nama text,
        address TEXT,
        gender TEXT, 
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
      """);
  }

  // create database
  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'biodata.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  // create new data ( insert ) ( bio )
  static Future<int> createItem(Biodata biodata) async {
    final db = await SQLHelper.db();

    Map<String, dynamic> data = {
      'nim': biodata.nim,
      'nama': biodata.nama,
      'address': biodata.address,
      'gender': biodata.gender
    };

    final id = await db.insert('biodata', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  // read data ( select ) ( bio )
  static Future<List<Biodata>> getItems() async {
    final db = await SQLHelper.db();
    final List<Map<String, dynamic>> maps =
        await db.query('biodata', orderBy: "id");
    return List.generate(maps.length, (i) {
      return Biodata(
          id: maps[i]['id'],
          nim: maps[i]['nim'],
          nama: maps[i]['nama'],
          address: maps[i]['address'],
          gender: maps[i]['gender']);
    });
  }

  // read single data ( IMPORTANTE )
  static Future<Biodata> getItem(int id) async {
    final db = await SQLHelper.db();
    final List<Map<String, dynamic>> maps =
        await db.query('biodata', where: "id = ?", whereArgs: [id], limit: 1);
    return Biodata(
      id: maps[0]['id'],
      nim: maps[0]['nim'],
      nama: maps[0]['nama'],
      address: maps[0]['address'],
      gender: maps[0]['gender'],
    );
  }

  // update data ( update ) ( bio )
  static Future<int> updateItem(int id, Biodata biodata) async {
    final db = await SQLHelper.db();

    Map<String, dynamic> data = {
      'nim': biodata.nim,
      'nama': biodata.nama,
      'address': biodata.address,
      'gender': biodata.gender
    };

    final result =
        await db.update('biodata', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  // delete data ( delete ) ( bio )
  static Future<void> deleteItem(int id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete("biodata", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Cannot delete bio: $err");
    }
  }
}
