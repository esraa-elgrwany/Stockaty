import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:my_shopping_app/features/home/presentation/widgets/category_item.dart';
import 'package:my_shopping_app/features/home/presentation/widgets/slide.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../data/models/CategoryAndBrandModel.dart';

class HomeTab extends StatelessWidget{
  List<Data> categories;

  HomeTab(this.categories);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
        ClipRRect(
          child: CarouselSlider(
            items: [
           ImageSlide("assets/images/unsplash_PDX_a_82obo.png", 0,true),
              ImageSlide("assets/images/slide2.png", 1,false),
              ImageSlide("assets/images/slide3.png", 2,false),
            ],
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 2,
              viewportFraction: 1,
              enableInfiniteScroll: true,
            ),
          ),
        ),
          SizedBox(
            height: 24.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Categories',
                style: GoogleFonts.poppins(
                    fontSize: 22.sp, fontWeight: FontWeight.w500),
              ),
              Text(
                'view all',
                style: GoogleFonts.poppins(
                    fontSize: 16.sp),
              ),
            ],
          ),
      SizedBox(
      height: 10.h,
      ),
          Container(
            height: 160.h,
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 16,
                crossAxisCount: 2,
                childAspectRatio: 1,
              ),
              itemCount: categories.length,
              itemBuilder: (BuildContext context, int index) {
                return  CategoryItem(img:
                 categories[index].image,
                  description: categories[index].name,
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'brands',
                style: GoogleFonts.poppins(
                    fontSize: 22.sp, fontWeight: FontWeight.w500),
              ),
              Text(
                'view all',
                style: GoogleFonts.poppins(
                    fontSize: 16.sp),
              ),
            ],
          ),
          SizedBox(
            height:10.h,
          ),
          Container(
            height: 160.h,
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 16,
                crossAxisCount: 2,
                childAspectRatio: 1,
              ),
              itemCount: categories.length,
              itemBuilder: (BuildContext context, int index) {
                return  CategoryItem(img:
                categories[index].image,
                  description: categories[index].name,
                );
              },
            ),
          ),

        ],
      ),
    );
  }
}
