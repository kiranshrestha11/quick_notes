import 'package:flutter/material.dart';
import 'package:quick_notes/model/notes.dart';
import 'package:quick_notes/widgets/new_noteslist.dart';
import 'package:quick_notes/widgets/notes_list.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Notes> _userNotes = [];

  void _addNote(String title, String description) {
    Notes newNotes = new Notes(
      id: DateTime.now().toString(),
      title: title,
      description: description,
    );
    setState(() {
      _userNotes.add(newNotes);
    });
  }

  void showBtSheet(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (bCtx) {
          return NewNoteList(_addNote);
        });
  }

  void _deleteNote(String id) {
    setState(() {
      _userNotes.removeWhere((tx) {
        return tx.id == id;
      });
      //  _userNotes.remove(id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final pageBody = Container(
      child: NotesList(_userNotes, _deleteNote),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Quick Notes',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w300,
          ),
          textAlign: TextAlign.center,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              showBtSheet(context);
            },
          ),
          //Container(),
        ],
      ),
      body: pageBody,
    );
  }
}
