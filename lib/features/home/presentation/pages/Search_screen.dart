import 'package:flutter/material.dart';
import 'package:my_shopping_app/features/home/presentation/manager/Home-manager/home_cubit.dart';
import 'package:my_shopping_app/features/home/presentation/widgets/Product_item.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ProductListItem(HomeCubit.get(context).products[index]);
      },
      itemCount: HomeCubit.get(context).products.length,
    );
  }
}
