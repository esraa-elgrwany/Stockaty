import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());
  String languageCode="en";
  ThemeMode modeApp=ThemeMode.light;
  bool isDark=false;

  static MainCubit get(context) => BlocProvider.of(context);

  changeLanguage(String langCode){
  languageCode=langCode;
  emit(HomeChangeLanguage());
  }

  changeMode(ThemeMode mode){
  modeApp=mode;
  emit(HomeChangeTheme());
  }
  }

