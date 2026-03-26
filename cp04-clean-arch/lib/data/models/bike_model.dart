//sabe construir o BikeEntity

import 'package:myapp/domain/entities/bike_entity.dart';

class BikeModel {
  final int id;
  final String name;
  final String price;
  final String status;

  BikeModel({
    required this.id,
    required this.name,
    required this.price,
    required this.status,
  });

  factory BikeModel.fromJson(Map<String, dynamic> json) {
    return BikeModel(
      id: json["id"],
      name: json["name"],
      price: json["price"],
      status: json["status"],
    );
  }

  // transforma em entidade para usar no sistema
  BikeEntity toBikeEntity() {
    return BikeEntity(id: id, name: name, price: price, status: status);
  }
}
