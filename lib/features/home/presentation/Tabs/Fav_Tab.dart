import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_shopping_app/features/home/presentation/manager/Home-manager/home_cubit.dart';
import '../../../../core/utils/app_colors.dart';
import '../widgets/fav_item.dart';

class FavTab extends StatelessWidget {
  const FavTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getFav(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {
        },
        builder: (context, state) {
          if (state is GetFavSuccessStates) {
            return Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return FavItem(
                      state.favResponse.data![index]
                  );
                },
                itemCount: state.favResponse.count,
              ),
            );
          }
          else {
            return Center(child: CircularProgressIndicator(color: primaryColor,));
          }
        },
      ),
    );
  }
}
