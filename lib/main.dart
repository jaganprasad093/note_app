import 'package:flutter/material.dart';
import 'package:note_app/view/note_screen/note_screen.dart';
import 'package:note_app/view/splash_screen/splash_screen.dart';

void main() {
  runApp(Note_app());
}

class Note_app extends StatelessWidget {
  const Note_app({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: Note_screen(),
    );
  }
}
