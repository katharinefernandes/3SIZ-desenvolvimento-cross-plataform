import 'package:flutter/material.dart';
import 'package:myapp/explorer.dart';

class HomeViewModel extends ChangeNotifier {
  final List<Explorer> listExplorers = [];

  void add(String name, String age) {
    final explorer = Explorer(name: name, age: int.parse(age));
    listExplorers.add(explorer);
    notifyListeners();
  }

  void remove(Explorer value) {
    listExplorers.remove(value);
    notifyListeners();
  }
}
