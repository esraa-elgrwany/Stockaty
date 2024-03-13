import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_shopping_app/features/home/data/models/AddToCartModel.dart';

import '../../../../core/api/api-manager.dart';
import '../../../../core/errors/failures.dart';
import '../../data/data_sources/remote/home-remote-ds-impl.dart';
import '../../data/data_sources/remote/home-remote-ds.dart';
import '../../data/repositories/home-repo-impl.dart';
import '../../domain/repositories/Home-repo.dart';
import '../../domain/use_cases/Add_to_cart.dart';


part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {

  int numOfCartItems=0;
  CartCubit() : super(CartInitial());

  static CartCubit get(context) => BlocProvider.of(context);
/*
  void addToCart(String productId) async{
    emit(CartLoadingStates());
    ApiManager apiManager = ApiManager();
    HomeRemoteDs remoteDs = HomeRemoteDsImpl(apiManager);
    HomeRepo homeRepo = HomeRepoImpl(remoteDs);
    AddToCartUseCase addToCartUseCase = AddToCartUseCase(homeRepo);
    var res = await addToCartUseCase(productId);
    res.fold((l) {
      emit(AddToCartErrorStates(ServerFailure(l.errormsg)));
    }, (r) {
      numOfCartItems=r.numOfCartItems??0;
      emit(AddToCartSuccessStates(r));
    });
  }*/

  /*void update(String id, int count) async {
    CartDomainRepo cartDomainRepo = CartDataRepo(cartDto);
    CartUseCase cartUseCase = CartUseCase(cartDomainRepo);
    var result = await cartUseCase.update(id, count);
    result.fold((l) {
      emit(CartDeleteItemErrorStates(l));
    }, (r) {
      emit(CartSuccessStates(r));
    });
  }

  void deleteItem(String id) async {
    CartDomainRepo cartDomainRepo = CartDataRepo(cartDto);
    CartUseCase cartUseCase = CartUseCase(cartDomainRepo);
    var result = await cartUseCase.delete(id);
    result.fold((l) {
      emit(CartDeleteItemErrorStates(l));
    }, (r) {
      emit(CartSuccessStates(r));
    });
  }*/

 /* void getCart() async {
    CartDomainRepo cartDomainRepo = CartDataRepo(cartDto);
    CartUseCase cartUseCase = CartUseCase(cartDomainRepo);
    var result = await cartUseCase.call();
    result.fold((l) {
      emit(CartErrorStates(l));
    }, (r) {
      emit(CartSuccessStates(r));
    });
  }*/
}
