part of 'fav_cubit.dart';

@immutable
abstract class FavState {}

class FavInitial extends FavState {}
class FavLoadingState extends FavState {}

class AddToFavSuccessState extends FavState {
  AddToFavModel favModel;

  AddToFavSuccessState(this.favModel);
}

class AddToFavErrorState extends FavState {
  Failures failures;

  AddToFavErrorState(this.failures);
}


class RemoveFromFavSuccessState extends FavState {
  RemoveFromFav favModel;
  RemoveFromFavSuccessState(this.favModel);
}

class RemoveFromFavErrorState extends FavState {
  Failures failures;

  RemoveFromFavErrorState(this.failures);
}


class GetFavSuccessStates extends FavState {
  FavResponse favResponse;
  GetFavSuccessStates(this.favResponse);
}

class GetFavErrorStates extends FavState {
  Failures failures;

  GetFavErrorStates(this.failures);
}
class SetFavoriteState extends FavState {}
