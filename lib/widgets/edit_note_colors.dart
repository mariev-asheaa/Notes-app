import 'package:flutter/cupertino.dart';
import 'package:notes_app/models/note_model.dart';
import '../constants.dart';
import 'colors_list.dart';

class editnotecolors extends StatefulWidget {
   editnotecolors({super.key,required this.note});
notemodel note;
  @override
  State<editnotecolors> createState() => _editnotecolorsState();
}

class _editnotecolorsState extends State<editnotecolors> {
  late int currentindex;
  //we want to use the initial color of the note as initeial value
  //we use initState because we must provide its value before we use it in the build
  @override
  void initState() {
currentindex=colores.indexOf(Color(widget.note.color));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35*2,
      child: ListView.builder(
          itemCount: colores.length,
          scrollDirection: Axis.horizontal,
          itemBuilder:(context,index){
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: GestureDetector(
                onTap: (){
                  currentindex=index;
                  //store the index of the item we clicked
              widget.note.color=colores[index].value;
                  setState(() {

                  });
                },
                child: coloritem(
                  color: colores[index],
                  isactive: currentindex==index,
                  //if the user clicked on this item it means that
                  // this is the current index

                ),
              ),
            );
          } ),
    );
  }
}
