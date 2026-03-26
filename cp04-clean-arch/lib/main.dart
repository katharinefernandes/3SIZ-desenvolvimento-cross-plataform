import 'package:flutter/material.dart';
import 'package:myapp/core/custom_http_client.dart';
import 'package:myapp/data/datasources/bike_datasource.dart';
import 'package:myapp/data/repositories/bike_repository_impl.dart';
import 'package:myapp/data/usecases/get_bike_use_case.dart';
import 'package:myapp/presentation/controllers/bike_controller.dart';
import 'package:provider/provider.dart';

import 'presentation/pages/bike_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final httpClient = CustomHttpClient();
    final bikeDatasource = BikeDatasource(httpClient);
    final bikeRepository = BikeRepositoryImpl(bikeDatasource);
    final getBikeUseCase = GetBikeUseCase(bikeRepository);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BikeController((getBikeUseCase))),
      ],
      child: MaterialApp(
        title: 'Bikes',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
          useMaterial3: true,
        ),
        home: const BikePage(),
      ),
    );
  }
}
