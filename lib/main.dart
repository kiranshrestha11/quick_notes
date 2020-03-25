import 'package:flutter/material.dart';
import 'package:quick_notes/screens/detail_screen.dart';
import 'package:quick_notes/screens/main_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Quick Notes",
      home: MainScreen(),
      theme: ThemeData(
        primaryColor: Colors.green,
        accentColor: Colors.deepOrangeAccent,
        //appBarTheme: AppBarTheme(),
      ),
      routes: {
        DetailScreen.routeName: (ctx) => DetailScreen(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => MainScreen());
      },
    );
  }
}
