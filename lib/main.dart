import 'package:flutter/material.dart';
import 'package:flutter_app_note_app/helper/db_helper.dart';
import 'package:flutter_app_note_app/provider/note_provider.dart';
import 'package:flutter_app_note_app/ui/pages/home_page.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.dbHelper.initDatabase();
  runApp(ChangeNotifierProvider(create: (context) => MyProvider(),child:MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  )));
}

