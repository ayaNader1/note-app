import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_note_app/models/note_model.dart';
import 'package:flutter_app_note_app/provider/note_provider.dart';
import 'package:flutter_app_note_app/ui/pages/new_note_page.dart';
import 'package:flutter_app_note_app/ui/widgets/note_widget.dart';
import 'package:provider/provider.dart';


class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      appBar: AppBar(
        title: Text('Notes',style: TextStyle(color: Colors.black),),
        elevation: 0,
        backgroundColor: Colors.transparent,
          actions: [
          IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => NewNotePage()),
            );
          },
      icon: Icon(Icons.add),
      color: Color(0xffFFC60A),
    ),
    ]
      ),
      // body: GridView.builder(
      //     shrinkWrap: true,
      //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //       crossAxisCount: 2,
      //       mainAxisExtent: 200
      //     ),
      //     itemCount: 16,
      //     itemBuilder: (BuildContext context, int index) {
      //       return NoteWidget();
      //     }),
      body: Provider.of<MyProvider>(context).allNotes == null
          ? Center(
        child: CircularProgressIndicator(),
      ) :
      Selector<MyProvider,List<Note>>(builder: (context,data,x){
        return GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 200
            ),
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              return NoteWidget(data[index]);
            });
      },selector: (context,provider){
        return provider.allNotes;
      },)
    );
  }

}