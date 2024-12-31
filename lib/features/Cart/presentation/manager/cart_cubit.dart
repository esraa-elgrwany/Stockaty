import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_shopping_app/features/Cart/data/data_sources/dto.dart';

import '../../../../core/errors/failures.dart';
import '../../data/models/CartResponse.dart';
import '../../data/repositories/cart_data_repo.dart';
import '../../domain/repositories/cart_domain_repo.dart';
import '../../domain/use_cases/get_cart_useCase.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartStates> {
  CartRemoteDs cartDto;

  CartCubit(this.cartDto) : super(CartInitial());

  static CartCubit get(context) => BlocProvider.of(context);

  void getCart() async {
    emit(CartLoadingStates("Loading...."));
    CartDomainRepo cartDomainRepo = CartDataRepo(cartDto);
    CartUseCase cartUseCase = CartUseCase(cartDomainRepo);
    var result = await cartUseCase.call();
    result.fold((l) {
      print(l.errormsg);
      emit(CartErrorStates(l));
    }, (r) {
      emit(CartSuccessStates(r));
    });
  }

  void update(String id, int count) async {
    CartDomainRepo cartDomainRepo = CartDataRepo(cartDto);
    CartUseCase cartUseCase = CartUseCase(cartDomainRepo);
    var result = await cartUseCase.update(id, count);
    result.fold((l) {
      print(l.errormsg);
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
  }




}
