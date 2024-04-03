import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:note_app/controller/note_screen_controller.dart';
import 'package:note_app/core/color_constants/color_constants.dart';
import 'package:note_app/view/note_screen/widgets/custom_note.dart';

class Note_screen extends StatefulWidget {
  const Note_screen({super.key});

  @override
  State<Note_screen> createState() => _Note_screenState();
}

class _Note_screenState extends State<Note_screen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController desController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color_Constants.primaryBlack,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("PEN PAD"),
            SizedBox(
              height: 20,
            ),
            ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => Custom_notes(
                      date: NoteScreenController.noteList[index]["date"],
                      description: NoteScreenController.noteList[index]["des"],
                      title: NoteScreenController.noteList[index]["title"],
                      colorIndex: NoteScreenController.noteList[index]
                          ["colorIndex"],
                      onDeleteTap: () {
                        NoteScreenController.deleteNote(index);
                        setState(() {});
                      },
                      onEditTap: () {
                        titleController.text =
                            NoteScreenController.noteList[index]["title"];
                        desController.text =
                            NoteScreenController.noteList[index]["des"];
                        dateController.text =
                            NoteScreenController.noteList[index]["date"];
                        selectedIndex =
                            NoteScreenController.noteList[index]["colorIndex"];
                        showCustomBottomSheet(
                            context: context, index: index, isEdit: true);
                      },
                    ),
                separatorBuilder: (context, index) => SizedBox(
                      height: 10,
                    ),
                itemCount: NoteScreenController.noteList.length),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showCustomBottomSheet(context: context);
        },
        child: Icon(
          Icons.add,
          size: 30,
        ),
      ),
    );
  }

  Future<dynamic> showCustomBottomSheet(
      {required BuildContext context, int? index, bool isEdit = false}) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, bottomSetState) => Container(
          color: Color_Constants.primaryBlack.withOpacity(.3),
          child: Container(
            margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(padding: EdgeInsets.symmetric(vertical: 15)),
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                      hintText: "Title",
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 15)),
                TextField(
                  controller: desController,
                  decoration: InputDecoration(
                      hintText: "Description",
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 15)),
                TextField(
                  controller: dateController,
                  decoration: InputDecoration(
                      hintText: "Date",
                      suffixIcon: InkWell(
                          onTap: () async {
                            final selectedDateTime = await showDatePicker(
                                context: context,
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2040));
                            if (selectedDateTime != null) {
                              String FormatedDate = DateFormat("dd-MM-yyyy")
                                  .format(selectedDateTime);
                              dateController.text = FormatedDate.toString();
                            }

                            bottomSetState(() {});
                          },
                          child: Icon(Icons.date_range_outlined)),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(
                      NoteScreenController.colorlist.length,
                      (index) => InkWell(
                        onTap: () {
                          bottomSetState(
                            () {
                              selectedIndex = index;
                            },
                          );
                        },
                        child: Container(
                          height: 40,
                          width: 60,
                          decoration: BoxDecoration(
                              border: selectedIndex == index
                                  ? Border.all(
                                      color: Color_Constants.primaryBlack,
                                      width: 5)
                                  : null,
                              color: NoteScreenController.colorlist[index],
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    )),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 40,
                        width: 60,
                        child: Center(
                          child: Text(
                            "Cancel",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color_Constants.primaryWhite),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: Color_Constants.primaryBlack,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    SizedBox(
                      width: 35,
                    ),
                    InkWell(
                      onTap: () {
                        if (isEdit) {
                          NoteScreenController.editNote(
                              index: index!,
                              title: titleController.text,
                              des: desController.text,
                              date: dateController.text,
                              clrIndex: selectedIndex);
                        } else {
                          NoteScreenController.addNote(
                              title: titleController.text,
                              des: desController.text,
                              date: dateController.text,
                              clrIndex: selectedIndex);
                        }

                        Navigator.pop(context);
                        setState(() {});
                      },
                      child: Container(
                        height: 40,
                        width: 60,
                        child: Center(
                          child: Text(
                            isEdit ? "Edit" : "Save",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color_Constants.primaryWhite),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: Color_Constants.primaryBlack,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
