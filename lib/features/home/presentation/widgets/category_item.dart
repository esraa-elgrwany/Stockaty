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
        Container(
          width: 60.w,
          height: 60.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                image: NetworkImage(
                  img ?? "",
                ),
                fit: BoxFit.fill),
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
                fontSize: 14.sp,
                fontWeight: FontWeight.w400),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}
