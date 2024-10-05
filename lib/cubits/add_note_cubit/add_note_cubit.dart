import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  Color color= Color(0xffeae2b7);
//primary color
  addnote(notemodel note)async{
    //function to add note to the collection on database
note.color=color.value;
    emit(AddNoteloading());
    try{
      var notesbox=Hive.box<notemodel>(knotesbox);
     await notesbox.add(note);
      emit(AddNotesucces());
    }
    catch(e){
emit(AddNotefailur(e.toString()));
    }
  }
}
