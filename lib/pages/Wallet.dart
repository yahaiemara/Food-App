import 'package:appstore1/widget/widget_support.dart';
import 'package:flutter/material.dart';


class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          margin: EdgeInsets.only(top: 50.0),
          child: Column(
            children: [
              Material(
                  elevation: 2.0,
                  child: Center(
                    child:
                        Text("Wallet", style: WidgetApp.saladfiledtextstyle()),
                  )),
              Container(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xFFF2F2F2),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'images/wallet.png',
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      height: 40,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Your Wallet",
                          style: WidgetApp.saladfiledtextstyle(),
                        ),
                        Container(
                          height: 5.5,
                        ),
                        Text(
                          "\$100",
                          style: WidgetApp.boldfiledtextstyle(),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: 10),
                alignment: Alignment.topLeft,
                child: Text(
                  "Add Money",
                  style: WidgetApp.headlinefiledtextstyle(),
                ),
              ),
              Container(
                height: 10,
              ),
              Row(
               
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFE9E2E2)),
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      "\$" + "100",
                      style: WidgetApp.saladfiledtextstyle(),
                    ),
                  ),
                        Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFE9E2E2)),
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      "\$" + "500",
                      style: WidgetApp.saladfiledtextstyle(),
                    ),
                  ),
                        Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFE9E2E2)),
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      "\$" + "1000",
                      style: WidgetApp.saladfiledtextstyle(),
                    ),
                  ),
                        Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFE9E2E2)),
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      "\$" + "1500",
                      style: WidgetApp.saladfiledtextstyle(),
                    ),
                  ),
                        Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFE9E2E2)),
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      "\$" + "2000",
                      style: WidgetApp.saladfiledtextstyle(),
                    ),
                  ),
                ],
              ),
              Container(height: 20,),
              Container(
              padding: EdgeInsets.symmetric(vertical: 12.0),
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Center(child: Text("Add Money",style:TextStyle(fontSize: 14.0,fontFamily: 'Poppins',color: Colors.white,),),),

              )
            ],
          )),
    );
  }

}
