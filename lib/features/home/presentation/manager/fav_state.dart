part of 'fav_cubit.dart';

@immutable
abstract class FavoriteTabState extends Equatable {
  const FavoriteTabState();

  @override
  List<Object> get props => [];
}

class FavoriteTabInitial extends FavoriteTabState {}

class FavoriteTabMakeFavorite extends FavoriteTabState {}