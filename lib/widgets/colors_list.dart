import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';

import '../constants.dart';

class coloritem extends StatelessWidget {
  const coloritem({super.key, required this.isactive,required this.color});

final bool isactive;
final Color color;
  @override
  Widget build(BuildContext context) {
    //if the item is active make changes to the circle

    return isactive? CircleAvatar(
      radius: 35,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        radius: 32,
        backgroundColor: color,
      ),
    ):  CircleAvatar(
      radius: 35,
      backgroundColor: color,
    );

  }
}

class colorlist extends StatefulWidget {
  const colorlist({super.key});

  @override
  State<colorlist> createState() => _colorlistState();
}

class _colorlistState extends State<colorlist> {

int currentindex=0;

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

                  BlocProvider.of<AddNoteCubit>(context).color=colores[index];
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
