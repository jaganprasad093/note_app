import 'package:flutter/material.dart';
import 'package:note_app/controller/note_screen_controller.dart';
import 'package:note_app/core/color_constants/color_constants.dart';

class Custom_notes extends StatelessWidget {
  const Custom_notes({
    super.key,
    required this.title,
    required this.description,
    required this.date,
    required this.colorIndex,
    this.onDeleteTap,
    this.onEditTap,
    this.onShareTap,
  });

  final String title;
  final String description;
  final String date;
  final int colorIndex;
  final void Function()? onDeleteTap;
  final void Function()? onEditTap;
  final void Function()? onShareTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
            color: NoteScreenController.colorlist[colorIndex],
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                // SizedBox(
                //   width: 130,
                // ),
                Row(
                  children: [
                    InkWell(onTap: onEditTap, child: Icon(Icons.edit)),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(onTap: onDeleteTap, child: Icon(Icons.delete)),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  description,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  date,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                SizedBox(width: 10),
                InkWell(onTap: onShareTap, child: Icon(Icons.share)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
