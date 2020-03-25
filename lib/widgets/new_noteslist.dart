import 'package:flutter/material.dart';

class NewNoteList extends StatefulWidget {
  final Function _addNX;
  NewNoteList(this._addNX);
  @override
  _NewNoteListState createState() => _NewNoteListState();
}

class _NewNoteListState extends State<NewNoteList> {
  final titleController = new TextEditingController();
  final desController = new TextEditingController();
  void addNote() {
    String title = titleController.text;
    String description = desController.text;
    if (title.isEmpty || description.isEmpty) {
      return;
    } else {
      widget._addNX(title, description);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Padding(
          padding: EdgeInsets.only(
            left: 10.0,
            right: 10,
            top: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  labelText: "Note Title",
                ),
                controller: titleController,
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                maxLines: 1,
                decoration: InputDecoration(labelText: "Note Description"),
                controller: desController,
              ),
              SizedBox(
                height: 30,
              ),
              RaisedButton(
                splashColor: Colors.greenAccent,
                elevation: 10,
                child: Text(
                  "Add Note",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                onPressed: () {
                  addNote();
                },
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
