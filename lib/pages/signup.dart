
import 'package:appstore1/widget/widget_support.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {

 TextEditingController email=TextEditingController();
 TextEditingController password=TextEditingController();
 TextEditingController username=TextEditingController();
   final FirebaseFirestore _firestore = FirebaseFirestore.instance; // استخدام FirebaseFirestore instance

 
final _formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFFff5c30), Color(0xFFe74b1a)],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 3),
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Text(""),
              ),
              Container(
                margin: EdgeInsets.only(top: 60, right: 20, left: 20),
                child: Column(
                  children: [
                    Center(
                      child: Image.asset(
                        "images/logo.png",
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 10),
                    Material(
                      borderRadius: BorderRadius.circular(20),
                      elevation: 5.0,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 2,
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              SizedBox(height: 30),
                              Text(
                                "Sign Up",
                                style: WidgetApp.headlinefiledtextstyle(),
                              ),
                              SizedBox(height: 10),
                              TextFormField(
                                controller: username,
                                  validator: (value){
                                if(value==null ||value==''){
                                return 'املاء الحقل ';
                                }
                                return null;
                                },
                              // onChanged: (value){
                              //  setState(() {
                              //    _username=value;
                              //  });
                              // },
                                decoration: InputDecoration(
                                  hintText: 'UserName',
                                  hintStyle: WidgetApp.saladfiledtextstyle(),
                                  prefixIcon: Icon(Icons.person_2_outlined),
                                ),
                              ),
                              SizedBox(height: 10),
                              TextFormField(
                                controller: email,
                                validator: (value){
                                if(value==null ||value==''){
                                return 'املاء الحقل ';
                                }
                                return null;
                                },
                                // onChanged: (value){
                                //   setState(() {
                                //   _email=value;
                                //   });
                                // },
                                decoration: InputDecoration(
                                  hintText: 'Email',
                                  hintStyle: WidgetApp.saladfiledtextstyle(),
                                  prefixIcon: Icon(Icons.email_outlined),
                                ),
                              ),
                              SizedBox(height: 10),
                              TextFormField(
                                controller: password,
                                validator: (value){
                                 if(value==null||value==''){
                                  return 'املاء الحقل ';
                                 }
                                 return null;
                                },
                                // onChanged: (Value){
                                //  setState(() {
                                //    _password=Value;
                                //  });
                                // },
                               obscureText: true,
                                decoration: InputDecoration(
                                  hintText: 'Password',
                                  hintStyle: WidgetApp.saladfiledtextstyle(),
                                  prefixIcon: Icon(Icons.password_outlined),
                                ),
                              ),
                              SizedBox(height: 20),
                              GestureDetector(
                                // onTap: () {
                                //    if (_formKey.currentState?.validate() ?? false) {
                                //    signUp();
                                //    }
                                // },
                                child: Material(
                                  elevation: 5.0,
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 8.0),
                                    width: 200,
                                    decoration: BoxDecoration(
                                      color: Color(0xffff5722),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Center(
                                        child: GestureDetector(
                                          onTap: ()async{
                                       if(_formKey.currentState!.validate()){
                                                                                    try {
  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email.text,
    password: password.text,
  );
    // Get the user information
                      User? user = credential.user;

                      if (user != null) {
                        // Save additional user information to Firestore
                        await _firestore.collection('users').doc(user.uid).set({
                          'email': user.email,
                          'name': username.text, // استخدام قيمة الاسم من النموذج
                        
                        });
  Navigator.of(context).pushReplacementNamed('bottombar');
                      }
} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    print('The password provided is too weak.');
    AwesomeDialog(
            context: context,
            dialogType: DialogType.info,
            animType: AnimType.rightSlide,
            title: 'Error',
            desc: 'The password provided is too weak',
            btnCancelOnPress: () {},
            btnOkOnPress: () {},
            ).show();
  } else if (e.code == 'email-already-in-use') {
    print('The account already exists for that email.');
    AwesomeDialog(
            context: context,
            dialogType: DialogType.info,
            animType: AnimType.rightSlide,
            title: 'Error',
            desc: 'The account already exists for that email.',
            btnCancelOnPress: () {},
            btnOkOnPress: () {},
            ).show();
  }
} catch (e) {
  print(e);
}
                                       }
                                          },
                                          child: Text(
                                            "Sign Up",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Poppins',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                             
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "AlReady Have an Account? ",
                          style: WidgetApp.saladfiledtextstyle(),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed('login');
                          },
                          child: Text(
                            "LogIn",
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 20.0,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                            ),
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
      ),
    );
  }
}
