import 'package:flutter/material.dart';
import 'package:myapp/presentation/controllers/bike_controller.dart';
import 'package:provider/provider.dart';

class BikePage extends StatefulWidget {
  const BikePage({super.key});

  @override
  State<BikePage> createState() => _BikePageState();
}

class _BikePageState extends State<BikePage> {
  @override
  void initState() {
    super.initState();
    // Dispara a busca inicial apos o primeiro frame.
    final controller = context.read<BikeController>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchBikes();
    });
  }

  @override
  Widget build(BuildContext context) {
    // Observa mudancas do controller para refazer a UI.
    final controller = context.watch<BikeController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bikes'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              controller.fetchBikes();
            },
          ),
        ],
      ),
      //Exibe loading, erro ou a lista conforme o estado atual
      body: Builder(
        builder: (_) {
          if (controller.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          // Estado: erro. Retorna mensagem de erro
          if (controller.errorMessage != null) {
            return Center(child: Text(controller.errorMessage!));
          }

          return ListView.builder(
            itemCount: controller.bikes.length,
            itemBuilder: (context, index) {
              final bike = controller.bikes[index];

              return ListTile(
                leading: CircleAvatar(child: Text('${bike.id}')),
                title: Text(bike.name),
                subtitle: Text('Preço: R\$ ${bike.price}'),
                trailing: Text(bike.status),
              );
            },
          );
        },
      ),
    );
  }
}
