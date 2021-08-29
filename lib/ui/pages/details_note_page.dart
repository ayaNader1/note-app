import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_note_app/models/note_model.dart';
import 'package:flutter_app_note_app/provider/note_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DetailsNotePage extends StatefulWidget {
  Note note;
  DetailsNotePage(this.note);
  @override
  DetailsNotePageState createState() => DetailsNotePageState();
}
class DetailsNotePageState extends State<DetailsNotePage> {
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
        title: Text('Note',style: TextStyle(color: Colors.black),),
        actions: [
          IconButton(onPressed: (){
            Provider.of<MyProvider>(context,listen: false)
                .deleteNote(widget.note);
            Navigator.pop(context);
          }, icon:Icon(Icons.delete_outline,color: Color(0xffFFC60A),), ),
          SizedBox(width: 10,),
        ],
      ),
        body: Container(
          margin: EdgeInsets.symmetric(vertical: 20,horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              editTitleTextField(),
              SizedBox(height: 20,),
              editDetailTextField(),

            ],
          ),
        )
    );
  }

  bool isEditingText = false;
  TextEditingController editingController;
  TextEditingController editingController1;
  String tilteText = "Title";
  String detailsText = "Detail Text";
  int tORd = 0;


  @override
  void initState() {
    super.initState();
    editingController = TextEditingController(text: widget.note.noteTitle ?? tilteText);
    editingController1 = TextEditingController(text: widget.note.noteDetails ?? detailsText);
  }
  @override
  void dispose() {
    editingController.dispose();
    editingController1.dispose();
    super.dispose();
  }

  Widget editTitleTextField() {
    if (isEditingText)
      return Center(
        child: TextField(
          onSubmitted: (newValue){
            if (newValue != widget.note.noteTitle){
              var now = new DateTime.now();
              var formatter = new DateFormat('EEE kk:mm');
              String formattedDate = formatter.format(now);
              widget.note.noteDate = formattedDate;
              print(formattedDate);
            }
            setState(() {
              widget.note.noteTitle = newValue;
              isEditingText =false;
            });
            Provider.of<MyProvider>(context,listen: false).updateNote(widget.note);
          },
          autofocus: tORd == 0,
          controller: editingController,
          cursorColor: Color(0xffFFC60A),
          decoration: InputDecoration(
              border: OutlineInputBorder(borderSide: BorderSide.none)
          ),
        ),
      );
    return InkWell(
        onTap: () {
      setState(() {
        tORd = 0;
        isEditingText = true;
      });
    },
    child: Text(
      widget.note.noteTitle ?? tilteText,
    style: TextStyle(
    color: Colors.black,
    fontSize: 17.0,
    ),
    ));
  }
  Widget editDetailTextField() {
    if (isEditingText)
      return Center(
        child: TextField(
          onSubmitted: (newValue){
            if (newValue != widget.note.noteDetails){
              var now = new DateTime.now();
              var formatter = new DateFormat('EEE kk:mm');
              String formattedDate = formatter.format(now);
              widget.note.noteDate = formattedDate;
              print(formattedDate);
            }
            setState(() {
              widget.note.noteDetails = newValue;
              isEditingText =false;
            });
            Provider.of<MyProvider>(context,listen: false).updateNote(widget.note);
          },
          autofocus: tORd == 1,
          controller: editingController1,
          cursorColor: Color(0xffFFC60A),
          decoration: InputDecoration(
              border: OutlineInputBorder(borderSide: BorderSide.none)
          ),
          // keyboardType: TextInputType.multiline,
          // maxLines: null,
        ),
      );
    return InkWell(
        onTap: () {
          setState(() {
            tORd = 1;
            isEditingText = true;
          });
        },
        child: Text(
          widget.note.noteDetails ?? detailsText,
          style: TextStyle(
            color: Color(0xff606060),
            fontWeight: FontWeight.w400,
            fontSize: 15.0,
          ),
        ));
  }

}



