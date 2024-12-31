import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_shopping_app/features/home/presentation/manager/Home-manager/home_cubit.dart';
import 'package:my_shopping_app/features/home/presentation/pages/Search_screen.dart';
import 'package:my_shopping_app/features/home/presentation/widgets/category_item.dart';
import '../../../../core/utils/app_colors.dart';
import '../widgets/Product_item.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        if (state is HomeGetProductsErrorState) {
          showDialog(
            context: context,
            builder: (context) =>
                AlertDialog(
                  title: Text("Error"),
                  content: Text(state.failures.errormsg,style: TextStyle(
                      fontSize: 14,
                      color: ThirdPrimary
                  ),),
                ),
          );
        }
      },
      builder: (context, state) {
        return Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child:
              Column(crossAxisAlignment:
              CrossAxisAlignment.start, children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: HomeCubit
                              .get(context)
                              .searchController,
                          decoration: InputDecoration(
                            fillColor: Color(0xFFDEE2E7).withOpacity(.3),
                            filled: true,
                            hintText: "Search",
                            hintStyle: TextStyle(
                              fontSize: 16,
                              color: greyColor
                          ),
                            prefixIcon: IconButton(
                              onPressed: () {
                                HomeCubit.get(context).
                                getProducts(search: HomeCubit
                                    .get(context)
                                    .searchController
                                    .text);
                              },
                              icon: Icon(Icons.search_sharp,
                                color: greyColor,
                              ),
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
                      ),

                    ],
                  ),
                ),
                Column(
                  children: [
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
                          isLoop: true,
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadiusDirectional.circular(
                                    24),
                                child: Image.asset(
                                  "assets/images/banner.png",
                                  fit: BoxFit.cover,
                                )),
                            ClipRRect(
                                borderRadius: BorderRadiusDirectional.circular(
                                    24),
                                child: Image.asset(
                                  "assets/images/banner.png",
                                  fit: BoxFit.cover,
                                )),
                            ClipRRect(
                                borderRadius: BorderRadiusDirectional.circular(
                                    24),
                                child: Image.asset(
                                  "assets/images/banner.png",
                                  fit: BoxFit.cover,
                                ))
                          ]),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Categories',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: secondPrimary,
                                  fontWeight: FontWeight.w600
                              ),
                          ),
                          Text('view all',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: secondPrimary,
                                  fontWeight: FontWeight.w600
                              ),),
                        ]),
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
                        itemCount: HomeCubit
                            .get(context)
                            .categories
                            .length,
                        itemBuilder: (BuildContext context, int index) {
                          return CategoryItem(
                            img: HomeCubit
                                .get(context)
                                .categories[index].image ?? "",
                            description:
                            HomeCubit
                                .get(context)
                                .categories[index].name ?? "",
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      children: [
                        Text("Products",
                            style: TextStyle(
                                fontSize: 16,
                                color: secondPrimary,
                              fontWeight: FontWeight.w600
                            ),),
                      ],
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Container(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height - 280.h,
                      child: GridView.builder(
                        physics: const BouncingScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,
                         childAspectRatio: .68,
                          crossAxisCount: 2,
                        ),
                        itemCount: HomeCubit
                            .get(context)
                            .products
                            .length,
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.0.w,
                          vertical: 24.0.h,
                        ),
                        itemBuilder: (context, index) {
                          return ProductListItem(
                              HomeCubit
                                  .get(context)
                                  .products[index]);
                        },
                      ),
                    ),
                  ],
                )
              ]),
            )
        );
      },
    );
  }
}
