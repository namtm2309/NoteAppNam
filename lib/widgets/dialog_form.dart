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
  final _idText = TextEditingController();
  final _titleText = TextEditingController();
  final _DescriptionText = TextEditingController();

  late String id = _idText.text;
  late String title = _titleText.text;
  late String description = _DescriptionText.text;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: (_read.isBlue == true) ? Colors.black : Colors.white,
      title: Text(
        'Add',
        style: TextStyle(
            color: (_read.isBlue == true) ? Colors.white : Colors.black),
      ),
      content: SingleChildScrollView(
        child: Column(
          children: [
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "nhập đủ nào!";
                }
              },
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
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "nhập đủ nào!";
                }
              },
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
              if (_titleText.text.isEmpty|| _DescriptionText.text.isEmpty){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('hãy nhập đủ thông tin !')));
              }else{
                _read.addItem(title, description);
                Navigator.pop(context);
              }

            },
            child: Text('Add'),
          ),
        )
      ],
    );
  }
}
