import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_shopping_app/config/routes/routes.dart';
import 'package:my_shopping_app/core/utils/app_colors.dart';
import 'package:my_shopping_app/features/home/data/models/ProductsModel.dart';
import 'package:my_shopping_app/features/home/presentation/manager/Home-manager/fav_cubit.dart';
import '../manager/Home-manager/home_cubit.dart';

class ProductListItem extends StatefulWidget {
  ProductData item;

  ProductListItem(this.item);

  @override
  State<ProductListItem> createState() => _ProductListItemState();
}

class _ProductListItemState extends State<ProductListItem> {
  bool fav = false;
  String favImage = "assets/images/heart.png";

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, RoutesName.productDetails,
            arguments: widget.item);
      },
      child: Card(
        elevation: 8,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Container(
            height: 140.h,
            width: 191.w,
            alignment: Alignment.center,
            child: Stack(
                alignment: AlignmentDirectional.topEnd,
                children: [
            Column(
            children: [
            ClipRRect(
            borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.r),
            topRight: Radius.circular(15.r)),
        child: CachedNetworkImage(
          imageUrl:widget.item.imageCover??"" ,
          errorWidget: (context, url, error) => Icon(Icons.error),
          height: 138.h,
          width: double.infinity,
          fit: BoxFit.cover
        ),
      ),
      Padding(
        padding:
        EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
                widget.item.title ?? "",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold
                )
            ),
            Text(
                widget.item.description ?? "",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: ThirdPrimary,
                    fontSize: 12,
                    fontWeight: FontWeight.w500
                )
            ),
            SizedBox(
              height: 6.h,
            ),
            Row(
              children: [
                Text('Review (${widget.item.ratingsAverage})',
                    style: TextStyle
                       (
                        color: ThirdPrimary,
                        fontSize: 12
                    )),
                SizedBox(
                  width: 4.w,
                ),
                Icon(
                  Icons.star,
                  color: const Color(0xffFDD835),
                  size: 25.h,
                ),
              ],
            ),
            SizedBox(
              height: 6.h,
            ),
            Row(
              children: [
                Text("EGP",
                    style: TextStyle(
                        color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w500
                    )),
                SizedBox(
                  width: 4.w,
                ),
                Text(
                  "${widget.item.price}",
                  style:  TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w500
                  )
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    HomeCubit.get(context)
                        .addTCart(widget.item.id ?? "");
                  },
                  child: CircleAvatar(
                    radius: 12.r,
                    backgroundColor: greenColor,
                    child: const Center(
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      ],
    ),
    Padding(
    padding: const EdgeInsets.all(6.0),
    child: InkWell(
    onTap: () {
    fav=!fav;
    setState(() {
    });
    if(fav==true){
    favImage="assets/images/loved.png";
    FavCubit.get(context).addToFav(widget.item.id ?? "");
    }else{
    favImage= "assets/images/heart.png";
    FavCubit.get(context).removeFromFav(widget.item.id ?? "");
    }
    },
    child:CircleAvatar(
    radius: 15.r,
    backgroundColor: Colors.white,
    child: Center(
    child: ImageIcon(
    AssetImage(favImage),
    color: primaryColor,
    ),
    ) ),
    )
    ),
    ],
    ),
    ),
    )
    ,
    );
  }
}
