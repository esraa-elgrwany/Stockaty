import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_shopping_app/features/home/presentation/Tabs/Fav_Tab.dart';
import 'package:my_shopping_app/features/home/presentation/Tabs/HomeTab.dart';
import 'package:my_shopping_app/features/home/presentation/Tabs/Product_tab.dart';
import 'package:my_shopping_app/features/home/presentation/Tabs/Setting_Tab.dart';
import 'package:my_shopping_app/features/home/presentation/manager/home_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../../data/models/AddToCartModel.dart';
import '../../data/models/CategoryAndBrandModel.dart';
import '../../data/models/ProductsModel.dart';
import '../widgets/Active_tab.dart';
import '../widgets/not_active_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()
        ..add(GetCategoriesEvent())..add(GetBrandsEvent())
    ..add(GetProductsEvent()),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
      if (state.type == ScreenType.productError) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Error"),
            content: Text(state.failures?.errormsg?? ""),
          ),
        );
      }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Stock Cart",style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color:primaryColor),
              ),
              backgroundColor: Colors.white.withOpacity(0.2),
              elevation: 0,
            ),
            bottomNavigationBar:
             ClipRRect(
          borderRadius: BorderRadius.only(
          topRight: Radius.circular(24.r),
          topLeft: Radius.circular(24.r),
          ),
               child: BottomNavigationBar(
                      currentIndex: state.index,
                      onTap: (value) {
                        BlocProvider.of<HomeBloc>(context)
                            .add(ChangeBottomNavBar(value));
                      },
                      showSelectedLabels: false,
                      items: [
                        BottomNavigationBarItem(
                          icon: NotActiveTab(icon: "assets/images/home.png"),
                          label: "",
                          activeIcon: ActiveTab(icon:"assets/images/home.png"),
                        ),
                        BottomNavigationBarItem(
                          icon: NotActiveTab(icon:"assets/images/cat.png"),
                          label: '',
                          activeIcon: ActiveTab(icon:"assets/images/cat.png"),
                        ),
                        BottomNavigationBarItem(
                          icon: NotActiveTab(icon:"assets/images/heart.png"),
                          label: '',
                          activeIcon: ActiveTab(icon:"assets/images/heart.png"),
                        ),
                        BottomNavigationBarItem(
                          icon: NotActiveTab(icon:"assets/images/user (1) 3.png"),
                          label: '',
                          activeIcon: ActiveTab(icon:"assets/images/user (1) 3.png"),
                        ),
                      ]),
             ),
            body:
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                  children: [
                    tabs(state.categories ?? [],state.brands??[], state.products ?? [])
                    [state.index],
                  ],
                ),
              ),
          );
        },
      ),
    );
  }

  List<Widget> tabs(List<Data> cat,List<Data> brand, List<ProductData> prod) =>
      [HomeTab(cat,brand,prod), ProductsTab(prod),FavTab(),SettingTab()];
}

