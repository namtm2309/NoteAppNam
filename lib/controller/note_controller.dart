import 'package:flutter/foundation.dart';
import 'package:test2309/models/model.dart';

class NoteController with ChangeNotifier {
  List<NoteList> _mListNote = <NoteList>[];
  List<NoteList> get getNotes {
    return _mListNote;
  }

  void addItem(String title, String description) {
    NoteList note = NoteList(
        id: DateTime.now().toString(),
        title: title,
        description: description);
    _mListNote.add(note);
    print(note.title);
    notifyListeners();
  }


}
