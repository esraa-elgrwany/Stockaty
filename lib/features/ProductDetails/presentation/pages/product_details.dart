
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_shopping_app/core/utils/app_colors.dart';
import 'package:my_shopping_app/features/home/data/models/ProductsModel.dart';

import '../../../../config/routes/routes.dart';
import '../../../home/presentation/manager/Home-manager/home_cubit.dart';

class ProductDetails extends StatefulWidget{
  ProductData item;
  ProductDetails(this.item);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  String favImage="assets/images/heart.png";
  bool fav=false;
  List<Color> clrs = [
    Color(0xFF2F2929),
    Color(0xFFBC3018),
    Color(0xFF0973DD),
    Color(0xFF02B935),
    Color(0xFFFF645A)
  ];

  List<String> size = ["38", "39", "40", "41", "42"];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => HomeCubit(),
  child: BlocConsumer<HomeCubit, HomeStates>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80.h,
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
              child: CircleAvatar(backgroundColor:Colors.grey.withOpacity(.1),

                  child: Icon(Icons.arrow_back,color:lightBlueColor)),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: () {
                    fav=!fav;
                    setState(() {
                    });
                    if(fav==true){
                      favImage="assets/images/loved.png";
                      HomeCubit.get(context).addToFav(widget.item.id ?? "");
                    }else{
                      favImage= "assets/images/heart.png";
                      HomeCubit.get(context).removeFromFav(widget.item.id ?? "");
                    }
                  },
                  child: Container(
                      child: Center(
                          child: ImageIcon(
                            AssetImage(favImage),
                            color: primaryColor,
                          )
                                  ),
                      height: 40.h,
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(.1),
                          borderRadius: BorderRadius.circular(20)),
                      width: 40),
                ),
              ),
            )
          ],
          title: Text("Product Details",
             style: Theme.of(context)
        .textTheme
        .bodyLarge
    ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Stack(
                  children: [
                    Center(
                      child: ImageSlideshow(
                          indicatorColor:Theme.of(context).colorScheme.secondary,
                          indicatorBackgroundColor: Colors.white,
                          height: 300,
                          autoPlayInterval: 300000,
                          indicatorRadius: 4,
                          isLoop: true,
                          children: [
                             ClipRRect(
                                  borderRadius: BorderRadiusDirectional.circular(35),
                                  child: Image.network(widget.item.images?[0]??"",fit: BoxFit.cover,)),
                             ClipRRect(
                                borderRadius: BorderRadiusDirectional.circular(35),
                                  child: Image.network(widget.item.images?[1]??"",fit: BoxFit.cover,)),
                          ]
                    ),
                    ),
                  ],
                ),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35)),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(widget.item.title??"",
                              maxLines:2,
                              overflow: TextOverflow.ellipsis,
                                style:Theme.of(context).textTheme.bodyLarge

                                )),
                        SizedBox(width: 20.w,),
                       Text("EGP",style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                         color: Color(0xFFFA3434)
                       )),
                       SizedBox(width: 4.w,),
                       Text("${widget.item.price.toString()}",
                         style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                             color: Color(0xFFFA3434)
                         ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      children: [
                        Spacer(),
                        Icon(Icons.star, color: Colors.amberAccent,size: 30,),
                        SizedBox(width: 5),
                        Text("${widget.item.ratingsAverage}",
                                    style: Theme.of(context).textTheme.bodyLarge),

                      ],
                    ),
                    SizedBox(height:8.h),
                    Text("Description",
                        style: Theme.of(context).textTheme.bodyLarge),
                    SizedBox(height: 5),
                    Text(
                      "${widget.item.description}",
                      style: Theme.of(context).textTheme.bodySmall
                    ),
                    SizedBox(height: 5),
                    Text("Size",
                        style:Theme.of(context).textTheme.bodyLarge),
                    SizedBox(
                        height: 50,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: size.length,
                            itemBuilder: (context, index) {
                              return Container(
                                child: Center(
                                    child: Text(
                                      "${size[index]}",
                                      style: TextStyle(
                                          color: index == 2
                                              ? Colors.white
                                              : Colors.black),
                                    )),
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: index == 2
                                        ?greenColor
                                        : Colors.white),
                              );
                            })),
                    Text("Color",
                        style: Theme.of(context).textTheme.bodyLarge),
                    SizedBox(
                        height: 50,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: clrs.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(5),
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: clrs[index]),
                                ),
                              );
                            }))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        height: 70.h,
        child: Row(
          children: [
            InkWell(
              onTap: () {
                HomeCubit.get(context)
                    .addTCart(widget.item.id ?? "");
              },
              child: Container(
                child: Center(
                    child: Text("Add To Cart",
                        style: TextStyle(
                            color:Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20))),
                height: 50.h,
                decoration: BoxDecoration(
                  color: primaryColor,
                    borderRadius: BorderRadius.circular(14.r)),
                width: MediaQuery.of(context).size.width *.75,
              ),
            ),
            Spacer(),
            Container(
              decoration: BoxDecoration(
                border:Border.all(
                  color: Color(0xFFDEE2E7),
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(8)
              ),
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
                    size: 90.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  },
),
);
  }
}