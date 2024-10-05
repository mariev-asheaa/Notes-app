import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/simple_bloc_observer.dart';
import 'package:notes_app/views/notes.dart';


void main() async {
  await Hive.initFlutter(); //initialize hive
  Bloc.observer = simpleobserver();
  Hive.registerAdapter(notemodelAdapter());
//tell hive to connect and deal with the model
  //Any object can be stored using TypeAdapters.
  await Hive.openBox<notemodel>(knotesbox); //database collection
  runApp(Notes());
}

class Notes extends StatelessWidget {
  Notes({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: notespage(),
        theme: ThemeData(
            brightness: Brightness.dark
        ),

      ),
    );
  }
}
