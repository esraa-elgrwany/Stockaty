import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:my_shopping_app/features/home/presentation/widgets/category_item.dart';
import 'package:my_shopping_app/features/home/presentation/widgets/slide.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../config/routes/routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../data/models/CategoryAndBrandModel.dart';
import '../../data/models/ProductsModel.dart';
import '../manager/home_bloc.dart';
import '../widgets/Product_item.dart';

class HomeTab extends StatelessWidget{
  List<Data> categories;
  List<Data> brands;
  List<ProductData> items;
  HomeTab(this.categories,this.brands,this.items);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: HomeBloc.get(context).searchController,
                          decoration: InputDecoration(
                            hintText: "Search",
                            hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                                color: Theme.of(context).colorScheme.onSecondary),
                            prefixIcon: Icon(Icons.search_sharp,color: Theme.of(context).colorScheme.
                            primary),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 2.w,
                                  color:primaryColor,
                                ),
                                borderRadius: BorderRadius.circular(24.r)
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2.w,
                                color:primaryColor,
                              ),
                              borderRadius: BorderRadius.circular(24.r),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context,RoutesName.cart);
                          },
                          icon:  ImageIcon(
                           AssetImage("assets/images/cart.png"),
                              size: 40,
                     color:primaryColor,
                          ),),
                    ],
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Center(
                    child: ImageSlideshow(
                        indicatorColor: primaryColor,
                        indicatorBackgroundColor: Colors.white,
                        height: 200.h,
                        width: 398.w,
                        autoPlayInterval: 30000,

                        indicatorRadius: 4,
                        isLoop:true,
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadiusDirectional.circular(24),
                              child: Image.asset("assets/images/slide1.png",fit: BoxFit.cover,)),
                          ClipRRect(
                              borderRadius: BorderRadiusDirectional.circular(24),
                              child: Image.asset("assets/images/slide1.png",fit: BoxFit.cover,)),
                          ClipRRect(
                              borderRadius: BorderRadiusDirectional.circular(24),
                              child: Image.asset("assets/images/slide1.png",fit: BoxFit.cover,))
                        ]
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
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.primary
                        )
                      ),
                      Text(
                        'view all',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context).colorScheme.primary
                        )),
      ]
                      ),


              SizedBox(
              height: 10.h,
              ),
                  Container(
                    height: 200.h,
                    child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 4,
                        crossAxisSpacing: 4,
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
                  SizedBox(
                    height: 8.h,
                  ),
    Text("Products",style: Theme.of(context).textTheme.bodyMedium!.copyWith(
        color: Colors.black87
    )),
                  SizedBox(
                    height: 4.h,
                  ),
   /* Column(
    children: [
    Container(
    height: MediaQuery.of(context).size.height-280.h,
    child: GridView.builder(
    physics: const BouncingScrollPhysics(),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    mainAxisSpacing: 20,
    crossAxisSpacing: 20,
    mainAxisExtent: MediaQuery.of(context).size.height - 652.h,
    crossAxisCount: 2,
    ),
    itemCount: items.length,
    padding: EdgeInsets.symmetric(
    horizontal: 16.0.w,
    vertical: 24.0.h,
    ),
    itemBuilder: (context, index) {
    return ProductListItem(items[index]);
    },
    ),
    ),
    ],
      ),*/
    ]
    ),
    )
    );
  }
}
