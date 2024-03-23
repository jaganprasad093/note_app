import 'package:flutter/material.dart';
import 'package:note_app/core/color_constants/color_constants.dart';
import 'package:note_app/view/note_screen/widgets/custom_note.dart';

class Note_screen extends StatelessWidget {
  const Note_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color_Constants.primaryBlack,
      body: Column(
        children: [
          Text("PEN PAD"),
          SizedBox(
            height: 20,
          ),
          ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) => Custom_notes(),
              separatorBuilder: (context, index) => SizedBox(
                    height: 10,
                  ),
              itemCount: 2),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => StatefulBuilder(
              builder: (context, setState) => Container(
                color: Color_Constants.primaryBlack.withOpacity(.3),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Padding(padding: EdgeInsets.symmetric(vertical: 15)),
                      TextField(
                        decoration: InputDecoration(
                            hintText: "Title",
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                      Padding(padding: EdgeInsets.symmetric(vertical: 15)),
                      TextField(
                        decoration: InputDecoration(
                            hintText: "Description",
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                      Padding(padding: EdgeInsets.symmetric(vertical: 15)),
                      TextField(
                        decoration: InputDecoration(
                            hintText: "Date",
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 40,
                            width: 60,
                            decoration: BoxDecoration(
                                color: Color_Constants.normalYellow,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 40,
                            width: 60,
                            decoration: BoxDecoration(
                                color: Color_Constants.customPink,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 40,
                            width: 60,
                            decoration: BoxDecoration(
                                color: Color_Constants.primaryBlue,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 40,
                            width: 60,
                            decoration: BoxDecoration(
                                color: Color_Constants.primarygreen,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            height: 40,
                            width: 60,
                            child: Text("cancel"),
                            decoration: BoxDecoration(
                                color: Color_Constants.primarygreen,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        child: Icon(
          Icons.add,
          size: 30,
        ),
      ),
    );
  }
}
