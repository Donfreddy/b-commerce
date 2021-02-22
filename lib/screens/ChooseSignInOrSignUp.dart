import 'package:chat_screen/Components/CustumButton.dart';
import 'package:chat_screen/screens/SignUpScreen.dart';
import 'package:chat_screen/screens/SigninScreen.dart';
import 'package:flutter/material.dart';
import '../utils/Colors.dart';

class ChooseSignInOrSignUp extends StatefulWidget {
  static const String id = "ChooseSignInOrSignUpScreen";

  ChooseSignInOrSignUp({Key key}) : super(key: key);

  @override
  _ChooseSignInOrSignUpState createState() => _ChooseSignInOrSignUpState();
}

class _ChooseSignInOrSignUpState extends State<ChooseSignInOrSignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/choosebackground.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          //loverlay
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment(
                    Alignment.bottomCenter.x,
                    1 - Alignment.bottomCenter.y,
                  ),
                  colors: [white, Colors.black.withOpacity(0.2)],
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height / 2.6),
              Center(
                child: Text(
                  "B-commerce",
                  style: TextStyle(
                      fontSize: 45.0,
                      color: Colors.white60,
                      letterSpacing: 2,
                      fontFamily: "Pacifico"),
                ),
              ),
              SizedBox(height: 70.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  "All Your Favorite Brands \nAt One Place",
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  "All Your Favorite Brands At One Place\nBest Online Shop 2020",
                  style: TextStyle(
                    fontSize: 13.0,
                    color: Colors.white60,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Spacer(),
              Center(
                  child: CustomButton(
                      textColor: black,
                      buttonColor: white,
                      pressEvent: () {
                        Navigator.of(context)
                            .pushNamed(SignInScreen.id);
                      },
                      buttonText: 'Sign in')),
              SizedBox(height: 10.0),
              Center(
                  child: CustomButton(
                      textColor: white,
                      buttonColor: black,
                      pressEvent: () {
                        Navigator.of(context)
                            .pushReplacementNamed(SignUpScreen.id);
                      },
                      buttonText: 'Sign up')),
              SizedBox(height: 30.0),
            ],
          )
        ],
      ),
    );
  }
}
