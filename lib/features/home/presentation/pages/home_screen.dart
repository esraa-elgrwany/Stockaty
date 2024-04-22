import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:location/location.dart';
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
    canAccessLocation();
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
          return Scaffold(
            appBar: AppBar(
              title: Row(
                children: [
                  Image.asset("assets/images/logo-symbol.png"),
                  SizedBox(
                    width: 6.w,
                  ),
                  Text("Stockaty",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Color(0XFF8CB7F5),
                          )),
                ],
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, RoutesName.cart);
                    },
                    icon: Badge(
                      label: Text(
                        HomeCubit.get(context).numOfItemsInCart.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                        ),
                      ),
                      largeSize: 15,
                      alignment: Alignment.topRight,
                      child: ImageIcon(
                        AssetImage("assets/images/cart.png"),
                        color: Colors.black,
                        size: 100,
                      ),
                    ),
                  ),
                ),
              ],
              backgroundColor: Colors.white.withOpacity(0.2),
              elevation: 0,
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
              padding: const EdgeInsets.all(8),
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

  PermissionStatus permissionStatus = PermissionStatus.denied;
  Location location = Location();
  bool serviceEnabled = false;
  LocationData? locationData;

  Future<bool> isPermissionGranted() async {
    permissionStatus = await location.hasPermission();
    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await location.requestPermission();
    }
    return permissionStatus == PermissionStatus.granted;
  }

  Future<bool> isServiceEnabled() async {
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
    }
    return serviceEnabled;
  }

  canAccessLocation()async{
    bool permissionGranted= await  isPermissionGranted();
    if(!permissionGranted)return;

    bool serviceEnabled= await isServiceEnabled();
    if(!serviceEnabled)return;

    locationData=await location.getLocation();
  }
}
