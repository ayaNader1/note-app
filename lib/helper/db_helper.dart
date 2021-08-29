import 'package:flutter_app_note_app/models/note_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';
import 'dart:io';

class DBHelper {
  DBHelper._();

  static DBHelper dbHelper = DBHelper._();
  static final String dbName = 'notes.db';
  static final String tableName = 'notes';
  static final String idColumn = 'id';
  static final String noteTitleColumn = 'noteTitle';
  static final String noteDetailsColumn = 'noteDetails';
  static final String noteDateColumn = 'noteDate';
  Database database;

  initDatabase() async {
    database = await createConnection();
  }

  Future<Database> createConnection() async {
    Directory directory = await getApplicationDocumentsDirectory();

    Database database = await openDatabase(join(directory.path, dbName),
        version: 1, onCreate: (db, version) {
          db.execute(
              '''CREATE TABLE $tableName ($idColumn INTEGER PRIMARY KEY AUTOINCREMENT, $noteTitleColumn TEXT, $noteDetailsColumn TEXT, $noteDateColumn TEXT)''');
        });
    return database;
  }

  Future<int> createNewNote(Note noteModel) async {
    try {
      int x = await database.insert(tableName, noteModel.toMap());
      return x;
    } on Exception catch (e) {
      return null;
    }
  }

  Future<List<Note>> getAllNotes() async {
    try {
      List<Map<String, dynamic>> results = await database.query(tableName);
      List<Note> notes = results.map((e) => Note.fromMap(e)).toList();
      return notes;
    } on Exception catch (e) {
      return null;
    }
  }

  Future<bool> updateNote(Note noteModel) async {
    try {
      await database.update(tableName, noteModel.toMap(),
          where: '$idColumn=?', whereArgs: [noteModel.id]);
      return true;
    } on Exception catch (e) {
      return null;
    }
  }

  deleteNote(Note noteModel) async {
    try {
      await database
          .delete(tableName, where: '$idColumn=?', whereArgs: [noteModel.id]);
      return true;
    } on Exception catch (e) {
      return null;
    }
  }
}