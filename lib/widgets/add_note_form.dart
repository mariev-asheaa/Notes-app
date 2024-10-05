import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/button.dart';
import 'package:notes_app/widgets/colors_list.dart';
import 'package:notes_app/widgets/text_field.dart';

class addnote extends StatefulWidget {
  const addnote({super.key});

  @override
  State<addnote> createState() => _addnoteState();
}

class _addnoteState extends State<addnote> {
  final GlobalKey<FormState>formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  //used to check the text field inputs
  String?title, content;

  //we always use final keyword with only stateless widget

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
     autovalidateMode: autovalidateMode,

      child: Column(
        children: [
          const SizedBox(height: 16,),

          textfield(hint: 'Title',

            onsave: (value) {
              title = value;
            },),
          const SizedBox(height: 25,),
          textfield(hint: 'Content', maxlines: 5,
            onsave: (value) {
              content = value;
            },
          ),

          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: colorlist(),
          ),
          const SizedBox(height: 45,),
          BlocBuilder<AddNoteCubit, AddNoteState>(
                    builder: (context, state) {
                      return button(
                          isloading: state is AddNoteloading?true:false,
                          ontap: () {
                        if (formkey.currentState!.validate()) {
                          formkey.currentState!.save();

                          final now = new DateTime.now();
                          String formatter = DateFormat('yMd').format(now);
                          notemodel obj = notemodel(title: title!, content: content!,
                              date: formatter.toString(), color: Colors.blue.value
                            //.value used to return it to int
                          );
                          BlocProvider.of<AddNoteCubit>(context).addnote(obj);
                        } else {
                         autovalidateMode = AutovalidateMode.always;
                          setState(() {

                          });
                        }
                      }, label: 'Add', color: kprimarycolor, textcolor: Colors.black);
                    },
                  )
        ],
      ),
    );
  }
}
