import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_shopping_app/config/routes/routes.dart';
import 'package:my_shopping_app/features/home/data/models/ProductsModel.dart';

import '../../../ProductDetails/presentation/pages/product_details.dart';


class ProductListItem extends StatelessWidget {
  ProductData item;

  ProductListItem(this.item);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context,RoutesName.productDetails,arguments: item);
      },
      child: Container(
      height: 237.h,
      width: 191.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(
              color: const Color(0xff004182).withOpacity(.3), width: 2.w)),
      child: Stack(
        children: [
          Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.r),
                    topRight: Radius.circular(15.r)),
                child: Image.network(
                  item.imageCover ?? "",
                  height: 128.h,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      item.title ?? "",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                          color: const Color(0xff06004F)),
                    ),
                    Text(
                      item.description ?? "",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                          color: const Color(0xff06004F)),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      children: [
                        Text(
                          item.price.toString(),
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp,
                              color: const Color(0xff06004F)),
                        ),
                        SizedBox(
                          width: 16.w,
                        ),
                        Text(
                          (item.price ?? 50 - 50).toString(),
                          style: GoogleFonts.poppins(
                              decoration: TextDecoration.lineThrough,
                              decorationColor:
                              const Color(0xff004182).withOpacity(.6)
                              // Replace with your desired color
                              ,
                              fontWeight: FontWeight.w400,
                              fontSize: 11.sp,
                              color: const Color(0xff004182).withOpacity(.6)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      children: [
                        Text(
                          'Review (${item.ratingsAverage})',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 12.sp,
                              color: const Color(0xff06004F)),
                        ),
                        Icon(
                          Icons.star,
                          color: const Color(0xffFDD835),
                          size: 15.h,
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 8.w),
            child: Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: () {
                  // fav = !fav;
                  // setState(() {});
                },
                child: CircleAvatar(
                  radius: 15.r,
                  backgroundColor: Colors.white,
                  child: Center(
                    child: Icon(Icons.favorite_border),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 8.w),
            child: Align(
              alignment: Alignment.bottomRight,
              child: InkWell(
                onTap: () {
                },
                child: CircleAvatar(
                  radius: 15.r,
                  backgroundColor: const Color(0xff004182),
                  child: const Center(
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
        ),
    );
  }
}