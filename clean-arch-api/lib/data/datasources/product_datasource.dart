import 'package:myapp/core/custom_http_client.dart';
import 'package:myapp/data/models/product_model.dart';
import 'package:myapp/domain/entities/product_entity.dart';

class ProductDatasource {
  final CustomHttpClient customHttpClient;

  ProductDatasource(this.customHttpClient);

  Future<List<ProductEntity>> getProducts() async {
    final response = await customHttpClient.getProducts();

    // sabemos que uma lista está sendo retornada, então colocamos "as List"
    return (response.data as List)
        .map((prod) => ProductModel.fromJson(prod))
        .toList();
  }
}
