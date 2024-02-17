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
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            color: CustomColors.borderColor,
            width: 2.0.w,
          ),
        ),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                  child: Image.network(
                    item.images?[0] ?? "",
                    fit: BoxFit.cover,
                    width: 191.0.w,
                    height: 126.0.h,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        item.title ?? "",
                        style: GoogleFonts.poppins(
                          fontSize: 14.0.sp,
                          color: CustomColors.textColor,
                        ),
                      ),
                      SizedBox(
                        height: 8.0.h,
                      ),
                      Row(
                        children: [
                          Text(
                           "${item.price}",
                            style: GoogleFonts.poppins(
                              fontSize: 14.0.sp,
                              color: CustomColors.textColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            width: 16.0.w,
                          ),
                          Text(
                            "${item.price}",
                            style: GoogleFonts.poppins(
                              fontSize: 11.0.sp,
                              color: CustomColors.oldPriceColor,
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8.0.h,
                      ),
                      Row(
                        children: [
                          Text(
                            'Review (${item?.ratingsAverage})',
                            style: GoogleFonts.poppins(
                              fontSize: 12.0.sp,
                              color: CustomColors.textColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            width: 4.0.w,
                          ),
                          Image.asset(
                            'assets/images/star.png',
                          ),
                          const Spacer(),
                          InkWell(
                            child: Image.asset(
                              'assets/images/icon _plus circle_.png',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
    InkWell(
    onTap: () {},
    child: Container(
    child: Center(
    child: Icon(Icons.favorite_outline,
    color: Color(0xFF06004F))),
    height: 35,
    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(20)),
    width: 35),
    ),

          ],
        ),
      ),
    );
  }
}

class CustomColors {
  static Color textColor = const Color(0xFF06004F);
  static Color oldPriceColor = const Color(0xFF004182).withOpacity(0.6);
  static Color borderColor = const Color(0xFF004182).withOpacity(0.3);
}