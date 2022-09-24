import 'dart:js';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test2309/controller/note_controller.dart';
import 'package:test2309/screens/home_screen.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=> NoteController()),
      ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ChangeNotifierProvider<NoteController>(
          create: (context) => NoteController(),
          child: HomeScreen(),
        ));
  }
}
