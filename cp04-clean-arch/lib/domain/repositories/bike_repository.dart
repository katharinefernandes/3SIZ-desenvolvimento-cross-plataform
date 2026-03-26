import 'package:myapp/domain/entities/bike_entity.dart';

// contrato para se comunicar com a camada de data
abstract class BikeRepository {
  Future<List<BikeEntity>> getBikes();
}
