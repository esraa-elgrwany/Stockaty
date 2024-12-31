import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_shopping_app/features/home/presentation/manager/Home-manager/fav_cubit.dart';
import 'package:my_shopping_app/features/home/presentation/manager/Home-manager/home_cubit.dart';
import '../../../../core/utils/app_colors.dart';
import '../widgets/fav_item.dart';

class FavTab extends StatefulWidget{
  const FavTab({super.key});

  @override
  State<FavTab> createState() => _FavTabState();
}

class _FavTabState extends State<FavTab> {
  @override
  void initState() {
    FavCubit.get(context).getFav();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

   return BlocConsumer<FavCubit, FavState>(
        listener: (context, state) {
        },
    builder: (context, state) {
    return
    FavCubit.get(context).favs.isEmpty
    ? Center(
      child: Text("No Fav items",style:TextStyle(
          color:secondPrimary,
          fontSize: 22,
      )),
    )
    :
    Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return FavItem(
                    FavCubit.get(context).favs[index]
                );
              },
              itemCount: FavCubit.get(context).favs.length
            ),
          );
        }
    );
}
}

