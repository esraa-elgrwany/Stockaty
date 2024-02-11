import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_shopping_app/MyApp.dart';
import 'package:my_shopping_app/core/utils/observer.dart';


void main() {
  Bloc.observer=MyBlocObserver();

  runApp(const MyApp());
}



