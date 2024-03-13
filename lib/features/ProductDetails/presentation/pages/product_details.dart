
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_shopping_app/core/utils/app_colors.dart';
import 'package:my_shopping_app/features/home/data/models/ProductsModel.dart';

import '../../../../config/routes/routes.dart';

class ProductDetails extends StatefulWidget{
  ProductData item;
  ProductDetails(this.item);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {

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

                  child: Icon(Icons.arrow_back,color:Theme.of(context).colorScheme.secondary)),
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
                  },
                  child: Container(
                      child: Center(
                          child:fav? Icon(Icons.favorite,
                              color:Theme.of(context).colorScheme.secondary)
                              :Icon(Icons.favorite_border_outlined,
                              color:Theme.of(context).colorScheme.secondary)
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
        .bodyLarge!.copyWith(color: primaryColor,
             fontWeight: FontWeight.w100)
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
                                style:Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  color: Theme.of(context).colorScheme.onSecondary,)

                                )),
                        SizedBox(width: 20.w,),
                       Text("EGP",style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                         color: Theme.of(context).colorScheme.secondary )),
                       SizedBox(width: 6.w,),
                       Text("${widget.item.price.toString()}",
                         style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                           color: Theme.of(context).colorScheme.secondary,),
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
                                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                  color: Theme.of(context).colorScheme.onSecondary,)),

                      ],
                    ),
                    SizedBox(height:8.h),
                    Text("Description",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: primaryColor
                        )),
                    SizedBox(height: 5),
                    Text(
                      "${widget.item.description}",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Theme.of(context).colorScheme.onSecondary,),
                    ),
                    SizedBox(height: 5),
                    Text("Size",
                        style:Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: primaryColor)),
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
                                        ?primaryColor
                                        : Colors.white),
                              );
                            })),
                    Text("Color",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: primaryColor)),
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
        height: 70,
        child: Row(
          children: [
            InkWell(
              onTap: () {},
              child: Container(
                child: Center(
                    child: Text("Add To Cart",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20))),
                height: 60.h,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(24)),
                width: MediaQuery.of(context).size.width *.7,
              ),
            ),
            Spacer(),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context,RoutesName.cart);
              },
              child: Container(
               child: ImageIcon(
                 AssetImage("assets/images/cart.png"),
                 size: 40,
                 color:primaryColor,
               ),
                height: 60.h,
                width: 50.w,
                decoration:
                BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: Colors.grey.withOpacity(.1),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}