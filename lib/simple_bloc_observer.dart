import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//help us trigger the states and exceptions
class simpleobserver implements BlocObserver{
  @override
  void onChange(BlocBase bloc, Change change) {
    debugPrint('chang=$change');//better than print statement
  }

  @override
  void onClose(BlocBase bloc) {
    debugPrint('close=$bloc');
  }

  @override
  void onCreate(BlocBase bloc) {
    debugPrint('create=$bloc');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    // TODO: implement onError
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    // TODO: implement onEvent
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    // TODO: implement onTransition
  }


}