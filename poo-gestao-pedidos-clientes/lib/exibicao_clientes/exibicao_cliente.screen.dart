import 'package:flutter/material.dart';

class ExibicaoClienteScreen extends StatefulWidget {
  final String title;

  const ExibicaoClienteScreen({super.key, required this.title});

  @override
  State<ExibicaoClienteScreen> createState() => _ExibicaoClienteScreenState();
}

class _ExibicaoClienteScreenState extends State<ExibicaoClienteScreen> {

  List<Map<String, dynamic>> clientes = [];

  @override
  void initState() {
    clientes.add({"nome":"Katharine", "idade":36});
    clientes.add({"nome":"Giovanna", "idade":25});
    clientes.add({"nome":"Larissa", "idade":21});
    super.initState();
  }

  Widget formatarTexto(String nome, int idade) {
    String eMaior = idade >= 18 ? "é de maior" : "é de menor";
    return Text("Cliente $nome $eMaior");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        children: [
          Text("Clientes"),
          for(var cliente in clientes)
          formatarTexto(cliente['nome'], cliente['idade'])
        ],
      ),
    );
  }
}