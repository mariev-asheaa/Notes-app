import 'package:hive/hive.dart';
part 'note_model.g.dart';
//Hive must make adapter for objects so we use data types
//instead of creating DateTime or Color objects

//if the class attributes like title,..will change
// depends on the user then we remove final
@HiveType(typeId: 0) //unique id for every class
class notemodel extends HiveObject{
  @HiveField(0)      //unique id for every attribute for this class
 String title;
  @HiveField(1)
 String content;
  @HiveField(2)
final String date;
  @HiveField(3)
 int color;

notemodel({required this.title,
  required this.content,
  required this.date,required this.color,
});



}