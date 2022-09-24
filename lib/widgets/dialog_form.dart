import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/note_controller.dart';
import '../models/model.dart';

class DialogForm extends StatefulWidget {
  const DialogForm({Key? key}) : super(key: key);

  @override
  State<DialogForm> createState() => _DialogFormState();
}

class _DialogFormState extends State<DialogForm> {
  NoteController get _read => context.read<NoteController>();
  NoteList? get _readmodel => context.read<NoteList>();
  NoteController get _watch => context.watch<NoteController>();

  final _titleText = TextEditingController();
  final _DescriptionText = TextEditingController();

  late String title = _titleText.text;
  late String description = _DescriptionText.text;

  @override
  Widget build(BuildContext context) {


    return AlertDialog(
        title: Text('Add'),
        content: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _titleText,
                decoration: InputDecoration(
                  labelText: 'Title',
                  hintText: 'Title',
                ),
              ),
              TextField(
                controller: _DescriptionText,
                decoration: InputDecoration(
                  labelText: 'Description',
                  hintText: 'Description',
                ),
              ),

              SizedBox(
                height: 15,
              ),


            ],
          ),
        ),
        actions: [
          RaisedButton(
            onPressed: () {
              _read.addItem(title, description);
              Navigator.pop(context);
            },
            child: Text('Add'),
          )
      ],
    );
  }
}
