import 'package:flutter/material.dart';
import 'package:flutter_listview_form/explorer.dart';

class HomeScreen extends StatefulWidget {
  final String title;

  const HomeScreen({super.key, required this.title});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _nameController;
  late TextEditingController _ageController;
  late GlobalKey _formKey;
  late List<Explorer> listExplorer = [];

  @override
  void initState() {
    _formKey = GlobalKey();
    _nameController = TextEditingController();
    _ageController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 40),
              color: Colors.red,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Formuláro"),
                  SizedBox(height: 20),
                  Form(
                    child: Column(
                      key: _formKey,
                      children: [
                        TextFormField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            label: Text("Informe o nome do explorador"),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: _ageController,
                          decoration: InputDecoration(
                            label: Text("Informe a idade do explorador"),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              final name = _nameController.text;
                              final age = _ageController.text;
                              final explorer = Explorer(name: name, age: age);

                              setState(() {
                                listExplorer.add(explorer);
                              });

                              _nameController.clear();
                              _ageController.clear();
                            });
                          },
                          child: Text("Salvar"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.yellow,
              child: Column(
                children: [
                  Text("Exploradores"),
                  Expanded(
                    child: ListView.builder(
                      itemCount: listExplorer.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(listExplorer[index].name),
                          subtitle: Text(listExplorer[index].age),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
