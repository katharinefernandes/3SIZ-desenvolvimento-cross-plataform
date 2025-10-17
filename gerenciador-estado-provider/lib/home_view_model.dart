import 'package:flutter/material.dart';
import 'package:myapp/patient.dart';

class HomeViewModel extends ChangeNotifier {
  final List<Patient> listPatients = [];

  void add(String name, String age) {
    final patient = Patient(name: name, age: int.parse(age));
    listPatients.add(patient);
    // avisa que um paciente foi adicionado
    notifyListeners();
  }

  void remove(Patient value) {
    listPatients.remove(value);
    notifyListeners();
  }
}
