import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  static const String routeName = "/note_screen";

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  String selectedNoteTitle;
  String selectedNoteDes;

  @override
  Widget build(BuildContext context) {
    final routeAgrs = ModalRoute.of(context).settings.arguments as Map;
    selectedNoteTitle = routeAgrs['title'];
    selectedNoteDes = routeAgrs['des'];

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedNoteTitle,
            maxLines: 2,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300)),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text(selectedNoteDes,
              maxLines: 3,
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.w400)),
        ),
      ),
    );
    ;
  }
}
