import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/widgets/add_note_sheet.dart';
import 'package:notes_app/widgets/custom_search_icon.dart';
import 'package:notes_app/widgets/notes_list.dart';

class notespage extends StatelessWidget {
  const notespage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 28,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Notes', style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: Colors.indigo
                ),),
                search(icon: Icons.search,)

              ],
            ),
            SizedBox(height: 10,),
            Expanded(child: noteslist()),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(onPressed: () {
        //used to add something in the same ui page

        showModalBottomSheet(
            isScrollControlled: true, //allow the sheet to scroll up

            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
            ),
            context: context, builder: (context) {
          return addnotesheet();

        });
      }, child: const Icon(Icons.add, color: Colors.black,),
        backgroundColor: kprimarycolor,
      ),

    );
  }
}

