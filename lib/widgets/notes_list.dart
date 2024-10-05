import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/note_container.dart';

class noteslist extends StatelessWidget {
  const noteslist({super.key});

  @override
  Widget build(BuildContext context) {
    //we must use expanded widget if we want to put listview
    // inside columns or rows to manage the hiegh in the screen
    //we can't use it with stack
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<notemodel>notes=BlocProvider.of<NotesCubit>(context).notes??[];
        return ListView.builder(
            itemCount:notes.length ,
            itemBuilder: (context, snapshot) {
          return Padding(
            padding:  const EdgeInsets.symmetric(vertical: 5),
            child: notecontainer(
              note: notes[snapshot],
            ),
          );
        });
      },
    );
  }
}
