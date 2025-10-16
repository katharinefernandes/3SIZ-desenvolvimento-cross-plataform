import 'package:myapp/domain/person.dart';

class Teacher extends Person {

  Teacher({
    required super.name, 
    required super.age, 
    required super.height
  });

  String teach() {
    return "$name está ensinando Flutter.";
  }

}