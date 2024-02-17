import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageSlide extends StatelessWidget{
  String img;
  int index;
  bool word;
   ImageSlide(this.img,this.index,this.word);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(img),
        word ? Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("""UP TO
25% OFF""", style: GoogleFonts.poppins(
                  color:Color(0XFF004182),
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w700)),
              Text("""For all Headphones 
& AirPods""", style: GoogleFonts.poppins(
                color:Color(0XFF004182),
                fontSize: 14.sp,
              )),
              SizedBox(
                height: 8.h,
              ),
              ElevatedButton(
                  onPressed: () {
                  },
                  style: ButtonStyle(
                      padding: MaterialStatePropertyAll(EdgeInsets.symmetric(
                          vertical: 12,horizontal: 18
                      )),
                      backgroundColor:
                      MaterialStatePropertyAll(Color(0XFF004182)),
                      shape:
                      MaterialStatePropertyAll(RoundedRectangleBorder(
                        side: BorderSide(
                            color: Colors.transparent
                        ),
                        borderRadius:
                        BorderRadiusDirectional.circular(14),
                      ))),
                  child: Text(
                    "Shop Now",
                    style: GoogleFonts.poppins(
                        color:Colors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500),
                  )),

            ],
          ),
        )
        : SizedBox(height: 1.h,),
       word ? Positioned(
          bottom: 10.h,
          left: 150.h,
          child: AnimatedSmoothIndicator(
              duration: const Duration(milliseconds: 400),
              activeIndex: index,
              count: 3,
              effect: const SwapEffect()),
        )
           : SizedBox(height: 1.h,)
      ],
    );
  }
}
