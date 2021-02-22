import 'package:chat_screen/Components/CustumButton.dart';
import 'package:chat_screen/api/http_client.dart';
import 'package:chat_screen/screens/SignUpScreen.dart';
import 'package:flutter/cupertino.dart';

import '../utils/Colors.dart';
import 'package:flutter/material.dart';
import '../utils/ScreenHeightAndWidth.dart';
import 'GeneralPage.dart';

class SignInScreen extends StatefulWidget {
  static const String id = "SignInScreen";

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  ///////////////Variable Section
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  final _formKey = GlobalKey<FormState>();
  bool hidePassword = true; // set visibility of the password

  //test
  String username, password;
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
              image: AssetImage('assets/images/bgLogin.jpeg'),
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
                    ("Welcome back."),
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
                                color: white, fontWeight: FontWeight.bold),
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

                              // login user
                              // var data = {
                              //   'username': username,
                              //   'password': password
                              // };
                              // var response = await _client
                              //     .postRequest("/auth/login", data: data);

                              // print(response);
                              // print(response['user']);
                              // print(response['jwt']);

                              // TODO: Save user information in local storage

                              Navigator.of(context).pushNamed(GeneralScreen.id);
                            }
                          },
                          buttonText: "Login",
                          buttonColor: white,
                          textColor: black,
                        ),
                        SizedBox(
                          height: screenHeight(context) * 0.03,
                        ),
                        FlatButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacementNamed(SignUpScreen.id);
                          },
                          child: RichText(
                            text: TextSpan(
                              style: TextStyle(fontSize: 10),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'You do not have an account? ',
                                ),
                                TextSpan(
                                  text: 'Create an account!',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: orange,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
