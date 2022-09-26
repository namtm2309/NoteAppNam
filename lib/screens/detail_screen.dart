import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test2309/models/model.dart';

import '../controller/note_controller.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);
  static const routeName = "/note_detail";

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

var formatDate = new DateFormat('dd-MM-yyyy HH:mm');

class _DetailScreenState extends State<DetailScreen> {
  NoteController get _read => context.read<NoteController>();
  String get productId => ModalRoute.of(context)?.settings.arguments as String;
  NoteList? get loadedNote =>
      context.read<NoteController>().findById(productId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: (_read.isBlue == true) ? Colors.black87 : Colors.teal,
        title: Text('Detail'),
      ),
      body: Container(
        color: (_read.isBlue == true) ? Colors.black87 : Colors.white,
        constraints: BoxConstraints.expand(),
        width: double.infinity,
        // decoration: const BoxDecoration(
        //   image: DecorationImage(
        //       image: NetworkImage(
        //           'https://marketplace.canva.com/EAFJclBo2Bo/1/0/900w/canva-green-blue-illustration-green-hill-phone-wallpapaer-UIK163ESkKk.jpg'),
        //       fit: BoxFit.cover,
        //       opacity: 0.4),
        // ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${loadedNote?.title}',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: (_read.isBlue == true)
                            ? Colors.white
                            : Colors.black),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Date: ${formatDate.format(DateTime.parse(loadedNote!.id))}',
                    style: TextStyle(
                        color: (_read.isBlue == true)
                            ? Colors.white
                            : Colors.black),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Description: ${loadedNote?.description}',
                    style: TextStyle(
                        color: (_read.isBlue == true)
                            ? Colors.white
                            : Colors.black),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
