import 'package:myapp/domain/entities/product_entity.dart';

// contrato para se comunicar com a camada de data
abstract class ProductRepository {
  Future<List<ProductEntity>> getProducts();
}