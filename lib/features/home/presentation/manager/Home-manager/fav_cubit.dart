import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/api/api-manager.dart';
import '../../../../../core/errors/failures.dart';
import '../../../data/data_sources/remote/home-remote-ds-impl.dart';
import '../../../data/data_sources/remote/home-remote-ds.dart';
import '../../../data/models/AddToFavModel.dart';
import '../../../data/models/FavResponse.dart';
import '../../../data/models/RemoveFromFav.dart';
import '../../../data/repositories/home-repo-impl.dart';
import '../../../domain/repositories/Home-repo.dart';
import '../../../domain/use_cases/Add_to_fav.dart';
import '../../../domain/use_cases/get_fav_use_case.dart';
import '../../../domain/use_cases/remove_from_fav.dart';

part 'fav_state.dart';

class FavCubit extends Cubit<FavState> {
  FavCubit() : super(FavInitial()) {}
  List<FavData> favs = [];
  bool isFavorite = false;

  static FavCubit get(context) => BlocProvider.of(context);

  void addToFav(String productId) async {
    emit(FavLoadingState());
    ApiManager apiManager = ApiManager();
    HomeRemoteDs remoteDs = HomeRemoteDsImpl(apiManager);
    HomeRepo homeRepo = HomeRepoImpl(remoteDs);
    AddToFavUseCase addToFavUseCase = AddToFavUseCase(homeRepo);
    var result = await addToFavUseCase.call(productId);
    result.fold((l) {
      emit(AddToFavErrorState(l));
    }, (r) {
      emit(AddToFavSuccessState(r));
    });
  }

  void removeFromFav(String productId) async {
    emit(FavLoadingState());
    ApiManager apiManager = ApiManager();
    HomeRemoteDs remoteDs = HomeRemoteDsImpl(apiManager);
    HomeRepo homeRepo = HomeRepoImpl(remoteDs);
    RemoveFromFavUseCase removeFromFavUseCase = RemoveFromFavUseCase(homeRepo);
    var result = await removeFromFavUseCase.call(productId);
    result.fold((l) {
      print(l);
      emit(RemoveFromFavErrorState(l));
    }, (r) {
      favs.removeWhere((fav) => fav.id == productId);
      emit(RemoveFromFavSuccessState(r));
    });
  }

  void getFav() async {
    emit(FavLoadingState());
    ApiManager apiManager = ApiManager();
    HomeRemoteDs remoteDs = HomeRemoteDsImpl(apiManager);
    HomeRepo homeRepo = HomeRepoImpl(remoteDs);
    GetFavUseCase getFavUseCase = GetFavUseCase(homeRepo);
    var result = await getFavUseCase.call();
    result.fold((l) {
      print("********************/////////////////////////");
      print(l.errormsg);
      emit(GetFavErrorStates(l));
    }, (r) {
      favs = r.data ?? [];
      emit(GetFavSuccessStates(r));
    });
  }
}
