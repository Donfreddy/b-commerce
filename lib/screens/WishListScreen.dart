import 'package:chat_screen/utils/List.dart';
import 'package:flutter/cupertino.dart';

import '../utils/Colors.dart';
import 'package:chat_screen/utils/ScreenHeightAndWidth.dart';
import 'package:flutter/material.dart';

import 'DetailScreen.dart';

class WishListScreen extends StatefulWidget {
  static const String id = "WishListScreen";

  @override
  _WishListScreenState createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        centerTitle: true,
        leading: Container(),
        title: Text(
          "Wish List",
          style: TextStyle(color: black, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        itemCount: pull.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Center(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 0),
            child: Card(
              child: Container(
                width: screenWidth(context),
                padding: EdgeInsets.symmetric(horizontal: 20) +
                    EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: (){
                            //to to detail page
                            Navigator.of(context)
                                .pushNamed(DetailScreen.id);
                          },
                          child: Container(
                            height: 90,
                            width: 90,
                            child: Image.network(
                              pull[index]['image'],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                pull[index]['name'],
                                style: TextStyle(color: black, fontSize: 16,fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'size: M',
                                style: TextStyle(color: black, fontSize: 13),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '\$ ${pull[index]['price']}',
                                style: TextStyle(color: black, fontSize: 13),
                              ),
                            ],
                          ),
                        ),
                        FlatButton(
                            onPressed: () {
                              //remove this item to wishlist
                            },
                            child: Text(
                              "Remove",
                              style: TextStyle(
                                  color: orange, fontWeight: FontWeight.bold),
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ));
        },
      ),
    );
  }
}
