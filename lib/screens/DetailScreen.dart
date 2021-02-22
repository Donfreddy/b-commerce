import 'package:chat_screen/Components/CustumButton.dart';
import 'package:chat_screen/utils/ScreenHeightAndWidth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../utils/Colors.dart';

class DetailScreen extends StatefulWidget {
  static const String id = 'DetailScreen';

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        leading: Icon(
          Icons.arrow_back_ios,
          size: 30,
          color: black,
        ),
        title: Text(
          "Preview",
          style: TextStyle(color: black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: screenWidth(context),
                  height: screenHeight(context) * 0.35,
                  child: Image.network(
                    'https://i.pinimg.com/236x/7d/e6/c8/7de6c8856a10681b5cdf3cef0ff139c6.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(200, 0, 0, 0),
                          Color.fromARGB(0, 0, 0, 0)
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 45.0, horizontal: 45.0),
                  ),
                ),
                Positioned(
                    bottom: 10,
                    left: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('\$ ',
                            style: TextStyle(
                                color: white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold)),
                        Text('299',
                            style: TextStyle(
                                color: white,
                                fontSize: 40,
                                fontWeight: FontWeight.bold)),
                      ],
                    )),
                Positioned(
                  bottom: 10,
                  right: 20,
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: black,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      heightFactor: 50,
                      widthFactor: 50,
                      child:
                          Icon(FontAwesomeIcons.heart, color: white, size: 20),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Afro shoes 2.0',
                      style: TextStyle(
                          color: black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Description :',
                      style: TextStyle(
                          color: grey,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                      style: TextStyle(
                          color: grey,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: CustomButton(
                  pressEvent: () {
                    /// event after click
                  },
                  buttonText: " Add to cart ",
                  buttonColor: black,
                  textColor: white),
            )
          ],
        ),
      ),
    );
  }
}
