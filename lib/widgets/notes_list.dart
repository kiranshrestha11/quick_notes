import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:quick_notes/model/notes.dart';
import 'package:quick_notes/screens/detail_screen.dart';

// ignore: must_be_immutable
class NotesList extends StatefulWidget {
  final List<Notes> _notes;
  final Function _deleteNote;
  DateTime dateTime;

  NotesList(this._notes, this._deleteNote);

  @override
  _NotesListState createState() => _NotesListState();
}

class _NotesListState extends State<NotesList> {
  DateTime getDateTime(int i) {
    DateTime noteDate = DateTime.parse(widget._notes[i].id);
    return noteDate;
  }

  @override
  Widget build(BuildContext context) {
    return widget._notes.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constraints) {
              return Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(40),
                //margin: EdgeInsets.only(top: 140, left: 50),
                child: Text(
                  "EMPTY",
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
              );
            },
          )
        : ListView.builder(
            itemCount: widget._notes.length,
            itemBuilder: (ctx, i) {
              return Dismissible(
                key: ValueKey(widget._notes[i].id),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  widget._deleteNote(widget._notes[i].id);
                },
                background: Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: 10),
                    margin: EdgeInsets.symmetric(vertical: 3.5),
                    color: Colors.red,
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                      size: 34,
                    )),
                child: InkWell(
                  onTap: () {
                    // selectedNote(context);
                    Navigator.pushNamed(ctx, DetailScreen.routeName,
                        arguments: {
                          "title": widget._notes[i].title,
                          "des": widget._notes[i].description
                        });
                  },
                  child: Card(
                    elevation: 4,
                    child: ListTile(
                      leading: Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Text(
                          DateFormat.yMd().format(getDateTime(i)),
                          style: TextStyle(fontSize: 10),
                          maxLines: 2,
                        ),
                      ),
                      title: Text(widget._notes[i].title),
                      subtitle: Text(widget._notes[i].description),
                    ),
                  ),
                ),
              );
            });
  }
}
