import 'package:myapp/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel({required super.id, required super.title, required super.price});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["id"],
      title: json["title"],
      price: json["price"],
    );
  }
}
