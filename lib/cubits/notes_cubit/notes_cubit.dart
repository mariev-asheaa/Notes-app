import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import '../../constants.dart';
import '../../models/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  List<notemodel>?notes;
  showallnotes()  {
      var notesbox=Hive.box<notemodel>(knotesbox);
   notes= notesbox.values.toList();
emit(Notessucces());
      //bring the notes I added from the collection database
    }
}
