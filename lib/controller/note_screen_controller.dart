import 'package:flutter/material.dart';
import 'package:note_app/core/color_constants/color_constants.dart';

class NoteScreenController {
  static List noteList = [];
  // add note

  static void addNote({
    required String title,
    required String des,
    required String date,
    int clrIndex = 0,
  }) {
    noteList.add({
      "title": title,
      "des": des,
      "date": date,
      "colorIndex": clrIndex,
    });
  }

  static List<Color> colorlist = [
    Color_Constants.customPink,
    Color_Constants.primaryBlue,
    Color_Constants.primaycolor,
    Color_Constants.primarygreen,
  ];
  // delete note

  static void deleteNote(int index) {
    noteList.removeAt(index);
  }

//edit note

  static void editNote(
      {required String title,
      required String des,
      required String date,
      int clrIndex = 0,
      required int index}) {
    noteList[index] = {
      "title": title,
      "des": des,
      "date": date,
      "colorIndex": clrIndex,
    };
  }
}
