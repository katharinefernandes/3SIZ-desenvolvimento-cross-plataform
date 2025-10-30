import 'package:cp03/domain/project.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  final List<Project> listProjects = [];

  void add(Project project) {
    listProjects.add(project);
    notifyListeners();
  }

  void remove(Project value) {
    listProjects.remove(value);
    notifyListeners();
  }
}
