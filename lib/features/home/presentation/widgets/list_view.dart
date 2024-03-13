import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_strings.dart';


class ListViewss extends StatelessWidget {
  const ListViewss({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: 12,
        itemBuilder: ((context, index) {
          return Container(
            width: 398.w,
            height: 113.h,
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color:primaryColor),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 120.w,
                  height: 113.h,
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    image: const DecorationImage(
                      image: AssetImage(""),
                      fit: BoxFit.fill,
                    ),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color:primaryColor),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
               SizedBox(width: 8.w,),
                Column(
                  children: [
                    Text("category"),
                  SizedBox(height: 8.h,),
                    Text("category"),
                    SizedBox(height: 8.h,),
                    Text(
                      ' 1280',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(

                          color: Colors.black
                      ),
                    ),
                  ],
                ), SizedBox(height: 8.h,),
                SizedBox(width: 8.w,),
                Text(
                  '2000',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    decoration: TextDecoration.lineThrough,
                    color: Colors.black
                  ),
                ),
                SizedBox(width: 15.w,),
                Container(
                  width: 90,
                  height: 36,
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color:primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      AppStrings.add,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 10),
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
        separatorBuilder: (BuildContext context, int index) {
         return SizedBox(height: 24.h,);
        },
      ),
    );
  }
}