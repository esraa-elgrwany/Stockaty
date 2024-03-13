import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_shopping_app/features/home/data/models/ProductsModel.dart';
import 'package:my_shopping_app/features/home/presentation/widgets/Product_item.dart';

import '../../../../config/routes/routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../data/models/CategoryAndBrandModel.dart';
import '../manager/home_bloc.dart';

class ProductsTab extends StatelessWidget {
  List<ProductData> items;

  ProductsTab(this.items);

  @override
  Widget build(BuildContext context) {
    return
          Expanded(
            child: SingleChildScrollView(
              child: Column(
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
                          icon: ImageIcon(
    AssetImage("assets/images/cart.png"),
    size: 40,
    color:primaryColor,
    ),),
                    ],
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
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
              ),
            ),
          );
  }
}
