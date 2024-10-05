import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_note.dart';

class notecontainer extends StatelessWidget {
  const notecontainer({super.key,required this.note});
final notemodel note;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
        return edit(note: note,);
        }));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 28,),
        decoration: BoxDecoration(
          color: Color(note.color),
          borderRadius: BorderRadius.circular(16)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(note.title,style: const TextStyle(
                fontSize: 30,
                color: Colors.black
              ),),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(
                 note.content,
                style: const TextStyle(
                    fontSize: 18,
                  color: Colors.black
                ),
                ),
              ),
              trailing: IconButton(onPressed: (){
                note.delete();
                BlocProvider.of<NotesCubit>(context).showallnotes();
              },
               icon: Icon(FontAwesomeIcons.trash),color: Colors.black,),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(note.date, style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black
              ),),
            )
          ],
        ),

      ),
    );
  }
}
