import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_shopping_app/features/home/presentation/manager/Home-manager/home_cubit.dart';
import '../../../../config/routes/routes.dart';
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
      create: (context) => HomeCubit()
        ..getCategories()
        ..getBrands()
        ..getProducts()
        ..getNumOfCart(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {
          if (state is HomeGetProductsErrorState) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text("Error"),
                content: Text(state.failures.errormsg),
              ),
            );
          }
          if (state is HomeLoadingState) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Center(child: CircularProgressIndicator()),
              ),
            );
          } else if (state is HomeGetCategoriesSuccessState) {}
        },
        builder: (context, state) {
          final cartCount = HomeCubit.get(context).numOfItemsInCart;
          return Scaffold(
            appBar: AppBar(
              toolbarHeight: 90.h,
              title:
              Column(
                children: [
                  Row(
                    children: [
                      Image.asset("assets/images/Group 15106.png",
                          width: 100.w, height: 150.h),
                      Spacer(),
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, RoutesName.cart);
                        },
                        icon: Badge(
                          label: Text(
                            cartCount.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ),
                          largeSize: 20,
                          alignment: Alignment.topRight,
                          child: ImageIcon(
                            AssetImage("assets/images/cart.png"),
                            color: Colors.black,
                            size: 40,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            bottomNavigationBar: ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(24.r),
                topLeft: Radius.circular(24.r),
                bottomRight: Radius.circular(8.r),
                bottomLeft: Radius.circular(8.r),
              ),
              child: BottomNavigationBar(
                  currentIndex: HomeCubit.get(context).bottomNavIndex,
                  onTap: (value) {
                    HomeCubit.get(context).changeBottomNav(value);
                  },
                  showSelectedLabels: false,
                  items: [
                    BottomNavigationBarItem(
                      icon: NotActiveTab(icon: "assets/images/home.png"),
                      label: "",
                      activeIcon: ActiveTab(icon: "assets/images/home.png"),
                    ),
                    BottomNavigationBarItem(
                      icon: NotActiveTab(icon: "assets/images/cat.png"),
                      label: '',
                      activeIcon: ActiveTab(icon: "assets/images/cat.png"),
                    ),
                    BottomNavigationBarItem(
                      icon: NotActiveTab(icon: "assets/images/heart.png"),
                      label: '',
                      activeIcon: ActiveTab(icon: "assets/images/heart.png"),
                    ),
                    BottomNavigationBarItem(
                      icon: NotActiveTab(icon: "assets/images/user (1) 3.png"),
                      label: '',
                      activeIcon:
                          ActiveTab(icon: "assets/images/user (1) 3.png"),
                    ),
                  ]),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  HomeCubit.get(context)
                      .tabs[HomeCubit.get(context).bottomNavIndex],
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
