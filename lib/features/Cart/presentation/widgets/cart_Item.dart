import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_shopping_app/core/utils/app_colors.dart';

import '../../data/models/CartResponse.dart';
import '../manager/cart_cubit.dart';


class CartItem extends StatelessWidget {
 Products product;

  CartItem(this.product,{super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390.w,
      height: 140.h,
      margin: EdgeInsets.all(8),
      //clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Color(0xFFE0E0E0)),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Row(
        children: [
          SizedBox(width: 15.w,),
          Container(
            width: 120.w,
            height: 100.h,
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              image: DecorationImage(
                image: NetworkImage(product.product!.imageCover ?? ""),
                fit: BoxFit.fill,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          SizedBox(
            width: 16.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      product.product?.title?.substring(0,11) ?? "",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.black
                      )
                    ),
                    IconButton(
                        onPressed: () {
                         CartCubit.get(context)
                              .deleteItem(product.product?.id ?? "");
                        },
                        icon:  ImageIcon(
                        AssetImage("assets/images/delete 1.png",),
                          color: primaryColor,
                          size: 30,
                        ),
                    )

                  ],
                ),
            Row(
              children: [
                Text("Brand : ${product.product?.brand?.name ?? ""}",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: secondPrimary
                    )),
              ],
            ),
            SizedBox(
              height: 6.h,
            ),
            Row(
              children: [
                Text("Review (${product.product?.ratingsAverage})",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: secondPrimary
                    )),
                SizedBox(width:8),
                Icon(Icons.star, color: Colors.amberAccent,size:20,),

              ]),
                Row(
                  children: [
                    Text(
                      "${product.price} EGP",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.black87
                      ),
                    ),
                    Spacer(
                    ),
                    Container(
                        padding: const EdgeInsets.all(4),
                        margin: EdgeInsets.only(right: 4,bottom: 1),
                        decoration: BoxDecoration(
                          color:Colors.white,
                          border:Border.all(
                          color: Color(0xFFDEE2E7)
                          ),
                          borderRadius: BorderRadius.circular(30.r),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(),
                                onPressed: () {
                                  int counter = product.count ?? 0;
                                  counter--;
                                  CartCubit.get(context).update(
                                      product.product?.id ?? "", counter);
                                },
                                icon: const Icon(
                                  Icons.remove_circle_outline,
                                  size: 20,
                                  color:Color(0xFF8B96A5),
                                )),
                            SizedBox(
                              width: 15.w,
                            ),
                            Text(
                              product.count.toString() ?? "0",
                              style:
                              TextStyle(fontSize: 18, color: Colors.black),
                            ),
                            SizedBox(
                              width: 15.w,
                            ),
                            IconButton(
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(),
                                onPressed: () {
                                  int counter = product.count ?? 0;
                                  counter++;
                                  CartCubit.get(context).update(
                                   product.product?.id ?? "", counter);
                                },
                                icon: const Icon(
                                  Icons.add_circle_outline,
                                  size: 20,
                                  color:Color(0xFF8B96A5),
                                ))
                          ],
                        )),
                  ],
                )
              ],
            ),
          )
        ]
      ),
    );
  }
}