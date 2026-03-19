//sabe construir o ProductEntity

import 'package:myapp/domain/entities/product_entity.dart';

class ProductModel {
  final int id;
  final String title;
  final String price;

  ProductModel({required this.id, required this.title, required this.price});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["id"],
      title: json["title"],
      price: json["price"],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'title': title, 'price': price};
  }

  // transforma em model para enviar para API
  factory ProductModel.fromProductEntity(ProductEntity entity) {
    return ProductModel(
      id: entity.id,
      title: entity.title,
      price: entity.price,
    );
  }

  // transforma em entidade para usar no sistema
    ProductEntity toProductEntity() {
    return ProductEntity(
      id: id,
      title: title,
      price: price,
    );
  }
}
