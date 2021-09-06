import 'package:chatit/User/userHome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:connectivity/connectivity.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'register.dart';
import 'package:http/http.dart'as http;

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  
  // ignore: deprecated_member_use
  FirebaseMessaging _firebaseMassging =FirebaseMessaging();
  String userToken;
  void getToken() async{
    userToken = await _firebaseMassging.getToken();
  }
  Color defaultColor = Colors.white70;
  String email, password;
  var _formKey = GlobalKey<FormState>();
  var emailVaidator = MultiValidator([
    EmailValidator(errorText: 'email not valid'),
    RequiredValidator(errorText: 'email is required'),
  ]);
  var passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'password is required'),
    MinLengthValidator(8, errorText: 'password must be at least 8 digits long'),
    PatternValidator(r'(?=.?[#?!@$%^&-])',
        errorText: 'passwords must have at least one special character')
  ]);
  var _auth = FirebaseAuth.instance;
  bool visible = false;
  bool spinner = false;

  @override
  void initStat(){
    getToken();
    print('$userToken ***************************************');
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Text(
          'Log In',
          style: TextStyle(color: defaultColor),
        ),
        centerTitle: true,
      ),
      body: Builder(
        builder: (context) => ModalProgressHUD(
          inAsyncCall: spinner,
          child: ListView(
            padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
            children: [
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Text(
                        'Enter Your E-Mail',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.015,
                      ),
                      TextFormField(
                        onChanged: (val) {
                          email = val;
                        },
                        validator: emailVaidator,
                        decoration: InputDecoration(
                          hintText: 'enter your email',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      Text(
                        'Enter Your Password',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.015,
                      ),
                      TextFormField(
                        onChanged: (val) {
                          password = val;
                        },
                        validator: passwordValidator,
                        /*(validate){
                          if(validate.isEmpty){
                            return 'password is required';
                          }else if(validate.length < 8){
                            return 'password length at least 8 characters';
                          }
                          return null;
                        },*/
                        decoration: InputDecoration(
                          hintText: 'enter your password',
                          border: OutlineInputBorder(),
                          suffixIcon: IconButton(
                            icon: (visible)
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility),
                            onPressed: () {
                              setState(() {
                                visible = !visible;
                              });
                            },
                          ),
                        ),
                        keyboardType: TextInputType.text,
                        obscureText: (visible) ? false : true,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                    ],
                  )),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.03),
                child: FlatButton(
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      print('successful');
                      var connectivityResult =
                          await (Connectivity().checkConnectivity());
                      if (connectivityResult != ConnectivityResult.mobile &&
                          connectivityResult != ConnectivityResult.wifi) {
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text('No internet connection'),
                          backgroundColor: Colors.redAccent,
                        ));
                      } else {
                        try {
                          setState(() {
                            spinner = true;
                          });
                          await _auth.signInWithEmailAndPassword(
                              email: email, password: password);
                          _formKey.currentState.reset();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => userHome(),
                              ));
                          setState(() {
                            spinner = false;
                          });
                        } catch (e) {
                          setState(() {
                            spinner = false;
                          });
                          if (e is FirebaseAuthException) {
                            print(e.code);
                            if (e.code == 'user-not-found') {
                              Scaffold.of(context).showSnackBar(SnackBar(
                                content: Text('email not found'),
                                backgroundColor: Colors.redAccent,
                              ));
                            } else if (e.code == 'wrong-password') {
                              Scaffold.of(context).showSnackBar(SnackBar(
                                content: Text('wrong password'),
                                backgroundColor: Colors.redAccent,
                              ));
                            }
                          }
                        }
                      }
                    }
                  },
                  child: Text(
                    'LogIn',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                  color: Colors.white12,
                  padding: EdgeInsets.all(20),
                ),
              ),
              InkWell(
                onTap: () {
                  _formKey.currentState.reset();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Register()));
                },
                child: Container(
                    margin: EdgeInsets.all(20),
                    child: Text(
                      'Don\'t have account !',
                      style: TextStyle(color: Colors.blueAccent, fontSize: 16),
                      textAlign: TextAlign.center,
                    )),
              )
            ],
          ),
        ),
      ),
    );
    ;
  }
}
