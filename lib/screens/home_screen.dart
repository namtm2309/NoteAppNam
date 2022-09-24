

import 'package:flutter/material.dart';

import '../controller/note_controller.dart';
import '../models/model.dart';
import 'package:provider/provider.dart';
import '../widgets/dialog_form.dart';


enum FilterOptions { Az, newest }

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NoteController get _watch => context.watch<NoteController>();
  NoteList? get _watchList => context.watch<NoteList>();
  NoteController get _read => context.read<NoteController>();
  var _showAz = false;
  var _showNewest = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text('Home'),
          actions: <Widget>[
            PopupMenuButton<FilterOptions>(
                onSelected: (FilterOptions selectedValue) {
                  setState(() {
                    if (selectedValue == FilterOptions.Az) {
                      _showNewest = false;
                      _showAz = true;
                    } else {
                      _showAz = false;
                      _showNewest = true;
                    }
                  });
                },
                icon: Icon(Icons.more_vert),
                itemBuilder: (_) => [
                      PopupMenuItem(
                        child: Text('A-Z'),
                        value: FilterOptions.Az,
                      ),
                      PopupMenuItem(
                        child: Text('Newest'),
                        value: FilterOptions.newest,
                      ),
                    ])
          ],
        ),
        body: Consumer<NoteController>(
            builder: (context, read, child){
              // if(read.getNotes.isEmpty){
              //   return Center(child: Text('chưa có gì!'));
              // }
              return
              Container(
                child: ListView.builder(
                    itemCount:read.getNotes.length,
                    itemBuilder: (context, index)
                    {
                      return Container(
                        child:Text('${read.getNotes[index].title}')
                      );
                    }),
              );
            },

          ),

        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.teal,
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return const DialogForm();
              },
            );
          },
          child: Icon(
            Icons.add,
          ),
        ),
      ),
    );
  }
}
