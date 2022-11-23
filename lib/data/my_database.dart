import 'dart:async';

import 'package:notes_app/model/note_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class MyDatabase {

  static Database? _db ;
  Future<Database?> get db async {
    if(_db == null){
      _db = await initialDb();
      return _db ;
    }else {
      return _db;
    }
  }

  initialDb() async{
    String dbPath = await getDatabasesPath();
    String path = join(dbPath , 'MyDb.db');
    Database myDb = await openDatabase(
      path ,
      onCreate: _onCreate ,
      version: 1 ,
      onUpgrade: _onUpgrade
    );
    return myDb;
  }

  _onUpgrade(Database db , int oldVersion , int newVersion){
    print('onUpgrade <==============================================================>');
  }

  _onCreate(Database db , int version) async{
    await db.execute(
      '''
      CREATE TABLE notes ( id INTEGER PRIMARY KEY , title TEXT , subTitle TEXT , date TEXT )
      '''
    );
    print('onCreate <===============================================================>');
  }

  readData(String sql) async {
    Database? myDb = await db ;
    List<Map> response = await myDb!.rawQuery(sql);
    return response;
  }

  insertData(String sql) async {
    Database? myDb = await db ;
    int response = await myDb!.rawInsert(sql);
    return response;
  }

  updateData(String sql) async {
    Database? myDb = await db ;
    int response = await myDb!.rawUpdate(sql);
    return response;
  }

  deleteData(String sql) async {
    Database? myDb = await db ;
    int response = await myDb!.rawDelete(sql);
    return response;
  }


  Future<void> insertNote(NoteModel model) async {
    Database? myDb = await db ;
    await myDb!.insert(
      'notes',
      model.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }


  Future<List<NoteModel>> notes() async {
    // Get a reference to the database.
    Database? myDb = await db ;

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await myDb!.query('notes');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return NoteModel(
        id: maps[i]['id'],
        title: maps[i]['title'],
        subTitle: maps[i]['subTitle'],
        date: maps[i]['date']
      );
    });
  }
}