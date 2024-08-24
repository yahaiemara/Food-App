import 'package:appstore1/Admin/Home_admin.dart';
import 'package:appstore1/widget/widget_support.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  TextEditingController username=TextEditingController();
  TextEditingController password=TextEditingController();
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFededeb),
      body: ListView(
        children: [
     Container(
          child: Stack(
            children: [
              Container(
                margin:
                    EdgeInsets.only(top: MediaQuery.of(context).size.height / 2),
                padding: EdgeInsets.only(top: 45.0, left: 20.0, right: 20.0),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color.fromARGB(255, 35, 51, 51), Colors.black],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight),
                    borderRadius: BorderRadius.vertical(
                        top: Radius.elliptical(
                            MediaQuery.of(context).size.width, 110.0))),
              ),
              Container(
                margin: EdgeInsets.only(top: 60.0, left: 30.0, right: 30.0),
                child: Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        Text(
                          "Lets Start With\nAdmin!",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
        
                          ),
                        ),
                        Container(height: 30,),
                        Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            height: MediaQuery.of(context).size.height/2.2,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)
                            ),
                            child: Column(
                              children: [
                                Container(height: 50.0,),
                                Container(
                                
                                  padding: EdgeInsets.only(left: 20.0,top: 20.0,bottom: 20.0),
                                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                                  decoration: BoxDecoration(
                                    border: Border.all(color:Color.fromARGB(255, 160, 160, 147)),
                                    borderRadius: BorderRadius.circular(20),
                                    
                                  ),
                                  child: Center(child: TextFormField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Username",
                                      hintStyle: TextStyle(color: Color.fromARGB(255, 160, 160, 145)),
                                    ),
                                    controller: username,
                                    validator: (value){
                                      if(value==''||value==null){
                                        return 'املاء الحقل';
                                      }
                                      return null;
                                    },
                                  ),),
                                  
                                ),
                                Container(height: 20,),
                                  Container(
                                  padding: EdgeInsets.only(left: 20.0,top: 20.0,bottom: 20.0),
                                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                                  decoration: BoxDecoration(
                                    border: Border.all(color:Color.fromARGB(255, 160, 160, 147)),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(child: TextFormField(
                                    obscureText: true,
                                     decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "password",
                                      hintStyle: TextStyle(color: Color.fromARGB(255, 160, 160, 145)),
                                    ),
                                    controller: password,
                                    validator: (value){
                                      if(value==''||value==null){
                                        return 'املاء الحقل';
                                      }
                                      return null;
                                    },
                                  ),),
                                ),
                                Container(height: 40,),
                                GestureDetector(
                                  onTap: (){
                                    LoginAdmin();
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 5),
                                    margin: EdgeInsets.symmetric(horizontal: 20.0),
                                    
                                    width: MediaQuery.of(context).size.width,
                                    
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(child: Text("Login",style:TextStyle(color: Colors.white,fontSize: 20.0,fontFamily: 'Poppins',fontWeight: FontWeight.bold),),),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    )),
              )
            ],
          ),
        ),
      ]),
    );
  }
 LoginAdmin() {
    FirebaseFirestore.instance.collection("Admin").get().then((snapshot) {
      snapshot.docs.forEach((result) {
        if (result.data()['id'] != username.text.trim()) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "Your id is not correct",
                style: TextStyle(fontSize: 18.0),
              )));
        } else if (result.data()['password'] !=
            password.text.trim()) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "Your password is not correct",
                style: TextStyle(fontSize: 18.0),
              )));
        } else {
          Route route = MaterialPageRoute(builder: (context) => HomeAdmin());
          Navigator.pushReplacement(context, route);
        }
      });
    });
  }
}
