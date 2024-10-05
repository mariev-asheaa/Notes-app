import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class button extends StatelessWidget {
  const button({super.key,required this.ontap,required this.label,required this.color,required this.textcolor, this.isloading=false});
  final String label;
  final Color color,textcolor;
  final VoidCallback ontap;
  final bool isloading;

  @override
  Widget build(BuildContext context) {
    return
      GestureDetector(
        onTap: ontap,
        child: Padding(
          padding:const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(10)
            ),

            child: Center(
              child:isloading?const SizedBox(
                height: 20,
                width: 20,
                child:  CircularProgressIndicator(
                  color: Colors.black,
                ),
              ): Text(label,
                style: TextStyle(
                    color: textcolor,
                    fontSize: 20
                ),
              ),

            ),
          ),
        ),
      );

  }
}
