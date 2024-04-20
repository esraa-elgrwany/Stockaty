import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_shopping_app/config/routes/routes.dart';
import 'package:my_shopping_app/core/utils/app_colors.dart';
import 'package:my_shopping_app/features/home/data/models/ProductsModel.dart';
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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Container(
            height: 170.h,
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
        child: Image.network(
          widget.item.images?[0] ?? "",
          height: 138.h,
          fit: BoxFit.cover,
          width: double.infinity,
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
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(
                    color: Colors.black
                )
            ),
            Text(
                widget.item.description ?? "",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme
                    .of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(
                    color: ThirdPrimary)
            ),
            SizedBox(
              height: 6.h,
            ),
            Row(
              children: [
                Text('Review (${widget.item.ratingsAverage})',
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(
                        color: ThirdPrimary,
                        fontSize: 12.sp
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
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(
                        color: Colors.black87)),
                SizedBox(
                  width: 4.w,
                ),
                Text(
                  "${widget.item.price}",
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(
                      color: Colors.black87),
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    HomeCubit.get(context)
                        .addTCart(widget.item.id ?? "");
                  },
                  child: CircleAvatar(
                    radius: 14.r,
                    backgroundColor: greenColor,
                    child: const Center(
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
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
    HomeCubit.get(context).addToFav(widget.item.id ?? "");
    }else{
    favImage= "assets/images/heart.png";
    HomeCubit.get(context).removeFromFav(widget.item.id ?? "");
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
