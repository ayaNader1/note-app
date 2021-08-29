import 'package:flutter/cupertino.dart';
import 'package:flutter_app_note_app/helper/db_helper.dart';
import 'package:flutter_app_note_app/models/note_model.dart';


class MyProvider extends ChangeNotifier{
  List<Note> allNotes;
  MyProvider(){
    getAllNotes();
  }

  getAllNotes() async {
    this.allNotes = await DBHelper.dbHelper.getAllNotes();
    notifyListeners();
  }
  insertNote(Note noteModel) async {
    await DBHelper.dbHelper.createNewNote(noteModel);
    getAllNotes();
  }
  deleteNote(Note noteModel) async {
    await DBHelper.dbHelper.deleteNote(noteModel);
    getAllNotes();
  }
  updateNote(Note noteModel) async {
    await DBHelper.dbHelper.updateNote(noteModel);
    getAllNotes();
  }
}