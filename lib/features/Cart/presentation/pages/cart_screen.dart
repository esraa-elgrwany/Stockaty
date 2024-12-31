import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_shopping_app/core/utils/app_colors.dart';
import 'package:my_shopping_app/features/Cart/data/data_sources/cart_remote_ds_impl.dart';
import 'package:my_shopping_app/features/Cart/presentation/manager/cart_cubit.dart';
import '../widgets/cart_Item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(CartRemoteDsImpl())..getCart(),
      child: BlocConsumer<CartCubit, CartStates>(
        listener: (context, state) {},
        builder:
            (context, state) {
          if (state is CartSuccessStates) {
            return Scaffold(
              appBar: AppBar(
                toolbarHeight: 80.h,
                backgroundColor: Colors.transparent,
                elevation: 0,
                centerTitle: true,
                leading: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                    child: CircleAvatar(backgroundColor:Colors.grey.withOpacity(.1),

                        child: Icon(Icons.arrow_back,color: Color(0XFF8CB7F5),)),
                  ),
                ),
                title: Text("Shopping Cart",
                    style: TextStyle(
                        fontSize: 18,
                        color: secondPrimary,
                        fontWeight: FontWeight.w600
                    ),
                ),
              ),
              bottomNavigationBar: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 130.h,
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color:  Color(0xFFE0E0E0),
                      ),
                    )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text("Total Price :",style:
                            TextStyle(
                              fontSize: 18,
                              color:ThirdPrimary,
                              fontWeight: FontWeight.w600
                            ),),
                            Spacer(),
                            Text("${state.cartResponse.data?.totalCartPrice} EGP",
                                style:TextStyle(
                                    fontSize: 18,
                                    color:ThirdPrimary,
                                    fontWeight: FontWeight.w600
                                ),)
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          24
                                        )
                                      ),
                                      backgroundColor:greenColor),
                                  onPressed: () {

                                  },
                                  child: Text(" Check Out ",style:TextStyle(
                                      fontSize: 18,
                                      color:Colors.white,
                                  ),)
                                    ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.all(4),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return CartItem(
                              state.cartResponse.data!.products![index]
                              );
                        },
                        itemCount: state.cartResponse.numOfCartItems,
                      ),
                    )
                  ],
                ),
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator(color: primaryColor,));
          }
        },
      ),
    );
  }
}