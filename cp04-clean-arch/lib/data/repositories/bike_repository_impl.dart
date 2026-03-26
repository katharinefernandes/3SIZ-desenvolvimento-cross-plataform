import 'package:myapp/data/datasources/bike_datasource.dart';
import 'package:myapp/domain/entities/bike_entity.dart';
import 'package:myapp/domain/repositories/bike_repository.dart';

class BikeRepositoryImpl extends BikeRepository {
  final BikeDatasource bikeDatasource;

  BikeRepositoryImpl(this.bikeDatasource);

  @override
  Future<List<BikeEntity>> getBikes() async {
    return await bikeDatasource.getBikes();
  }
}
