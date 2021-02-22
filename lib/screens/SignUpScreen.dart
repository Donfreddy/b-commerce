import 'dart:convert';

import 'package:chat_screen/Components/CustumButton.dart';
import 'package:chat_screen/api/http_client.dart';
import 'package:chat_screen/models/user.dart';
import 'package:chat_screen/screens/SigninScreen.dart';

import '../utils/Colors.dart';
import 'package:flutter/material.dart';
import '../utils/ScreenHeightAndWidth.dart';

class SignUpScreen extends StatefulWidget {
  static const String id = "SignUpScreen";

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  ///////////////Variable Section
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  final _formKey = GlobalKey<FormState>();
  bool hidePassword = true; // set visibility of the password

  //test
  String username, email, password;
  final _client = HttpClient();

  ///////////////Methods

  ////////Screen
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: screenHeight(context),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/registrationBb.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    ("Create Account."),
                    style: TextStyle(
                        color: white,
                        fontWeight: FontWeight.bold,
                        fontSize: 45,
                        fontFamily: "Pacifico"),
                  ),
                  SizedBox(
                    height: screenHeight(context) * 0.05,
                  ),
                  Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            style: TextStyle(
                                color: white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                            decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: white),
                                  //  when the TextFormField in unfocused
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: white),
                                  //  when the TextFormField in focused
                                ),
                                icon: Icon(
                                  Icons.person,
                                  color: white,
                                ),
                                hintText: 'Enter your username',
                                hintStyle: new TextStyle(
                                    color: white, fontWeight: FontWeight.bold)
                                // labelText: 'User name',
                                ),
                            onChanged: (val) {
                              setState(() {
                                username = val;
                              });
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter your username';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: screenHeight(context) * 0.03,
                          ),
                          TextFormField(
                            style: TextStyle(
                                color: white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                            decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: white),
                                  //  when the TextFormField in unfocused
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: white),
                                  //  when the TextFormField in focused
                                ),
                                icon: Icon(
                                  Icons.email,
                                  color: white,
                                ),
                                hintText: 'Enter your email',
                                hintStyle: new TextStyle(
                                    color: white, fontWeight: FontWeight.bold)
                                // labelText: 'User name',
                                ),
                            onChanged: (val) {
                              setState(() {
                                email = val;
                              });
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Please enter your email address";
                              }
                              final emailExp = RegExp(
                                  r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?");
                              if (!emailExp.hasMatch(value)) {
                                return "Invalid address";
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: screenHeight(context) * 0.03,
                          ),
                          TextFormField(
                            style: TextStyle(
                                color: white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                            decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: white),
                                  //  when the TextFormField in unfocused
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: white),
                                  //  when the TextFormField in focused
                                ),
                                icon: Icon(Icons.lock, color: white),
                                hintText: 'Enter your password',
                                hintStyle: new TextStyle(
                                    color: white, fontWeight: FontWeight.bold),
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      hidePassword = !hidePassword;
                                    });
                                  },
                                  child: hidePassword == true
                                      ? Icon(
                                          Icons.visibility_off,
                                          size: 20,
                                          color: white,
                                        )
                                      : Icon(
                                          Icons.visibility,
                                          size: 20,
                                          color: white,
                                        ),
                                )),
                            obscureText: hidePassword,
                            onChanged: (val) {
                              setState(() {
                                password = val;
                              });
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: screenHeight(context) * 0.1,
                          ),
                          CustomButton(
                              pressEvent: () async {
                                if (_formKey.currentState.validate()) {
                                  // If the form is valid, display a Snackbar.
                                  // Scaffold.of(context).showSnackBar(SnackBar(
                                  //     content: Text('Processing Data')));

                                  // register user
                                  var userData = jsonEncode({
                                    'username': username,
                                    'email': email,
                                    'password': password
                                  });

                                  print(userData);

                                  var response = await _client.postRequest(
                                    "/auth/register",
                                    data: userData,
                                  );

                                  print(response);
                                  print(response['user']);
                                  print(response['jwt']);

                                  // TODO: Save user information in local storage
                                }
                              },
                              buttonText: "Register",
                              buttonColor: black,
                              textColor: white),
                          SizedBox(
                            height: screenHeight(context) * 0.03,
                          ),
                          FlatButton(
                            onPressed: () {
                              //goto sign up page
                              Navigator.of(context)
                                  .pushReplacementNamed(SignInScreen.id);
                            },
                            child: RichText(
                              text: TextSpan(
                                style: TextStyle(fontSize: 10),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Already have an account? ',
                                  ),
                                  TextSpan(
                                      text: 'Sign in !',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: orange)),
                                ],
                              ),
                            ),
                          )
                        ],
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
