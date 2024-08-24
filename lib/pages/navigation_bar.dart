import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:appstore1/pages/homepage.dart';
import 'package:appstore1/pages/Wallet.dart';
import 'package:appstore1/pages/Profile.dart';
import 'package:appstore1/pages/details.dart';
import 'package:appstore1/pages/order.dart';
class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentTebIndex = 0;
  late List<Widget> pages=[Home(),Wallet(),Order(),Profile()];
  late Widget CurrentPages;
  late Home HomePage;
  late Order order;
  late Profile profile;
  late Wallet wallet;
  @override
  void iniState() {
    HomePage = Home();
    order = Order();
    profile = Profile();
    wallet = Wallet();
    pages = [HomePage, order, profile, wallet];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      
      bottomNavigationBar: CurvedNavigationBar(
        height:50,
        backgroundColor: Colors.white,
        color: Colors.black,
        animationDuration: Duration(milliseconds: 500),
        onTap: (int index){
        setState(() {
          currentTebIndex=index;
        });
        },
        items: [
        Icon(
          Icons.home_outlined,
          color: Colors.white,
        ),
        Icon(
          Icons.shopping_bag_outlined,
                  color: Colors.white,

        ),
        Icon(
          Icons.wallet_outlined,
                 color: Colors.white,

        ),
        Icon(
          Icons.person_2_outlined,
                    color: Colors.white,

        ),
      ]),
      body: pages[currentTebIndex],
    );
  }
}
