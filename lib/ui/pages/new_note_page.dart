import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_note_app/models/note_model.dart';
import 'package:flutter_app_note_app/provider/note_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class NewNotePage extends StatelessWidget{
  TextEditingController titleController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Color(0xffFFC60A), //change your color here
        ),
        title: Text('New Note',style: TextStyle(color: Colors.black),),
        actions: [
          IconButton(onPressed: (){
            var now = new DateTime.now();
            var formatter = new DateFormat('EEE kk:mm');
            String formattedDate = formatter.format(now);
            print(formattedDate);
            Provider.of<MyProvider>(context,listen: false)
                .insertNote(Note(noteTitle : titleController.text,noteDetails: detailsController.text , noteDate: formattedDate));
            Navigator.pop(context);
          }, icon:Icon(Icons.check,color: Color(0xffFFC60A),),),
          SizedBox(width: 10,),
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20,),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              cursorColor: Color(0xffFFC60A),
              decoration: InputDecoration(
                hintText: 'Title',
                  border: OutlineInputBorder(borderSide: BorderSide.none)
              ),
              style: TextStyle(
                fontSize: 17
              ),
            ),
            TextField(
              controller: detailsController,
              autofocus: true,
              cursorColor: Color(0xffFFC60A),
              decoration: InputDecoration(
                  border: OutlineInputBorder(borderSide: BorderSide.none)
              ),
              keyboardType: TextInputType.multiline,
              maxLines: null,
            ),
          ],
        ),
      ),
    );
  }

}