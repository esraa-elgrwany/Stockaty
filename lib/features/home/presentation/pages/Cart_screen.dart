
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_shopping_app/core/utils/app_colors.dart';

import '../manager/cart_cubit.dart';
import '../widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
    /* BlocProvider(
      create: (context) => CartCubit(RemoteCartDto())..getCart(),
      child: BlocConsumer<CartCubit, CartState>(
        listener: (context, state) {},
        builder: (context, state) {
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

                        child: Icon(Icons.arrow_back,color:Theme.of(context).colorScheme.secondary)),
                  ),
                ),
                title: Text("Stock Cart",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!.copyWith(color: primaryColor,
                        fontWeight: FontWeight.w100)
                ),
              ),
              bottomNavigationBar: Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                  height: 70.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total Price",style: TextStyle(
                            color: Colors.grey
                          ),),
                          Text("${state.cartResponse.data?.totalCartPrice} EGP")
                        ],
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 8,horizontal:56),
                              backgroundColor: primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusDirectional.circular(30.r),
                            )
                          ),

                          onPressed: () {},
                          child: Text("Check Out",
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Colors.white
                            ),))
                    ],
                  ),
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return CartItem(
                              state.cartResponse.data!.products![index]);
                        },
                        itemCount: state.cartResponse.numOfCartItems,
                      ),
                    )
                  ],
                ),
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );*/
  }
}