import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'dart:math';

class DetailScreenBody extends StatefulWidget {
  final item;
  DetailScreenBody({Key? key, this.item}) : super(key: key);

  @override
  _DetailScreenBodyState createState() => _DetailScreenBodyState();
}

class _DetailScreenBodyState extends State<DetailScreenBody> {
  late PageController _controller;
  int selectedSize = 0;
  bool isSizeShow = true;
  bool isDescShow = true;

  Random random = new Random();
  int notAvialableSize = 0;
  String price = '';
  @override
  void initState() {
    print(widget.item);

    final formatter = NumberFormat.simpleCurrency();

    price = formatter.format(widget.item["shoe_price"]);
    _controller = new PageController(initialPage: 0);
    setState(() {
      selectedSize = widget.item["size"][0];
      notAvialableSize = 9 + random.nextInt(15 - 9);
      notAvialableSize == widget.item["size"][0]
          ? selectedSize = widget.item["size"][1]
          : widget.item["size"][0];
      print(notAvialableSize);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _header(),
            SizedBox(
              height: 16,
            ),
            _slider(widget.item["images"]),
            SizedBox(
              height: 16,
            ),
            Center(
              child: Text(
                widget.item["shoe_brand"],
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Center(
              child: Text(widget.item["shoe_name"],
                  style: TextStyle(color: Colors.black54)),
            ),
            SizedBox(
              height: 24,
            ),
            _shoeSize(widget.item["size"]),
            SizedBox(
              height: 24,
            ),
            _shoeDesciption(widget.item["description"]),
          ],
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
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Icon(Icons.arrow_back),
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
                  Icon(Icons.star_outline_rounded),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _slider(images) {
    return Container(
      height: 250,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Container(
            height: 200,
            child: PageView.builder(
              controller: _controller,
              scrollDirection: Axis.horizontal,
              itemCount: images.length,
              itemBuilder: (context, index) {
                return Hero(
                  tag: images[index],
                  child: Image(
                    image:
                        AssetImage("assets/images/" + images[index] + '.png'),
                    height: 150,
                    fit: BoxFit.contain,
                  ),
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: EdgeInsets.only(top: 10, right: 16, left: 16),
              child: SmoothPageIndicator(
                controller: _controller,
                count: images.length,
                axisDirection: Axis.horizontal,
                onDotClicked: (index) {
                  setState(() {
                    _controller.animateToPage(index,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.fastOutSlowIn);
                  });
                },
                effect: ExpandingDotsEffect(
                    spacing: 8.0,
                    radius: 4.0,
                    dotWidth: 10.0,
                    dotHeight: 5.0,
                    paintStyle: PaintingStyle.fill,
                    strokeWidth: 1,
                    dotColor: Colors.grey,
                    activeDotColor: Colors.black),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _shoeSize(items) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Select Size",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              IconButton(
                  onPressed: () {
                    setState(() {
                      isSizeShow = !isSizeShow;
                    });
                  },
                  icon: Icon(isSizeShow
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down))
            ],
          ),
          SizedBox(
            height: isSizeShow ? 24 : 0,
          ),
          isSizeShow
              ? Container(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                        items.length,
                        (index) => InkWell(
                          onTap: () {
                            if (items[index] == notAvialableSize) {
                              var snackbar = new SnackBar(
                                  content:
                                      Text("Selected size is not avialable."));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackbar);
                            } else {
                              setState(() {
                                selectedSize = items[index];
                              });
                            }
                          },
                          child: Container(
                            height: 60,
                            width: 60,
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                color: selectedSize == items[index]
                                    ? Colors.black
                                    : notAvialableSize == items[index]
                                        ? Colors.black12
                                        : Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    color: Color(0xFFF7F7F7), width: 1.5)),
                            child: Center(
                              child: Text(
                                items[index].toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: selectedSize == items[index]
                                      ? Colors.white
                                      : notAvialableSize == items[index]
                                          ? Colors.black54
                                          : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : Text("")
        ],
      ),
    );
  }

  Widget _shoeDesciption(desc) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Description",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              IconButton(
                  onPressed: () {
                    setState(() {
                      isDescShow = !isDescShow;
                    });
                  },
                  icon: Icon(isDescShow
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down))
            ],
          ),
          SizedBox(
            height: 24,
          ),
          isDescShow
              ? Text(
                  desc,
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                )
              : Text("")
        ],
      ),
    );
  }
}
