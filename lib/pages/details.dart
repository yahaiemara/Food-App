import 'package:appstore1/service/data_base.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:appstore1/widget/widget_support.dart';

class Details extends StatefulWidget {
  final String itemName;
  final String itemImage;
  final String itemDetail;
  final String itemPrice; // Item price as String

  const Details({super.key, required this.itemName, required this.itemImage, required this.itemDetail, required this.itemPrice});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int a = 1;

  double getTotalPrice() {
    // Convert itemPrice from String to double
    double price = double.parse(widget.itemPrice);
    return price * a;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios_new_outlined,
                      color: Colors.black,
                    ),
                  ),
                  Image.network(
                    widget.itemImage,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 2,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.itemName, style: WidgetApp.saladfiledtextstyle()),
                          Text(widget.itemDetail, style: WidgetApp.boldfiledtextstyle()),
                        ],
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (a > 1) a--;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.remove,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        a.toString(),
                        style: WidgetApp.boldfiledtextstyle(),
                      ),
                      SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            ++a;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Price: \$${widget.itemPrice}",
                    style: WidgetApp.headlinefiledtextstyle(),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla vulputate odio sit amet rhoncus eleifend. Nullam egestas aliquam nulla eget varius. Donec pulvinar diam ac est dignissim sodales. Nam gravida euismod varius. Sed velit tortor, accumsan quis odio at, consequat maximus nisl. Proin dapibus non metus sed pharetra. Proin vitae consequat nunc. Proin fringilla varius ex",
                    maxLines: 3,
                    style: WidgetApp.Lightheadfiledtextstyle(),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        "Delivery Time",
                        style: WidgetApp.Lightheadfiledtextstyle(),
                      ),
                      SizedBox(width: 10),
                      Icon(Icons.alarm),
                      SizedBox(width: 3),
                      Text(
                        "30min",
                        style: WidgetApp.Lightheadfiledtextstyle(),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total Price",
                            style: WidgetApp.headlinefiledtextstyle(),
                          ),
                          Text(
                            "\$${getTotalPrice().toStringAsFixed(2)}",
                            style: WidgetApp.headlinefiledtextstyle(),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            GestureDetector(
                            
                              child: Text(
                                "Add To Cart",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Poppins',
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Icon(
                                Icons.shopping_cart_checkout_outlined,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
