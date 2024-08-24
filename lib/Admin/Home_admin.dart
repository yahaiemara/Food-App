import 'package:appstore1/widget/widget_support.dart';
import 'package:flutter/material.dart';

class HomeAdmin extends StatefulWidget {
  const HomeAdmin({super.key});

  @override
  State<HomeAdmin> createState() => _HomeAdminState();
}

class _HomeAdminState extends State<HomeAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Center(child: Text("Home Admin",style: WidgetApp.headlinefiledtextstyle(),),),
            Container(height:20),
            GestureDetector(
              onTap: (){
                Navigator.of(context).pushNamed('addfood');
              },
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(10),
                child: Center(child: Container(
                 padding: EdgeInsets.all(4),
                 decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                  
                 ),
                 child: Row(children: [
                  Padding(padding: EdgeInsets.all(6.0)),
                 Image.asset('images/food.jpg',height:100,width:100,fit:BoxFit.cover),
                 Container(width: 10,),
                 Text("Add Food Items",style:TextStyle(color: Colors.white,fontFamily: 'Poppins',fontSize: 20.0,fontWeight: FontWeight.bold))
                 ],),
                ),),
              ),
            )
          ],
        ),
      ),
    );
  }
}