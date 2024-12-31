import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_shopping_app/features/home/presentation/manager/Home-manager/home_cubit.dart';
import 'package:my_shopping_app/features/home/presentation/pages/Search_screen.dart';
import 'package:my_shopping_app/features/home/presentation/widgets/Product_item.dart';
import '../../../../config/routes/routes.dart';
import '../../../../core/utils/app_colors.dart';

class ProductsTab extends StatelessWidget {
  const ProductsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return HomeCubit.get(context).products.isEmpty
            ? Center(child: const CircularProgressIndicator())
            : Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 12,right: 12),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                 controller: HomeCubit.get(context).searchController,
                                decoration: InputDecoration(
                                  fillColor: Color(0xFFDEE2E7).withOpacity(.3),
                                  filled: true,
                                  hintText: "Search",
                                  hintStyle:TextStyle(
                                      fontSize: 16,
                                      color: greyColor
                                  ),
                                  prefixIcon: IconButton(
                                    onPressed: () {
                                      HomeCubit.get(context).
                                      getProducts(search:HomeCubit.get(context).searchController.text);
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
                      SizedBox(
                        height: 4.h,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height - 280.h,
                        child: GridView.builder(
                          physics: const BouncingScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 20,
                            crossAxisCount: 2,
                                childAspectRatio: .68
                          ),
                          itemCount: HomeCubit.get(context).products.length,
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.0.w,
                            vertical: 24.0.h,
                          ),
                          itemBuilder: (context, index) {
                            return ProductListItem(
                                HomeCubit.get(context).products[index]);
                          },
                        ),
                      )
                    ],
                  ),
                ),
              );
      },
    );
  }
}
