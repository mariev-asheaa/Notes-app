import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class textfield extends StatelessWidget {
  const textfield({super.key, this.hint, this.maxlines, this.onsave, this.onchange});
final String? hint;
final int? maxlines;
final void Function(String?)? onsave;
final  Function(String)? onchange;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
   onSaved:onsave ,
onChanged: onchange,
validator: (value){
     if(value?.isEmpty??true){
       return 'this field is required';
     }
},
      maxLines: maxlines,//number of lines in the textfield
      cursorColor: kprimarycolor,
    decoration: InputDecoration(
      hintText: hint,
hintStyle: TextStyle(color: Colors.blue),


enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
  borderSide: BorderSide(
    color: Colors.white
  )
),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(
    color:kprimarycolor
    )
    ),
    ),
    );
  }
}
