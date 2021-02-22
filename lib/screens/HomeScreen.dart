import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:chat_screen/screens/DetailScreen.dart';
import 'package:chat_screen/utils/List.dart';
import 'package:chat_screen/utils/ScreenHeightAndWidth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../utils/Colors.dart';
import '../utils/ScreenHeightAndWidth.dart';

class HomeScreen extends StatefulWidget {
  static const String id = "homeScreen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /////////Variables
  List imgList = [];
  List<Widget> imageSliders = [];

  /////////////////Methods
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imgList = [
      {
        "title": "Pull Levis",
        "subtitle": "40 % de reduction.",
        "image":
            'https://i.pinimg.com/236x/26/31/2b/26312b8c46519fc4e66a9685792fdc91.jpg',
      },
      {
        "title": "All-stars",
        "subtitle": "50 \$.",
        "image":
            'https://i.pinimg.com/236x/74/3a/d1/743ad1e4fd5f8bef56b937891d53dd45.jpg',
      },
      {
        "title": "Pull en jean",
        "subtitle": "5000 \$",
        "image":
            'https://i.pinimg.com/236x/5b/9f/3c/5b9f3c93313fccfd985dc98fb18bb6a9.jpg',
      },
    ];
    getCarouselElement();
  }

  getCarouselElement() {
    imageSliders = imgList.map((item) {
      return Container(
        margin: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: ClipRRect(
            child: Stack(
          children: <Widget>[
            Image.network(item['image'], fit: BoxFit.cover, width: 1000.0),
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
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  child: Padding(
                    padding: EdgeInsets.only(left: 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 70),
                          child: Text(
                            '${item['title']}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.end,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 70),
                          child: Text(
                            '${item['subtitle']}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                            textAlign: TextAlign.end,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  )),
            ),
          ],
        )),
      );
    }).toList();
  }

  ///////////Screens
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        leading: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Image.asset(
            "assets/icons/menu.png",
            height: 30,
          ),
        ),
        actions: [
          Icon(
            Icons.search,
            color: black,
            size: 32,
          ),
          SizedBox(
            width: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Badge(
              badgeContent: Text(
                '2',
                style: TextStyle(color: white),
              ),
              child: Icon(
                FontAwesomeIcons.shoppingBag,
                color: black,
              ),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: black,
                foregroundColor: black,
                backgroundImage: NetworkImage(
                    "https://i.pinimg.com/236x/92/90/0b/92900bbf3c745c032ba267ddb5dc00a9.jpg"),
              )),
          SizedBox(
            width: 5,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 2.0,
                viewportFraction: 0.9,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
              ),
              items: imageSliders,
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [

                  SizedBox(
                    height: 20,
                  ),
                  CategorySeparator(
                    title: 'Categories',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),


            ListOFCategories(
              categories: categories,
              size: MediaQuery.of(context).size,
            ),


            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [

                  SizedBox(
                    height: 20,
                  ),
                  CategorySeparator(
                    title: 'New Release',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            ListOFDress(
              articles: pull,
              size: MediaQuery.of(context).size,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  CategorySeparator(
                    title: 'New shirt',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            ListOFDress(
              articles: shirt,
              size: MediaQuery.of(context).size,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  CategorySeparator(
                    title: 'Shoes',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            ListOFDress(
              articles: shoes,
              size: MediaQuery.of(context).size,
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}

class CategorySeparator extends StatelessWidget {
  final String title;

  CategorySeparator({@required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(color: black, fontSize: 16, fontWeight: FontWeight.bold),
    );
  }
}

class ListOFDress extends StatelessWidget {
  final Size size;
  final List articles;

  ListOFDress({@required this.size, @required this.articles});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.white,
      ),
      width: size.width,
      height: 200,
      child: ListView.builder(
        itemCount: pull.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
              Navigator.of(context)
                  .pushNamed(DetailScreen.id);
            },
            child: Card(
              elevation: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(children: [
                  Container(
                    width: screenWidth(context) * 0.5,
                    child: Image.network(
                      '${articles[index]['image']}',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                      right: 10,
                      top: 10,
                      child: Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Icon(Icons.favorite,
                            color: (index % 2) == 0 ? orange : grey, size: 15),
                      )),
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
                      left: 10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${articles[index]['name']}',
                              style: TextStyle(
                                  color: white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)),
                        ],
                      )),
                  Positioned(
                      bottom: 10,
                      right: 10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${articles[index]['price']} \$',
                              style: TextStyle(
                                  color: orange,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold))
                        ],
                      )),
                ]),
              ),
            ),
          );
        },
      ),
    );
  }
}


class ListOFCategories extends StatelessWidget {
  final Size size;
  final List categories;

  ListOFCategories({@required this.size, @required this.categories});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.white,
      ),
      width: size.width,
      height: 70,
      child: ListView.builder(
        itemCount: pull.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
              Navigator.of(context)
                  .pushNamed(DetailScreen.id);
            },
            child: Card(
              elevation: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(children: [
                  Container(
                    width: screenWidth(context) * 0.5,
                    child: Image.network(
                      '${categories[index]['image']}',
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                        // bottom: 10,
                        // left: 10,
                      alignment: Alignment.centerLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('${categories[index]['name']}',
                                style: TextStyle(
                                    color: white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                          ],
                        )),
                  ),

                ]),
              ),
            ),
          );
        },
      ),
    );
  }
}