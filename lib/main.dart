import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_shopping_app/MyApp.dart';
import 'package:my_shopping_app/core/cache/shared_preferences.dart';
import 'package:my_shopping_app/core/utils/observer.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer=MyBlocObserver();

  await CacheData.init();
 String start;
 String? token=CacheData.getData(key: "token");
 if(token==null){
   start="/";
 }else{
   start="home";
 }
  runApp( MyApp(start));
}



