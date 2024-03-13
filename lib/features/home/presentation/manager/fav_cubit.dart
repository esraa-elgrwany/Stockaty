import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'fav_state.dart';

class FavoriteTabCubit extends Cubit<FavoriteTabState> {
  FavoriteTabCubit() : super(FavoriteTabInitial());

  static FavoriteTabCubit get(context) => BlocProvider.of(context);
  TextEditingController searchBarController = TextEditingController();
  bool isFavorite = false;

  void makeFavorite() {
    emit(FavoriteTabInitial());
    isFavorite = isFavorite == false ? true : false;
    emit(FavoriteTabMakeFavorite());
  }
}
