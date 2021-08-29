import 'package:flutter/cupertino.dart';

class Note{
  int id;
  String noteTitle;
  String noteDetails;
  String noteDate;
  Note({
    this.id,
    @required this.noteTitle,
    @required this.noteDetails,
    this.noteDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'noteTitle': noteTitle,
      'noteDetails': noteDetails,
      'noteDate': noteDate,
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id : map['id'],
      noteTitle : map['noteTitle'],
      noteDetails: map['noteDetails'],
      noteDate: map['noteDate']
    );
  }


}