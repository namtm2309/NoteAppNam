import 'package:flutter/foundation.dart';
import 'package:test2309/models/model.dart';

class NoteController extends ChangeNotifier {
  List<NoteList> _list = <NoteList>[];
  List<NoteList> get items => _list;
  bool isCircle = false;
  bool isBlue = false;

  void addItem(String title, String description) {
    NoteList note = NoteList(
        id: DateTime.now().toString(), title: title, description: description);
    _list.add(note);
    print(note);
    // print(_mListNote.length);
    notifyListeners();
  }

  void deleteItem(NoteList noteId) {
    _list.remove(noteId);
    notifyListeners();
  }

  void editItem(int index, String title, String description) {
    _list[index].title = title;
    _list[index].description = description;

    notifyListeners();
  }

  void sortAZ() {
    _list.sort((a, b) => a.title.compareTo(b.title));
  }

  NoteList? findById(String? id) {
    return _list.firstWhere((noteid) => (noteid.id == id));
  }
  NoteList? findByTitle(String? title) {
    return _list.firstWhere((notett) => (notett.title == title));
  }

  void sortNewest() {
    _list.sort((a, b) => DateTime.parse(b.id).compareTo(DateTime.parse(a.id)));
  }

  void toggleIconStatus() {
    isCircle = !isCircle;
    notifyListeners();
  }

  void choseColorBackground() {
    isBlue = !isBlue;
    notifyListeners();
  }
}
