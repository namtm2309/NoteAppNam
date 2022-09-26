import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/note_controller.dart';
import '../models/model.dart';

class DialogEdit extends StatefulWidget {
  final int index;
  const DialogEdit({Key? key, required this.index}) : super(key: key);

  @override
  State<DialogEdit> createState() => _DialogFormState();
}

class _DialogFormState extends State<DialogEdit> {
  String get productId => ModalRoute.of(context)?.settings.arguments as String;
  NoteController get _read => context.read<NoteController>();
  NoteList? get _readmodel => context.read<NoteList>();
  NoteController get _watch => context.watch<NoteController>();

  final _titleText = TextEditingController();
  final _DescriptionText = TextEditingController();

  late String title = _titleText.text;
  late String description = _DescriptionText.text;

  @override
  Widget build(BuildContext context) {
    void updateNote() {
      _read.editItem(widget.index, title, description);
    }

    return AlertDialog(
      backgroundColor: (_read.isBlue == true) ? Colors.black : Colors.white,
      title: Text(
        'Update',
        style: TextStyle(
            color: (_read.isBlue == true) ? Colors.white : Colors.black),
      ),
      content: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: _titleText,
              style: TextStyle(
                  color: (_read.isBlue == true) ? Colors.white : Colors.black),
              decoration: InputDecoration(
                  labelText: 'Title',
                  hintText: 'Title',
                  labelStyle: TextStyle(
                      color:
                          (_read.isBlue == true) ? Colors.white : Colors.black),
                  hintStyle: TextStyle(
                      color:
                          (_read.isBlue == true) ? Colors.white : Colors.black),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: (_read.isBlue == true)
                            ? Colors.white
                            : Colors.black),
                  )),
            ),
            TextField(
              controller: _DescriptionText,
              style: TextStyle(
                  color: (_read.isBlue == true) ? Colors.white : Colors.black),
              decoration: InputDecoration(
                  labelText: 'Description',
                  hintText: 'Description',
                  labelStyle: TextStyle(
                      color:
                          (_read.isBlue == true) ? Colors.white : Colors.black),
                  hintStyle: TextStyle(
                      color:
                          (_read.isBlue == true) ? Colors.white : Colors.black),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: (_read.isBlue == true)
                            ? Colors.white
                            : Colors.black),
                  )),
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
      actions: [
        Center(
          child: RaisedButton(
            onPressed: () {
              updateNote();
              Navigator.pop(context);
            },
            child: Text('Update'),
          ),
        )
      ],
    );
  }
}
