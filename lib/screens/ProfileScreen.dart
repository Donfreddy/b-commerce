import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_screen/models/user.dart';
import 'package:chat_screen/utils/ScreenHeightAndWidth.dart';
import '../utils/Colors.dart';
import 'package:chat_screen/api/http_client.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:octo_image/octo_image.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  //////////////////////////////////////////////////////////Variable
  File _pickedImage;
  Future getSimilarFuture;
  String token;

  var id = 0;

  //test
  String myId = '60322f767654e23ddfcafc7d';
  final _client = HttpClient();

  ///////////////////////////////////////////////////////Method
  ///

  Future<User> getUser() async {
    var response = await _client.getRequest("/users/$myId");

    dynamic userJson = response['data'];

    print("====================> User response");
    print(response);
    print("====================> User data");
    print(userJson);

    return User.fromJson(userJson);
  }

  @override
  void initState() {
    getUser();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  changePhoto() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            // ListTile(
            //   title: Text("Pick from Gallery"),
            //   onTap: () {
            //     _loadPicker(ImageSource.gallery);
            //   },
            // ),
            // ListTile(
            //   title: Text("Take a pictuer"),
            //   onTap: () {
            //     _loadPicker(ImageSource.camera);
            //   },
            // )
          ],
        ),
      ),
    );
  }

  // _loadPicker(ImageSource source) async {
  //   File picked = await ImagePicker.pickImage(source: source, imageQuality: 60);
  //   if (picked != null) {
  //     _cropImage(picked);
  //   }
  //   Navigator.pop(context);
  // }

  // _cropImage(File picked) async {
  //   File cropped = await ImageCropper.cropImage(
  //     androidUiSettings: AndroidUiSettings(
  //       statusBarColor: Colors.red,
  //       toolbarColor: Colors.red,
  //       toolbarTitle: "Crop Image",
  //       toolbarWidgetColor: Colors.white,
  //     ),
  //     sourcePath: picked.path,
  //     aspectRatioPresets: [
  //       CropAspectRatioPreset.square,
  //       CropAspectRatioPreset.ratio3x2,
  //       CropAspectRatioPreset.original,
  //       CropAspectRatioPreset.ratio4x3,
  //       CropAspectRatioPreset.ratio16x9
  //     ],
  //     maxWidth: 800,
  //   );
  //   if (cropped != null) {
  //     setState(() {
  //       _pickedImage = cropped;
  //       api.uploadImage(
  //           file: cropped, context: context, profilBloc: profilBloc);
  //     });
  //   }
  // }

  //////////////////////////////////////////// SCREEN

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Stack(
        children: <Widget>[
          CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Colors.white,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Profile",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: black),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Icon(
                        FontAwesomeIcons.pen,
                        color: black,
                      ),
                    )
                  ],
                ),
                expandedHeight: 280,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: Center(
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            height: 45,
                          ),
                          Container(
                              height: 140,
                              width: 140,
                              child: Stack(
                                children: [
                                  OctoImage.fromSet(
                                    fit: BoxFit.cover,
                                    image: CachedNetworkImageProvider(
                                        "https://i.pinimg.com/236x/92/90/0b/92900bbf3c745c032ba267ddb5dc00a9.jpg"),
                                    octoSet: OctoSet.circleAvatar(
                                        backgroundColor: null,
                                        text: CircularProgressIndicator(
                                          backgroundColor: Colors.white,
                                        )),
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Align(
                                      alignment: Alignment.bottomRight,
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
                                          child: Icon(FontAwesomeIcons.camera,
                                              color: white, size: 20),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Ndeme yvan',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Card(
                            child: Container(
                          width: screenWidth(context),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  "Email",
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "ndemeyvan@gmail.com",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: black),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Divider(
                                  height: 2,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Phone",
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "237 - 656209008",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: black),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Divider(
                                  height: 2,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Password",
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "*******************",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: black),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                              ],
                            ),
                          ),
                        )),
                        //second section
                        GestureDetector(
                          onTap: () {},
                          child: Card(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 15,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Settings",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            color: black),
                                      ),
                                      Icon(FontAwesomeIcons.angleRight)
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Card(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 15,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Products List",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            color: black),
                                      ),
                                      Icon(FontAwesomeIcons.angleRight)
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Card(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 15,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "My shypping Adresses",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            color: black),
                                      ),
                                      Icon(FontAwesomeIcons.angleRight)
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                              ],
                            ),
                          ),
                        ),

                        GestureDetector(
                          onTap: () {},
                          child: Card(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 15,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Place a command",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            color: black),
                                      ),
                                      Icon(FontAwesomeIcons.angleRight)
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Card(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 15,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "My Order",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            color: black),
                                      ),
                                      Icon(FontAwesomeIcons.angleRight)
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ]),
              )
            ],
          ),
        ],
      ),
    ));
  }
}
