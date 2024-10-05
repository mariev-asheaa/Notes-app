import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/colors_list.dart';
import 'package:notes_app/widgets/custom_search_icon.dart';
import 'package:notes_app/widgets/edit_note_colors.dart';
import 'package:notes_app/widgets/text_field.dart';

import '../constants.dart';

class edit extends StatefulWidget {
  //we convert to StatefulWidget
  // if we take arguments from the user

  const edit({super.key, required this.note});
final notemodel note;

  @override
  State<edit> createState() => _editState();
}

class _editState extends State<edit> {
  String ?title,content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Padding(
       padding: const EdgeInsets.symmetric(horizontal: 16),
       child: Column(
         children: [
           const SizedBox(height: 28,),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               const Text('Edit',style: TextStyle(
               fontWeight: FontWeight.bold,
               fontSize:35,
               color: Colors.indigo
           ),),
               search(icon: Icons.check,onpressed: (){
             if(title!=null){
               widget.note.title=title!;
             }
             if(content!=null){
               widget.note.content=content!;
             }
             widget.note.save();
             BlocProvider.of<NotesCubit>(context).showallnotes();
             //this line make changes immediatelly to the note
             Navigator.pop(context);
               },)
             ],
           ),
           const SizedBox(
             height: 30,
           ),
           textfield(
             onchange: (value){
               title=value;
             },
             hint: 'New Title',
           ),
           const SizedBox(
             height: 16,
           ),
           textfield(
             onchange: (value){
               content=value;
             },
             hint: 'New Content',
             maxlines: 5,
           ),
Padding(
  padding: const EdgeInsets.symmetric(vertical: 20),
  child: editnotecolors(note: widget.note,),
)
         ],
       ),
     ),
    );
  }
}
