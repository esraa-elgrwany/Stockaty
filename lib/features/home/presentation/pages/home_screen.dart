import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_shopping_app/features/home/presentation/Tabs/Fav_Tab.dart';
import 'package:my_shopping_app/features/home/presentation/Tabs/HomeTab.dart';
import 'package:my_shopping_app/features/home/presentation/Tabs/Product_tab.dart';
import 'package:my_shopping_app/features/home/presentation/Tabs/Setting_Tab.dart';
import 'package:my_shopping_app/features/home/presentation/manager/home_bloc.dart';

import '../../data/models/AddToCartModel.dart';
import '../../data/models/CategoryAndBrandModel.dart';
import '../../data/models/ProductsModel.dart';

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
              title: Text("My Cart"),
              backgroundColor: Colors.transparent,
            ),
            bottomNavigationBar: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BottomNavigationBar(
                  currentIndex: state.index,
                  onTap: (value) {
                    BlocProvider.of<HomeBloc>(context)
                        .add(ChangeBottomNavBar(value));
                  },
                  showSelectedLabels: false,
                  items: [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.home_outlined, size: 35,),
                        label: "",
                        backgroundColor: Color(0xff004182)),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.grid_view, size: 35,),
                        label: "",
                        backgroundColor: Color(0xff004182)),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.favorite_border, size: 35,),
                        label: "",
                        backgroundColor: Color(0xff004182)),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.settings, size: 35,),
                        label: "",
                        backgroundColor: Color(0xff004182)),
                  ]),
            ),
            body:
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: SearchBar(
                              hintText: "Search",
                              leading: Icon(
                                Icons.search, size: 35, color: Colors.grey,),
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadiusDirectional
                                          .circular(24)
                                  )),
                            ),
                          ),
                          IconButton(onPressed: () {

                          }, icon: Icon(Icons.shopping_cart, size: 35,),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 16.h,
                      ),

                      tabs(state.categories ?? [], state.products ?? []) [state.index],
                    ],
                  ),
              ),
          );
        },
      ),
    );
  }

  List<Widget> tabs(List<Data> cat, List<ProductData> prod) =>
      [HomeTab(cat), ProductsTab(prod),FavTab(),SettingTab()];
}

