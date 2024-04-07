import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/view/note_screen/note_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox("notebox");
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
