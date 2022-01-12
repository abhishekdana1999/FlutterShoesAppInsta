import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:shoeapp/screens/detail/detail.dart';

class HomeBody extends StatefulWidget {
  HomeBody({Key? key}) : super(key: key);

  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  List products = [];
  @override
  void initState() {
    readJson();
    super.initState();
  }

  Future readJson() async {
    const response = [
      {
        "shoe_name": "Air Jordan 6 Retro cactus jack -Travis Scott",
        "shoe_brand": "Air Jordan",
        "shoe_price": 1594,
        "size": [9, 10, 11, 12, 13, 15],
        "color": "557054",
        "images": ["Air_Jordan_1", "Air_Jordan_2"],
        "description":
            "The lorem ipsum is a placeholder text used in publishing and graphic design. This filler text is a short paragraph that contains all the letters of the alphabet. The characters are spread out evenly so that the reader's attention is focused on the layout of the text instead of its content."
      },
      {
        "shoe_name": "Air Jordan 1 Mid 'Melody Ehsani' sneakers",
        "shoe_brand": "Air Jordan",
        "shoe_price": 2502,
        "size": [9, 10, 11, 12, 13, 15],
        "color": "ed0018",
        "images": ["Air_Jordan_3", "Air_Jordan_4"],
        "description":
            "The lorem ipsum is a placeholder text used in publishing and graphic design. This filler text is a short paragraph that contains all the letters of the alphabet. The characters are spread out evenly so that the reader's attention is focused on the layout of the text instead of its content."
      },
      {
        "shoe_name": "Air Jordan 1 High Tie-Dye sneakers",
        "shoe_brand": "Air Jordan",
        "shoe_price": 529,
        "size": [9, 10, 11, 12, 13, 15],
        "color": "009dc4",
        "images": ["Air_Jordan_5", "Air_Jordan_6"],
        "description":
            "The lorem ipsum is a placeholder text used in publishing and graphic design. This filler text is a short paragraph that contains all the letters of the alphabet. The characters are spread out evenly so that the reader's attention is focused on the layout of the text instead of its content."
      },
      {
        "shoe_name": "Nike SB Zoom Blazer Mid",
        "shoe_brand": "Nike",
        "shoe_price": 85,
        "size": [9, 10, 11, 12, 13, 15],
        "color": "723f20",
        "images": ["Nike_SB_1", "Nike_SB_2"],
        "description":
            "The lorem ipsum is a placeholder text used in publishing and graphic design. This filler text is a short paragraph that contains all the letters of the alphabet. The characters are spread out evenly so that the reader's attention is focused on the layout of the text instead of its content."
      },
      {
        "shoe_name": "Nike Air Presto",
        "shoe_brand": "Nike",
        "shoe_price": 829,
        "size": [9, 10, 11, 12, 13, 15],
        "color": "eb6048",
        "images": ["Nike_Air_3", "Nike_Air_4"],
        "description":
            "The lorem ipsum is a placeholder text used in publishing and graphic design. This filler text is a short paragraph that contains all the letters of the alphabet. The characters are spread out evenly so that the reader's attention is focused on the layout of the text instead of its content."
      }
    ];

    setState(() {
      products = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [_header(), _search(), _topSerch(), _productList()],
        ),
      ),
    );
  }

  Widget _header() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Icon(Icons.menu),
            ),
          ),
          Text(
            "Shoe.",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Stack(
                children: [
                  Icon(Icons.shopping_bag_outlined),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 15,
                        width: 15,
                        decoration: BoxDecoration(
                            color: Colors.red[700],
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Center(
                          child: Text(
                            "2",
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                        ),
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _search() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.black12),
            boxShadow: [
              BoxShadow(
                  blurRadius: 1,
                  spreadRadius: 2,
                  offset: Offset(0, 5),
                  color: (Colors.grey[100])!)
            ]),
        child: Center(
          child: TextFormField(
            cursorColor: Colors.black,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.search_outlined,
                color: Colors.black45,
              ),
              hintText: "Search for puma , nike ...",
              hintStyle: TextStyle(
                  color: Colors.black38,
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
              enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
              focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
            ),
          ),
        ),
      ),
    );
  }

  Widget _topSerch() {
    List topSeach = [
      'Popular Today',
      'New Arrival',
      'Retailer',
      'Discounted',
      'Most Buy'
    ];
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Wrap(
            children: List.generate(
              topSeach.length,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  child: Text(
                    topSeach[index],
                    style: TextStyle(
                        color: index == 0 ? Colors.black : Colors.black38,
                        fontSize: 16,
                        fontWeight:
                            index == 0 ? FontWeight.w900 : FontWeight.normal),
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  Widget _productList() {
    return Expanded(
      child: SingleChildScrollView(
          child: products.length != 0
              ? Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                  child: Column(
                      children: List.generate(products.length, (index) {
                    final formatter = NumberFormat.simpleCurrency();
                    final price =
                        formatter.format(products[index]["shoe_price"]);
                    int selectedIndex = 0;
                    final borderColor = '0XFF' + products[index]["color"];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  DetailScreen(item: products[index])));
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.black12),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 1,
                                    spreadRadius: 2,
                                    offset: Offset(0, 5),
                                    color: (Colors.grey[100])!)
                              ]),
                          child: Column(
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Positioned(
                                        child: Container(
                                      height: 50,
                                      width: 5,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(8),
                                              bottomRight: Radius.circular(8)),
                                          color: Color(int.parse(borderColor))),
                                    )),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            products[index]["shoe_name"],
                                            style: TextStyle(
                                                color: Colors.black45,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            products[index]["shoe_brand"],
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Hero(
                                tag: products[index]["images"][selectedIndex],
                                child: Image(
                                  image: AssetImage("assets/images/" +
                                      products[index]["images"][selectedIndex] +
                                      '.png'),
                                  height: 150,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 100,
                                    padding: EdgeInsets.all(16),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Price",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.black54,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            price,
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                        children: List.generate(
                                            products[index]["images"].length,
                                            (pIndex) => Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: InkWell(
                                                    onTap: () {},
                                                    child: Container(
                                                      height: 60,
                                                      width: 60,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          border: Border.all(
                                                              color: Colors
                                                                  .black12)),
                                                      child: Center(
                                                        child: Image(
                                                          image: AssetImage(
                                                            "assets/images/" +
                                                                products[index][
                                                                        "images"]
                                                                    [pIndex] +
                                                                '.png',
                                                          ),
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ))),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  })),
                )
              : CircularProgressIndicator()),
    );
  }
}
