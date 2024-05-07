import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';

class ProfileCell extends StatelessWidget{
  TextEditingController txt=TextEditingController();
   ProfileCell({super.key});

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Your Full Name",style:
        TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 18,
        )),
        SizedBox(height: 16.h,),
        TextFormField(
          controller:txt,
          decoration: InputDecoration(
            fillColor: Color(0xFFDEE2E7).withOpacity(.1),
            filled: true,
            hintText: "Full name",
            hintStyle: Theme.of(context)
                .textTheme
                .bodyMedium,
            suffixIcon:  Icon(Icons.edit,
                color: greyColor,
              ),

            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(

                  color: Color(0xFFDEE2E7),
                ),
                borderRadius: BorderRadius.circular(8.r)),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFFDEE2E7),
              ),
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
        ),
      ],
    );
  }
}
