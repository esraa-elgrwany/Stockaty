import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryItem extends StatelessWidget {
  String? img;
  String? description;

  CategoryItem({required this.img, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
    ClipRRect(
      borderRadius: BorderRadiusDirectional.circular(30),
      child: CachedNetworkImage(
      imageUrl: img ?? "",
        errorWidget: (context, url, error) => Icon(Icons.error),
        width: 60,
        height: 60.h,
        fit: BoxFit.fill,
      ),
    ),
        SizedBox(
          height: 4.h,
        ),
        SizedBox(
          width: 65.w,
          child: Text(
            description ?? "",
            style: GoogleFonts.poppins(
                color: const Color(0xff06004F),
                fontSize: 14,
                fontWeight: FontWeight.w400),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}
