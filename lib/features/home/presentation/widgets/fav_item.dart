import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_shopping_app/features/home/presentation/manager/Home-manager/home_cubit.dart';

import '../../../../core/utils/app_colors.dart';
import '../../data/models/FavResponse.dart';


class FavItem extends StatelessWidget {
  FavData product;

  FavItem(this.product,{super.key});

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
                  image: NetworkImage(product.imageCover??""),
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
                          product.title?.substring(0,11) ?? "",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Colors.black
                          )
                      ),
                      IconButton(
                        onPressed: () {
                          HomeCubit.get(context)
                              .removeFromFav(product.id ?? "");
                        },
                        icon:  ImageIcon(
                          AssetImage("assets/images/loved.png"),
                          color: primaryColor,
                          size: 30,
                        ),
                      )

                    ],
                  ),
                  Row(
                    children: [
                      Text("Brand : ${product.brand?.name ?? ""}",
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
                        Text("Review (${product.ratingsAverage})",
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