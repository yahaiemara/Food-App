import 'package:appstore1/Admin/Home_admin.dart';
import 'package:appstore1/Admin/add_food.dart';
import 'package:appstore1/Admin/admin_login.dart';
import 'package:appstore1/pages/details.dart';
import 'package:appstore1/pages/forgetpassword.dart';
import 'package:appstore1/pages/profile.dart';
import 'package:appstore1/pages/login.dart';
import 'package:appstore1/pages/navigation_bar.dart';
import 'package:appstore1/pages/onboard.dart';
import 'package:appstore1/pages/signup.dart';
import 'package:appstore1/widget/app_constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:appstore1/pages/homepage.dart';
import 'package:appstore1/widget/app_constant.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: 'AIzaSyABHudAtOKPPqVGFaYg8E73jEU5KgfgVcs',
          appId: '1:649534111494:android:b5624977b5015bbee82887',
          messagingSenderId: '649534111494',
          projectId: 'appfood1-3039f',
            
          ));
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  @override
  void initState(){
    FirebaseAuth.instance
  .authStateChanges()
  .listen((User? user) {
    if (user == null) {
      print('=============================User is currently signed out!');
    } else {
      print('=============================User is signed in!');
    }
  });
  super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home:FirebaseAuth.instance.currentUser==null? Login():BottomNav(),
      home:Login(),
      routes: {
       
        'signup': (context) => Signup(),
        'login': (context) => Login(),
        'bottombar': (context) => BottomNav(),
        'forgetpassword':(context)=>Forgetpassword(),
        'addfood':(context)=>AddFood(),
      },
    );
  }
}
