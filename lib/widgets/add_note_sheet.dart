import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/widgets/add_note_form.dart';

import '../cubits/notes_cubit/notes_cubit.dart';

class addnotesheet extends StatelessWidget {
  const addnotesheet({super.key});

  @override
  Widget build(BuildContext context) {
    //we put BlocProvider always in front of the screen we want to use it on

    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNotesucces) {
            BlocProvider.of<NotesCubit>(context).showallnotes();
            Navigator.pop(context);
          }
          if (state is AddNotefailur) {

          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddNoteloading ? true : false,
            child: Padding(
              padding: EdgeInsets.only(left: 16, right: 16,
                bottom: MediaQuery
                    .of(context)
                    .viewInsets
                    .bottom
              //tell the screen to take padding for the keyboard
            ),
              child: const SingleChildScrollView(
                child: addnote(),
              ),
            ),
          );
        },
      ),
          );
  }
}
//SingleChildScrollView must be inside the ModalProgressHUD
//not the opposite