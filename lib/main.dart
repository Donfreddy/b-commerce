import 'package:chat_screen/screens/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'Routes/Routes.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.initialRoute,
      onGenerateRoute: Routes.generateRoute,
      title: 'B. commerce',
      theme: ThemeData(
        fontFamily: "Monsera",
      ),
      home: SplashScreen(),
    );
  }
}