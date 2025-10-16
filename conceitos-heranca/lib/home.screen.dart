import 'package:flutter/material.dart';
import 'package:myapp/domain/person.dart';
import 'package:myapp/domain/student.dart';
import 'package:myapp/domain/teacher.dart';

class HomeScreen extends StatefulWidget {
  final String title;

  const HomeScreen({super.key, required this.title});

  @override
  State<HomeScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomeScreen> {
  late Person person;
  late Teacher teacher;
  late Student student;

  @override
  void initState() {
    person = Person(name: "Katharine", age: 21, height: 1.65);
    teacher = Teacher(name: "Adao", age: 35, height: 1.70);
    student = Student(name: "Lari", age: 21, height: 1.60);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Informações da pessoa", style: TextStyle(fontWeight: FontWeight.bold)),
          Text(person.presenter()),
          Text("Informações do professor"),
          Text(teacher.teach()),
          Text("Informações do aluno"),
          Text(student.study()),
        ],
      ),
    );
  }
}