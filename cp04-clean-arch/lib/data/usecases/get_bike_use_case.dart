import 'package:myapp/domain/entities/bike_entity.dart';
import 'package:myapp/domain/repositories/bike_repository.dart';

class GetBikeUseCase {
  final BikeRepository bikeRepository;

  GetBikeUseCase(this.bikeRepository);

  Future<List<BikeEntity>> execute() async {
    return bikeRepository.getBikes();
  }
}
