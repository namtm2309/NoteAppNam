import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:test2309/screens/detail_screen.dart';
import 'package:test2309/widgets/dialog_edit.dart';

import '../controller/note_controller.dart';
import '../models/model.dart';
import 'package:provider/provider.dart';
import '../widgets/dialog_form.dart';

enum FilterOptions { Az, newest, changeBG }

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
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor:
              (_read.isBlue == true) ? Colors.black87 : Colors.teal,
          title: Text('Home'),
          actions: <Widget>[
            PopupMenuButton<FilterOptions>(
                onSelected: (FilterOptions selectedValue) {
                  setState(() {
                    if (selectedValue == FilterOptions.Az) {
                      _showNewest = false;
                      _showAz = true;
                      _read.sortAZ();
                    } else if (selectedValue == FilterOptions.changeBG) {
                      _read.choseColorBackground();
                    } else {
                      _showAz = false;
                      _showNewest = true;
                      _read.sortNewest();
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
                      PopupMenuItem(
                        child: (_read.isBlue == true)
                            ? Text('Light Theme')
                            : Text('Dark Theme'),
                        value: FilterOptions.changeBG,
                      ),
                    ])
          ],
        ),
        body: Container(
          color: (_read.isBlue == true) ? Colors.black87 : null,
          constraints: BoxConstraints.expand(),
          width: double.infinity,
          // decoration:const BoxDecoration(
          //   image: DecorationImage(
          //       image: NetworkImage(
          //           'https://marketplace.canva.com/EAFJclBo2Bo/1/0/900w/canva-green-blue-illustration-green-hill-phone-wallpapaer-UIK163ESkKk.jpg'),
          //       fit: BoxFit.cover,
          //       opacity: 0.4),
          // ),
          child: Consumer<NoteController>(
            builder: (context, controller, _) {
              if (controller.items.isEmpty) {
                return Center(
                    child: Text(
                  'Empty',
                  style: TextStyle(
                      color:
                          (_read.isBlue == true) ? Colors.white : Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ));
              }

              return ListView.builder(
                  itemCount: controller.items.length,
                  itemBuilder: (context, index) => Container(
                        padding: EdgeInsets.only(top: 2),
                        child: Slidable(
                          key: ValueKey(controller.items[index].id),
                          endActionPane: ActionPane(
                            motion: StretchMotion(),
                            children: [
                              SlidableAction(
                                onPressed: (context) {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return DialogEdit(index: index);
                                    },
                                  );
                                },
                                backgroundColor: Colors.blue,
                                icon: Icons.edit,
                              ),
                              SlidableAction(
                                onPressed: (context) {
                                  controller
                                      .deleteItem(controller.items[index]);
                                },
                                backgroundColor: Colors.red,
                                icon: Icons.delete,
                              ),
                            ],
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                  DetailScreen.routeName,
                                  arguments: controller.items[index].id);
                            },
                            child: ListTile(
                              tileColor: (_read.isBlue == true)
                                  ? Colors.black
                                  : Colors.teal[100],
                              iconColor: (_read.isBlue == true)
                                  ? Colors.white
                                  : Colors.black,
                              textColor: (_read.isBlue == true)
                                  ? Colors.white
                                  : Colors.black,
                              leading: IconButton(
                                  onPressed: () {
                                    controller.toggleIconStatus();
                                  },
                                  icon: Icon(
                                    controller.isCircle
                                        ? Icons.check_circle
                                        : Icons.circle_outlined,
                                  )),
                              title: Text(controller.items[index].title),
                              subtitle: Text(
                                  'Description: ${controller.items[index].description}'),
                            ),
                          ),
                        ),
                      ));
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: (_read.isBlue == true) ? Colors.white : Colors.teal,
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
            color: (_read.isBlue == true) ? Colors.black : Colors.white,
          ),
        ),
      ),
    );
  }
}
