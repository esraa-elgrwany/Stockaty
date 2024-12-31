import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_shopping_app/features/home/presentation/manager/Home-manager/fav_cubit.dart';
import 'package:my_shopping_app/features/home/presentation/manager/Home-manager/home_cubit.dart';

import '../../../../core/utils/app_colors.dart';
import '../../data/models/FavResponse.dart';


class FavItem extends StatelessWidget {
  FavData product;

  FavItem(this.product,{super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      //clipBehavior: Clip.antiAlias,
      padding: EdgeInsets.all(8),
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
            ClipRRect(
              borderRadius: BorderRadiusDirectional.circular(16),
              child: CachedNetworkImage(
                imageUrl: product.imageCover ?? "",
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
                width: 120.w,
                height: 100.h,
                fit: BoxFit.fill,
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
                          style:  TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            fontWeight: FontWeight.bold
                          )
                      ),
                      IconButton(
                       // padding: EdgeInsets.zero,
                        onPressed: () {
                          FavCubit.get(context)
                              .removeFromFav(product.id ?? "");
                          print("Removing product with ID: ${product.id}");
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
                          style:  TextStyle(
                              color: secondPrimary,
                              fontSize: 14
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Row(
                      children: [
                        Text("Review (${product.ratingsAverage})",
                            style:
                           TextStyle(
                                color: secondPrimary,
                             fontSize: 14
                            )),
                        SizedBox(width:8),
                        Icon(Icons.star, color: Colors.amberAccent,size:20,),
                      ]),
                  SizedBox(
                    height: 8.h,
                  ),
                  Row(
                    children: [
                      Text(
                        "${product.price} EGP",
                        textAlign: TextAlign.center,
                        style:
                        TextStyle(
                            color: Colors.black,
                            fontSize: 14,
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