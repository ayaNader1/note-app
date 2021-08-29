import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_note_app/models/note_model.dart';
import 'package:flutter_app_note_app/ui/pages/details_note_page.dart';


class NoteWidget extends StatelessWidget{
  Note note;
  NoteWidget(this.note);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextButton(onPressed: (){
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailsNotePage(note)),
      );
    }, child:
      Container(
      // margin: EdgeInsets.all(10),
      padding: EdgeInsets.symmetric(vertical: 20 ,horizontal: 15),
      height: 180,
      width: 160,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(note.noteTitle ?? 'Title',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400,color: Colors.black),),
          SizedBox(height: 10,),
          Text(note.noteDetails ?? 'Details Note',
            overflow: TextOverflow.ellipsis,
            maxLines: 4,
            style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: Color(0xff606060)),),
          SizedBox(height: 20,),
          Text(note.noteDate ?? 'Wed 5:32',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400,color: Color(0xff606060)),)
        ],
      ),
    ),
    );
  }
  
}