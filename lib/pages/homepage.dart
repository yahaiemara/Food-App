import 'package:appstore1/pages/details.dart';
import 'package:appstore1/service/data_base.dart';
import 'package:appstore1/widget/widget_support.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Stream? fooditemStream;

  ontheload() async {
    fooditemStream = await DatabaseMethods().getFoodItem('pizza');
    setState(() {
      fooditemStream;
    });
  }

  @override
  void initState() {
    ontheload();
    super.initState();
  }
  Widget bodyitem() {
  return StreamBuilder(
  stream: fooditemStream,
  builder: (context, AsyncSnapshot snapshot) {
    if (snapshot.hasData) {
      return GridView.builder(
        padding: EdgeInsets.zero,
        itemCount: snapshot.data.docs.length,
        shrinkWrap: true,
        scrollDirection: Axis.vertical, // تغيير الاتجاه ليكون أفقي
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1, // عرض صف واحد فقط
          crossAxisSpacing: 10.0, // المسافة بين العناصر أفقياً
          mainAxisSpacing: 10.0, // المسافة بين العناصر عمودياً
          childAspectRatio: 3 / 2, // نسبة العرض إلى الارتفاع لكل عنصر
        ),
        itemBuilder: (context, index) {
          DocumentSnapshot qs = snapshot.data.docs[index];
          return Container(
            
              // width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(right: 5),
                   child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        padding:EdgeInsets.all(10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                qs['Image'],
                                height: 100,
                                width: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  qs['Name'],
                                  style: WidgetApp.saladfiledtextstyle(),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  qs['Detail'],
                                  style: WidgetApp.Lightheadfiledtextstyle(),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "\$${qs['Price']}",
                                  style: WidgetApp.saladfiledtextstyle(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
        },
      );
    } else {
      return Center(child: CircularProgressIndicator());
    }
  },
);

}

   Widget allitem() {
  return StreamBuilder(
    stream: fooditemStream,
    builder: (context, AsyncSnapshot snapshot) {
      if (snapshot.hasData) {
        return GridView.builder(
          padding: EdgeInsets.zero,
          itemCount: snapshot.data.docs.length,
          shrinkWrap: true,
          scrollDirection: Axis.vertical, // تأكد من أن الاتجاه عمودي
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // عدد الأعمدة في الشبكة
            crossAxisSpacing: 10.0, // المسافة بين الأعمدة
            mainAxisSpacing: 10.0, // المسافة بين الصفوف
            childAspectRatio: 3 / 4, // نسبة العرض إلى الارتفاع لكل عنصر
          ),
          itemBuilder: (context, index) {
            DocumentSnapshot qs = snapshot.data.docs[index];
            return Container(
             
              margin: EdgeInsets.all(5),
              child: GestureDetector(
                onTap: (){
                  Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Details(
              itemName: qs['Name'],
              itemImage: qs['Image'],
              itemDetail: qs['Detail'],
              itemPrice: qs['Price'],
            ),
          ),
        );
                },
                child: Material(  
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            qs['Image'], // الصورة
                            height: 100,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          qs['Name'], // الاسم
                          style: WidgetApp.saladfiledtextstyle(),
                        ),
                        SizedBox(height: 5),
                        Text(
                          qs['Detail'], // التفاصيل
                          style: WidgetApp.Lightheadfiledtextstyle(),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "\$${qs['Price']}", // السعر
                          style: WidgetApp.saladfiledtextstyle(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      } else {
        return Center(child: CircularProgressIndicator());
      }
    },
  );
}

  bool icecream = false, pizza = false, salad = false, burger = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(top: 50, left: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "hello yahya",
                        style: WidgetApp.boldfiledtextstyle(),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black,
                        ),
                        child: Icon(
                          Icons.shopping_cart_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Delicious Food",
                    style: WidgetApp.boldfiledtextstyle(),
                  ),
                  Text(
                    "Discover and Get Create Food",
                    style: WidgetApp.Lightheadfiledtextstyle(),
                  ),
                  SizedBox(height: 20),
                  ShowItems(),
                  SizedBox(height: 20),
                  
                     allitem(), 
                      // عرض العناصر من StreamBuilder
                  SizedBox(height: 30),
                  bodyitem(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget ShowItems() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () async{
            icecream = true;
            salad = false;
            pizza = false;
            burger = false;
            fooditemStream=await DatabaseMethods().getFoodItem('ice-creame');
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                color: icecream ? Colors.black : Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(8),
              child: Image.asset(
                "images/ice-cream.png",
                height: 40,
                width: 40,
                fit: BoxFit.cover,
                color: icecream ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: ()async {
            icecream = false;
            salad = false;
            pizza = true;
            burger = false;
            fooditemStream=await DatabaseMethods().getFoodItem('pizza');
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                color: pizza ? Colors.black : Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(8),
              child: Image.asset(
                "images/pizza.png",
                height: 40,
                width: 40,
                fit: BoxFit.cover,
                color: pizza ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: ()async {
            icecream = false;
            salad = false;
            pizza = false;
            burger = true;
            fooditemStream=await DatabaseMethods().getFoodItem('burger');

            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                color: burger ? Colors.black : Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(8),
              child: Image.asset(
                "images/burger.png",
                height: 40,
                width: 40,
                fit: BoxFit.cover,
                color: burger ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: ()async {
            icecream = false;
            salad = true;
            pizza = false;
            burger = false;
            fooditemStream=await DatabaseMethods().getFoodItem('salad');

            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                color: salad ? Colors.black : Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(8),
              child: Image.asset(
                "images/salad.png",
                height: 40,
                width: 40,
                fit: BoxFit.cover,
                color: salad ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
