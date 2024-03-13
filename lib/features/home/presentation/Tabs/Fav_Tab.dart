import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../manager/fav_cubit.dart';
import '../widgets/list_view.dart';

class FavTab extends StatelessWidget{
  const FavTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => FavoriteTabCubit(),
      child: BlocConsumer<FavoriteTabCubit, FavoriteTabState>(
        listener: (context, state) {},
        builder: (BuildContext context, state) {
          final bloc = FavoriteTabCubit.get(context);
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 18.h,),
                  const ListViewss(),
                ],
              ),
            ),
          );
        },
      ),
    );

  }
}
