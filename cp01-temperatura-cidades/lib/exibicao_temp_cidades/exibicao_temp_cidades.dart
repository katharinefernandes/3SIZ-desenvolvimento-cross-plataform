import 'package:flutter/material.dart';

class ExibicaoTempCidadesScreen extends StatefulWidget {
  final String title;

  const ExibicaoTempCidadesScreen({super.key, required this.title});

  @override
  State<ExibicaoTempCidadesScreen> createState() =>
      _ExibicaoTempCidadesScreenState();
}

class _ExibicaoTempCidadesScreenState extends State<ExibicaoTempCidadesScreen> {
  List<Map<String, dynamic>> cidades = [];

  @override
  void initState() {
    cidades.add({"nome": "São Paulo", "temperatura": 30});
    cidades.add({"nome": "Diadema", "temperatura": 28});
    cidades.add({"nome": "São Bernardo do Campo", "temperatura": 13});
    cidades.add({"nome": "São Caetano do Sul", "temperatura": 21});
    cidades.add({"nome": "Santo André", "temperatura": 25});
    super.initState();
  }

  Widget formataTexto(String nome, int temperatura) {
    String classicacaoTemp = temperatura < 15
        ? "Frio"
        : temperatura > 25
        ? "Quente"
        : "Agradável";

    return Text(
      "Cidade - $nome | Temperatura $temperatura°C - Estará $classicacaoTemp",
    );
  }

  @override
  Widget build(BuildContext context) {
    // ordena as cidades por temperatura
    cidades.sort(
      (cidadeB, cidadeA) =>
          cidadeA['temperatura'].compareTo(cidadeB['temperatura']),
    );

    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Cidades - Temperatura - Clima",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          for (var cidade in cidades)
            formataTexto(cidade['nome'], cidade['temperatura']),
        ],
      ),
    );
  }
}
