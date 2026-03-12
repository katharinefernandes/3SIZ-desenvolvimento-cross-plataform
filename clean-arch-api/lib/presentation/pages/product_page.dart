import 'package:flutter/material.dart';
import 'package:myapp/presentation/controllers/product_controller.dart';
import 'package:provider/provider.dart';

/// Tela de listagem de produtos com estados de carregamento e erro.
class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  void initState() {
    super.initState();
    // Dispara a busca inicial apos o primeiro frame.
    final controller = context.read<ProductController>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    // Observa mudancas do controller para refazer a UI.
    final controller = context.watch<ProductController>();

    return Scaffold(
      appBar: AppBar(title: const Text("Produtos")),
      body: Builder(
        builder: (_) {
          // Estado: carregando.
          if (controller.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          // Estado: erro.
          if (controller.error != null) {
            return Center(child: Text(controller.error!));
          }

          // Estado: sucesso com lista de produtos.
          return ListView.builder(
            itemCount: controller.products.length,
            itemBuilder: (_, index) {
              final product = controller.products[index];

              return ListTile(
                leading: CircleAvatar(
                  child: Text(
                    (product.title.isNotEmpty) ? product.title[0] : '?',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                title: Text(product.title),
                subtitle: Text("R\$ ${product.price}"),
              );
            },
          );
        },
      ),
    );
  }
}
