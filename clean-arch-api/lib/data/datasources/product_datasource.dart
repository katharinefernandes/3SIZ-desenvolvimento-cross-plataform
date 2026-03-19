import 'package:myapp/core/custom_http_client.dart';
import 'package:myapp/data/models/product_model.dart';
import 'package:myapp/domain/entities/product_entity.dart';

class ProductDatasource {
  final CustomHttpClient customHttpClient;

  ProductDatasource(this.customHttpClient);

  Future<List<ProductEntity>> getProducts() async {
    final response = await customHttpClient.getProducts();

    // sabemos que uma lista está sendo retornada, então colocamos "as List"
    final List<dynamic> dataList = response.data is List ? response.data : [];
    return (dataList)
        .map((prod) => ProductModel.fromJson(prod))
        .map((model) => model.toProductEntity())
        .toList();
  }

  // método para cadastro de um produto
  Future<bool> createProduct(ProductEntity product) async {
    try {
      final model = ProductModel.fromProductEntity(product);
      await customHttpClient.createProduct(model.toJson());
      return true;
    } catch (e) {
      return false;
    }
  }
}
