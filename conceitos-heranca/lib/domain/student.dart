import 'package:myapp/domain/person.dart';

class Student extends Person {

  Student({
    required super.name,
    required super.age,
    required super.height
  });

  String study() {
    return "$name está aprendendo Flutter";
  }

}