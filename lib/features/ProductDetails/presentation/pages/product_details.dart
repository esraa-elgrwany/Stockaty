
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:my_shopping_app/features/home/data/models/ProductsModel.dart';

class ProductDetails extends StatelessWidget {
  ProductData item;
  ProductDetails(this.item);

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
   // var item=ModalRoute.of(context)?.
    //settings.arguments as ProductData;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back, color: Color(0xFF06004F)),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.search, color: Color(0xFF06004F))),
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.shopping_cart, color: Color(0xFF06004F))),
          ],
          title: Text("Products Details",
              style: TextStyle(fontSize: 20, color: Color(0xFF06004F)))),
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
                          indicatorColor: Colors.redAccent,
                          indicatorBackgroundColor: Colors.white,
                          height: 300,
                          autoPlayInterval: 30000,
                          indicatorRadius: 4,
                          isLoop: true,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.network(item.images?[0]??""),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.network(item.images?[1]??""),
                            ),
                          ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                              child: Center(
                                  child: Icon(Icons.favorite_outline,
                                      color: Color(0xFF06004F))),
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              width: 40),
                        ),
                      ),
                    )
                  ],
                ),
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Color(0xFFD4ECF7),
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
                        Text(item.title??"",
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF06004F))),
                        Text(item.price.toString(),
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF06004F))),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 100,
                          height: 40,
                          child: Center(
                            child: Text(
                              "${item.sold} sold",
                              style: TextStyle(color: Color(0xFF06004F)),
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  color: Colors.blue.withOpacity(0.5))),
                        ),
                        Container(
                            child: Row(
                              children: [
                                Icon(Icons.star, color: Colors.amberAccent),
                                SizedBox(width: 5),
                                Text("${item.ratingsAverage}"),
                              ],
                            )),
                        Container(
                          width: 100,
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                CupertinoIcons.minus_circle,
                                color: Colors.white,
                              ),
                              Text(
                                "1",
                                style: TextStyle(color: Colors.white),
                              ),
                              Icon(
                                Icons.add_circle_outline,
                                color: Colors.white,
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: Color(0xFF06004F),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  color: Colors.blue.withOpacity(0.5))),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Text("Description",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF06004F))),
                    SizedBox(height: 5),
                    Text(
                      "${item.description}",
                      style: TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                    SizedBox(height: 5),
                    Text("Size",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF06004F))),
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
                                        ? Color(0xFF06004F)
                                        : Colors.white),
                              );
                            })),
                    Text("Color",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF06004F))),
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                height: 60,
                decoration: BoxDecoration(
                    color: Color(0xFF06004F),
                    borderRadius: BorderRadius.circular(30)),
                width: MediaQuery.of(context).size.width / 2,
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Total Price",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black45)),
                    Text("${item.price}",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF06004F))),
                  ],
                ),
                height: 60,
                decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(20)),
                width: MediaQuery.of(context).size.width / 3,
              ),
            )
          ],
        ),
      ),
    );
  }
}