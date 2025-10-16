class Person {
  String name;
  int age;
  double height;

  Person({
    required this.name, 
    required this.age, 
    required this.height 
  });

  String presenter() {
    return "Meu nome é: $name\n Minha idade é: $age\n Minha altura: $height" ;
  }

}