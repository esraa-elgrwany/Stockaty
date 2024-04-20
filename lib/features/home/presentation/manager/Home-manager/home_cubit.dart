import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_shopping_app/features/home/data/data_sources/remote/home-remote-ds.dart';
import 'package:my_shopping_app/features/home/data/models/AddToCartModel.dart';
import 'package:my_shopping_app/features/home/data/models/AddToFavModel.dart';
import 'package:my_shopping_app/features/home/data/models/CategoryAndBrandModel.dart';
import 'package:my_shopping_app/features/home/data/models/ProductsModel.dart';
import 'package:my_shopping_app/features/home/data/repositories/home-repo-impl.dart';
import 'package:my_shopping_app/features/home/domain/repositories/Home-repo.dart';
import 'package:my_shopping_app/features/home/presentation/Tabs/Setting_Tab.dart';

import '../../../../../core/api/api-manager.dart';
import '../../../../../core/errors/failures.dart';
import '../../../data/data_sources/remote/home-remote-ds-impl.dart';
import '../../../data/models/FavResponse.dart';
import '../../../domain/use_cases/Add_to_cart.dart';
import '../../../domain/use_cases/Add_to_fav.dart';
import '../../../domain/use_cases/Get-Category-UseCase.dart';
import '../../../domain/use_cases/Get_Products_UseCase.dart';
import '../../../domain/use_cases/get-brands-usecase.dart';
import '../../../domain/use_cases/get_fav_use_case.dart';
import '../../../domain/use_cases/remove_from_fav.dart';
import '../../Tabs/Fav_Tab.dart';
import '../../Tabs/HomeTab.dart';
import '../../Tabs/Product_tab.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeStates> {


  HomeCubit() : super(HomeInitial()) {

  }

  static HomeCubit get(context) => BlocProvider.of(context);

  int bottomNavIndex = 0;
  bool fav = false;
  int numOfItemsInCart=0 ;
  List<Widget> tabs = const [HomeTab(), ProductsTab(), FavTab(), SettingTab()];
  List<Data> categories = [];
  List<Data> brands = [];
  List<ProductData> products = [];


  void changeBottomNav(int index) {
    emit(HomeInitial());
    bottomNavIndex = index;
    emit(ChangeBottomNavBar());
  }

int getNumOfCart(){
 AddToCartModel addToCartModel=AddToCartModel();
 numOfItemsInCart=addToCartModel.numOfCartItems??0;
 print(numOfItemsInCart);
 emit(GetNumOfCartItems());
 return numOfItemsInCart;
}


  void addTCart(String productId) async {
    emit(AddToCartLoadingState());
    ApiManager apiManager = ApiManager();
    HomeRemoteDs remoteDs = HomeRemoteDsImpl(apiManager);
    HomeRepo homeRepo = HomeRepoImpl(remoteDs);
    AddToCartUseCase addCartUseCase = AddToCartUseCase(homeRepo);
    var result = await addCartUseCase.call(productId);
    result.fold((l) {
      emit(AddToCartErrorState(l));

    }, (r) {
      print("********************");
      print("numberofcart:$numOfItemsInCart");
      numOfItemsInCart = r.numOfCartItems ?? 0;
      emit(AddToCartSuccessState(r));
    });
  }

  void addToFav(String productId) async {
    emit(AddToFavLoadingState());
    ApiManager apiManager = ApiManager();
    HomeRemoteDs remoteDs = HomeRemoteDsImpl(apiManager);
    HomeRepo homeRepo = HomeRepoImpl(remoteDs);
    AddToFavUseCase addToFavUseCase = AddToFavUseCase(homeRepo);
    var result = await addToFavUseCase.call(productId);
    result.fold((l) {
      emit(AddToFavErrorState(l));

    }, (r) {
      print("********************");
      emit(AddToFavSuccessState(r));
    });
  }

  void removeFromFav(String productId) async {
    emit(RemoveFromFavLoadingState());
    ApiManager apiManager = ApiManager();
    HomeRemoteDs remoteDs = HomeRemoteDsImpl(apiManager);
    HomeRepo homeRepo = HomeRepoImpl(remoteDs);
    RemoveFromFavUseCase removeFromFavUseCase = RemoveFromFavUseCase(homeRepo);
    var result = await removeFromFavUseCase.call(productId);
    result.fold((l) {
      emit(RemoveFromFavErrorState(l));

    }, (r) {
      print("********************");
      emit(RemoveFromFavSuccessState(r));
    });
  }


  void getFav() async {
    emit(GetFavLoadingStates("Loading...."));
    ApiManager apiManager = ApiManager();
    HomeRemoteDs remoteDs = HomeRemoteDsImpl(apiManager);
    HomeRepo homeRepo = HomeRepoImpl(remoteDs);
    GetFavUseCase getFavUseCase = GetFavUseCase(homeRepo);
    var result = await getFavUseCase.call();
    result.fold((l) {
      print(l.errormsg);
      emit(GetFavErrorStates(l));
    }, (r) {
      emit(GetFavSuccessStates(r));
    });
  }

  getProducts() async {
    emit(HomeLoadingState());
    ApiManager apiManager = ApiManager();
    HomeRemoteDs remoteDs = HomeRemoteDsImpl(apiManager);
    HomeRepo homeRepo = HomeRepoImpl(remoteDs);
    GetProductsUseCase productsUseCase = GetProductsUseCase(homeRepo);
    var result = await productsUseCase.call();
    result.fold((l) {
      emit(HomeGetProductsErrorState(l));
    }, (r) {
      products = r.data ?? [];
      emit(HomeGetProductsSuccessState(r));
    });
  }

  getBrands() async {
    emit(HomeLoadingState());
    ApiManager apiManager = ApiManager();
    HomeRemoteDs remoteDs = HomeRemoteDsImpl(apiManager);
    HomeRepo homeRepo = HomeRepoImpl(remoteDs);
    GetBrandUseCase getBrandsUseCase = GetBrandUseCase(homeRepo);
    var result = await getBrandsUseCase.call();
    result.fold((l) {
      emit(HomeGetBrandsErrorState(l));
    }, (r) {
      brands = r.data ?? [];
      emit(HomeGetBrandsSuccessState(r));
    });
  }

  getCategories() async {
    emit(HomeLoadingState());
    ApiManager apiManager = ApiManager();
    HomeRemoteDs remoteDs = HomeRemoteDsImpl(apiManager);
    HomeRepo homeRepo = HomeRepoImpl(remoteDs);
    GetCategoryUseCase getCategoriesUseCase =
    GetCategoryUseCase(homeRepo);
    var result = await getCategoriesUseCase.call();
    result.fold((l) {
      emit(HomeGetCategoriesErrorState(l));
    }, (r) {
      categories = r.data ?? [];
      emit(HomeGetCategoriesSuccessState(r));
    });
  }


}

