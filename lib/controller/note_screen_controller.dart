import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/core/color_constants/color_constants.dart';

class NoteScreenController {
  static List noteListKeys = [];
// hive refernce

  static var myBox = Hive.box("notebox");

  // add note
  static getInitkeys() {
    noteListKeys = myBox.keys.toList();
  }

  static Future<void> addNote({
    required String title,
    required String des,
    required String date,
    int clrIndex = 0,
  }) async {
    await myBox.add({
      "title": title,
      "des": des,
      "date": date,
      "colorIndex": clrIndex,
    });
    noteListKeys = myBox.keys.toList();
  }

  static List<Color> colorlist = [
    Color_Constants.customPink,
    Color_Constants.primaryBlue,
    Color_Constants.primaycolor,
    Color_Constants.primarygreen,
  ];
  // delete note

  static Future<void> deleteNote(var key) async {
    await myBox.delete(key);
    noteListKeys.removeAt(key);
  }

//edit note

  static void editNote({
    required var key,
    required String title,
    required String des,
    required String date,
    int clrIndex = 0,
  }) {
    myBox.put(key, {
      "title": title,
      "des": des,
      "date": date,
      "colorIndex": clrIndex,
    });
  }
}
