import 'package:flutter/material.dart';
import 'package:myapp/exibicao_clientes/exibicao_cliente.screen.dart';
import 'package:myapp/gestao_pedidos/gestao_pedidos.screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const GestaoPedidosScreen(title: 'Exibição de Pedidos'),
    );
  }
}

