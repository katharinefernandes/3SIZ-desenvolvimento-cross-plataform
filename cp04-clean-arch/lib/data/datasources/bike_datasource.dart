import 'package:myapp/core/custom_http_client.dart';
import 'package:myapp/data/models/bike_model.dart';
import 'package:myapp/domain/entities/bike_entity.dart';

class BikeDatasource {
  final CustomHttpClient customHttpClient;

  BikeDatasource(this.customHttpClient);

  Future<List<BikeEntity>> getBikes() async {
    final response = await customHttpClient.getBikes();

    // sabemos que uma lista está sendo retornada, então colocamos "as List"
    final List<dynamic> dataList = response.data is List ? response.data : [];
    return (dataList)
        .map((bike) => BikeModel.fromJson(bike))
        .map((model) => model.toBikeEntity())
        .toList();
  }
}
