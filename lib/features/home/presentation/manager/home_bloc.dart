import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_shopping_app/features/home/data/models/AddToCartModel.dart';
import 'package:my_shopping_app/features/home/data/models/CategoryAndBrandModel.dart';
import 'package:my_shopping_app/features/home/data/models/ProductsModel.dart';
import 'package:my_shopping_app/features/home/domain/use_cases/Add_to_cart.dart';
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
  TextEditingController searchController=TextEditingController();
  int numOfCartItems=0;


  static HomeBloc get(context) => BlocProvider.of(context);
  HomeBloc() : super(HomeInitial()) {

    on<HomeEvent>((event, emit) async{

//get brands
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

      //get categories
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

      //get BottomNavBar tabs
      else if (event is ChangeBottomNavBar) {
        emit(state.copWith(index: event.index));
      }


      //get products
      else if (event is GetProductsEvent) {
        emit(state.copWith(type: ScreenType.loading));
        ApiManager apiManager = ApiManager();
        HomeRemoteDs remoteDs = HomeRemoteDsImpl(apiManager);
        HomeRepo homeRepo = HomeRepoImpl(remoteDs);
        GetProductsUseCase getProductsUseCase = GetProductsUseCase(homeRepo);
        var res = await getProductsUseCase();
        res.fold((l) {
          emit(state.copWith(type: ScreenType.productError, failures: l));
        }, (r) {
          emit(state.copWith(
              type: ScreenType.productSuccess, products: r.data ?? []));
        });
      }
      //add to cart
      else if(event is AddToCartEvent){
        emit(state.copWith(type: ScreenType.loading));
        ApiManager apiManager = ApiManager();
        HomeRemoteDs remoteDs = HomeRemoteDsImpl(apiManager);
        HomeRepo homeRepo = HomeRepoImpl(remoteDs);
       AddToCartUseCase addToCartUseCase = AddToCartUseCase(homeRepo);
        var res = await addToCartUseCase(event.id);
        res.fold((l) {
          emit(state.copWith(type: ScreenType.addToCartError, failures: l));
        }, (r) {
          numOfCartItems=r.numOfCartItems??0;
          print("********************");
          print("NumOfCart:$numOfCartItems");
          emit(state.copWith(
              type: ScreenType.addToCartSuccess,addToCartModel: r));
        });
      }


  });
        }
}

