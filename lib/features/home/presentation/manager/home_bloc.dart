import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_shopping_app/features/home/data/models/CategoryAndBrandModel.dart';
import 'package:my_shopping_app/features/home/data/models/ProductsModel.dart';
import 'package:my_shopping_app/features/home/domain/use_cases/Get-Category-UseCase.dart';
import 'package:my_shopping_app/features/home/domain/use_cases/get-brands-usecase.dart';
import '../../../../core/api/api-manager.dart';
import '../../../../core/errors/failures.dart';
import '../../data/data_sources/remote/home-remote-ds-impl.dart';
import '../../data/data_sources/remote/home-remote-ds.dart';
import '../../data/repositories/home-repo-impl.dart';
import '../../domain/repositories/Home-repo.dart';
import '../../domain/use_cases/Get_Products_UseCase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  static HomeBloc get(context) => BlocProvider.of(context);
  HomeBloc() : super(HomeInitial()) {

    on<HomeEvent>((event, emit) async{

      if (event is GetBrandsEvent) {
        emit(state.copWith(type: ScreenType.loading));
        ApiManager apiManager = ApiManager();
        HomeRemoteDs remoteDs = HomeRemoteDsImpl(apiManager);
        HomeRepo homeRepo = HomeRepoImpl(remoteDs);
        GetBrandUseCase getBrandsUseCase = GetBrandUseCase(homeRepo);
        var result = await getBrandsUseCase.call();
        result.fold((l) {
          emit(state.copWith(type: ScreenType.brandsError, failures: l));
        }, (r) {
          emit(state.copWith(type: ScreenType.brandsSuccess, brands: r.data));
        });
      }
      else if (event is GetCategoriesEvent) {
        emit(state.copWith(type: ScreenType.loading));
        ApiManager apiManager = ApiManager();
        HomeRemoteDs remoteDs = HomeRemoteDsImpl(apiManager);
        HomeRepo homeRepo = HomeRepoImpl(remoteDs);
        GetCategoryUseCase getCategoryUseCase = GetCategoryUseCase(homeRepo);
        var result = await getCategoryUseCase();
        print(result);
        result.fold((l) {
          emit(state.copWith(type: ScreenType.categoryError, failures: l));
        }, (r) {
          emit(state.copWith(
              type: ScreenType.categorySuccess, categories: r.data));
        });
    }
      else if (event is ChangeBottomNavBar) {
        emit(state.copWith(index: event.index));
      }
      else if (event is GetProductsEvent) {
        emit(state.copWith(type: ScreenType.loading));
        ApiManager apiManager = ApiManager();
        HomeRemoteDs remoteDs = HomeRemoteDsImpl(apiManager);
        HomeRepo homeRepo = HomeRepoImpl(remoteDs);
        GetProductsUseCase getProductsUseCase = GetProductsUseCase(homeRepo);
        var res = await getProductsUseCase();
        print(res);
        res.fold((l) {
          emit(state.copWith(type: ScreenType.productError, failures: l));
        }, (r) {
          emit(state.copWith(
              type: ScreenType.productSuccess, products: r.data ?? []));
        });
      }
  });
        }
}

