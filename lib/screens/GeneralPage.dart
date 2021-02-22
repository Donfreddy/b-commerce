import 'package:chat_screen/blocs/product_bloc.dart';
import 'package:cuberto_bottom_bar/cuberto_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'CartScreen.dart';
import 'HomeScreen.dart';
import 'ProfileScreen.dart';
import 'WishListScreen.dart';

class GeneralScreen extends StatefulWidget {
  static const String id = "GeneralScreen";

  GeneralScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _GeneralScreenState createState() => _GeneralScreenState();
}

class _GeneralScreenState extends State<GeneralScreen> {
  /////////////////////////Variable

  int currentPage;
  Color currentColor = Colors.deepPurple;
  Color inactiveColor = Colors.black;
  PageController tabBarController;
  List<Tabs> tabs = new List();

  ProductBloc _bloc;

/////////////////////////Methods

  @override
  void initState() {
    super.initState();
    _bloc = ProductBloc();

    currentPage = 0;
    tabs.add(Tabs(
      FontAwesomeIcons.home,
      "Home",
      Colors.blue,
      getGradient(Colors.white),
    ));
    tabs.add(Tabs(FontAwesomeIcons.heart, "Wish list", Colors.blue,
        getGradient(Colors.white)));
    tabs.add(Tabs(FontAwesomeIcons.shoppingCart, "Cart", Colors.blue,
        getGradient(Colors.white)));
    tabs.add(Tabs(FontAwesomeIcons.user, "Profile", Colors.blue,
        getGradient(Colors.white)));
    tabBarController = new PageController(initialPage: 0);
  }

  Future<bool> _back() async {
    // constant.exitApp(context);
  }

  @override
  void dispose() {
    tabBarController.dispose();

    super.dispose();
  }

/////////////////////////Screen

  @override
  Widget build(BuildContext context) {
    Widget tabView({int destinationIndex}) {
      return Container(
          decoration: BoxDecoration(color: tabs[currentPage].color),
          child: InkWell(
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    tabs[currentPage].title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Click here to Change the tab To " +
                        tabs[destinationIndex].title,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 14.0),
                  ),
                ],
              )),
              onTap: () {
                setState(() {
                  currentPage = destinationIndex;
                  tabBarController.jumpToPage(currentPage);
                });
              }));
    }

    return new WillPopScope(
        onWillPop: _back,
        child: Scaffold(
          body: PageView(
              controller: tabBarController,
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                HomeScreen(),
                WishListScreen(),
                CartScreen(),
                ProfileScreen(),
                tabView(destinationIndex: 2)
              ]),
          bottomNavigationBar: CubertoBottomBar(
            key: Key("BottomBar"),
            inactiveIconColor: inactiveColor,
            tabStyle: CubertoTabStyle.STYLE_FADED_BACKGROUND,
            selectedTab: currentPage,
            tabs: tabs
                .map((value) => TabData(
                    key: Key(value.title),
                    iconData: value.icon,
                    title: value.title,
                    tabColor: value.color,
                    tabGradient: value.gradient))
                .toList(),
            onTabChangedListener: (position, title, color) {
              setState(() {
                currentPage = position;
                tabBarController.jumpToPage(position);
              });
            },
          ),
        ));
  }
}

class Tabs {
  final IconData icon;
  final String title;
  final Color color;
  final Gradient gradient;
  Tabs(this.icon, this.title, this.color, this.gradient);
}

getGradient(Color color) {
  return LinearGradient(
      colors: [color.withOpacity(0.5), color.withOpacity(0.1)],
      stops: [0.0, 0.7]);
}
