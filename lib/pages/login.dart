import 'package:appstore1/pages/forgetpassword.dart';
import 'package:appstore1/widget/widget_support.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
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
                )),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 3),
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
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
                    )),
                    Container(
                      height: 10,
                    ),

                    Material(
                      borderRadius: BorderRadius.circular(20),
                      elevation: 5.0,
                      child: Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 2,
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Container(
                                height: 30,
                              ),
                              Text(
                                "Login",
                                style: WidgetApp.headlinefiledtextstyle(),
                              ),
                              Container(
                                height: 20,
                              ),
                              TextFormField(
                                controller: email,
                                 validator: (value){
                                if(value==null ||value==''){
                                return 'املاء الحقل ';
                                }
                                return null;
                                },
                                decoration: InputDecoration(
                                    hintText: 'Email',
                                    hintStyle: WidgetApp.saladfiledtextstyle(),
                                    prefixIcon: Icon(Icons.email_outlined)),
                              ),
                              Container(
                                height: 20,
                              ),
                              TextFormField(
                                controller: password,
                                   validator: (value){
                                if(value==null ||value==''){
                                return 'املاء الحقل ';
                                }
                                return null;
                                },
                                obscureText: true,
                                decoration: InputDecoration(
                                    hintText: 'Password',
                                    hintStyle: WidgetApp.saladfiledtextstyle(),
                                    prefixIcon: Icon(Icons.password_outlined)),
                              ),
                              Container(
                                height: 20,
                              ),
                             
                                InkWell(
                                  onTap: (){
                                    Navigator.of(context).pushNamed('forgetpassword');
                                  },
                                  child: Container(
                                 
                                  
                                    alignment: Alignment.topRight,
                                    child: Text(
                                      "Forget Your Password?",
                                      style: WidgetApp.saladfiledtextstyle(),
                                    ),
                                  ),
                                ),
                              
                              Container(
                                height: 30,
                              ),
                              Material(
                                elevation: 5.0,
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 8.0),
                                  width: 200,
                                  decoration: BoxDecoration(
                                      color: Color(0xffff5722),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Center(
                                    child: GestureDetector(
                                        onTap: () async {
                                          if(_formKey.currentState!.validate()){
                                            try {
                                            final credential =
                                                await FirebaseAuth
                                                    .instance
                                                    .signInWithEmailAndPassword(
                                                        email: email.text,
                                                        password:
                                                            password.text);
                                            Navigator.of(context)
                                                .pushReplacementNamed(
                                                    'bottombar');
                                          } on FirebaseAuthException catch (e) {
                                            if (e.code == 'user-not-found') {
                                              print(
                                                  'No user found for that email.');
                                              AwesomeDialog(
                                                context: context,
                                                dialogType: DialogType.error,
                                                animType: AnimType.rightSlide,
                                                title: 'Error',
                                                desc:'No user found for that email.',
                                                btnCancelOnPress: () {},
                                                btnOkOnPress: () {},
                                              ).show();
                                            } else if (e.code ==
                                                'wrong-password') {
                                              print(
                                                  'Wrong password provided for that user.');
                                                   AwesomeDialog(
                                                context: context,
                                                dialogType: DialogType.info,
                                                animType: AnimType.rightSlide,
                                                title: 'Error',
                                                desc:'Wrong password provided for that user.',
                                                btnCancelOnPress: () {},
                                                btnOkOnPress: () {},
                                              ).show();
                                            }
                                          }
                                          }
                                        },
                                          child: Text(
                                            "LOGIN",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Poppins'),
                                          ),
                                        ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 30,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text(
                        "Dont Have an Account? ",
                        style: WidgetApp.saladfiledtextstyle(),
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed('signup');
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.green,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold),
                          ))
                    ])
                  ],
                ),
              )
            ],
          ),
        ),
  
    );
  }
}
