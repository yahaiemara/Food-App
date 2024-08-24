import 'package:appstore1/widget/content_model.dart';
import 'package:appstore1/widget/widget_support.dart';
import 'package:flutter/material.dart';


class Onboard extends StatefulWidget {
  const Onboard({super.key});

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  int currentindex=0;
  late PageController _controller;
  @override
  void initState(){
  _controller=PageController(initialPage: 0);
  super.initState();
  }
  @override
  void dispose(){
  _controller.dispose();
  super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: Contents.length,
              onPageChanged: (int index){
              setState(() {
                currentindex=index;
              });
              },
              itemBuilder: (_,i){
             return Padding(padding: EdgeInsets.all(20),
             child: Column(children: [
              Image.asset(Contents[i].image,height: 380,width: MediaQuery.of(context).size.width/1.5,fit: BoxFit.fill,),
              Container(height: 10.0,),
              Text(Contents[i].title,style: WidgetApp.headlinefiledtextstyle(),),
              Container(height: 10.0,),
              Text(Contents[i].description,style: WidgetApp.Lightheadfiledtextstyle(),)
            
             ],),
             );
            },),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(Contents.length, (index)=>
                buildDot(index,context),
              )
            ,),
          ),
          GestureDetector(
            onTap: (){
              if(currentindex==Contents.length-1){
                Navigator.of(context).pushReplacementNamed('signup');
              }
              _controller.nextPage(duration: Duration(milliseconds: 1000), curve: Curves.bounceIn);
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(20),
              ),
              height: 60,
              margin: EdgeInsets.all(40),
              width: double.infinity,
              child: Text("Next",style:TextStyle(color: Colors.white,fontSize: 20.0,fontFamily: 'Poppins',fontWeight: FontWeight.bold ),),
            ),
          )
        ],
      ),
    );
  }
  Container buildDot(int  index,BuildContext context)  {
    return Container(
     height: 10.0,
     width: currentindex==index?18:7,
     margin: EdgeInsets.only(right: 5),
     decoration: BoxDecoration(borderRadius: BorderRadius.circular(6),color: Colors.black38),
    );
  }
}