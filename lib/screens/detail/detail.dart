import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shoeapp/screens/detail/components/body.dart';

class DetailScreen extends StatefulWidget {
  final item;
  DetailScreen({Key? key, this.item}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  String price = '';
  @override
  void initState() {
    final formatter = NumberFormat.simpleCurrency();

    price = formatter.format(widget.item["shoe_price"]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: DetailScreenBody(
            item: widget.item,
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
          child: InkWell(
            onTap: () {},
            child: Container(
              height: 60,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(8)),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.shopping_bag_outlined,
                          color: Colors.white,
                          size: 16,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Add to cart",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12))
                      ],
                    ),
                    Row(
                      children: [
                        Text(price,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12)),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                          size: 14,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
