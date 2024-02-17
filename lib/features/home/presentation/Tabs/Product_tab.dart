import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_shopping_app/features/home/data/models/ProductsModel.dart';
import 'package:my_shopping_app/features/home/presentation/widgets/Product_item.dart';

import '../../data/models/CategoryAndBrandModel.dart';

class ProductsTab extends StatelessWidget {
  List<ProductData> items;

  ProductsTab(this.items);

  @override
  Widget build(BuildContext context) {
    print(items.length);
    return Container(
      height:600.h,
        child: GridView.builder(
                            physics: const BouncingScrollPhysics(),
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: 16,
                              crossAxisSpacing: 16.0,
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
    );
  }
}
