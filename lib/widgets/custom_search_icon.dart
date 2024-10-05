import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class search extends StatelessWidget {
  const search({super.key, required this.icon, this.onpressed});
final IconData icon;
final void Function()? onpressed;
  @override
  Widget build(BuildContext context) {
    return   Container(
        child:IconButton(
          onPressed:onpressed,
       icon: Icon(icon,size: 25,)),
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.withOpacity(.4)
        ),

    );
  }
}
