import 'package:flutter/widgets.dart';
import 'package:myapp/data/usecases/get_bike_use_case.dart';
import 'package:myapp/domain/entities/bike_entity.dart';

class BikeController extends ChangeNotifier {
  final GetBikeUseCase _getBikeUseCase;
  List<BikeEntity> _bikes = [];
  bool isLoading = false;
  String? errorMessage;

  BikeController(this._getBikeUseCase);

  List<BikeEntity> get bikes => _bikes;

  Future<void> fetchBikes() async {
    try {
      isLoading = true;
      // coloquei o notify aqui para que ele notifique a tela que precisa exibir o loading
      notifyListeners();

      _bikes = await _getBikeUseCase.execute();
      errorMessage = null;
    } catch (e) {
      errorMessage = 'Erro ao carregar bikes';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
