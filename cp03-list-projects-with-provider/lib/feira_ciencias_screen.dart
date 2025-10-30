import 'package:cp03/custom_input_widget.dart';
import 'package:cp03/domain/project.dart';
import 'package:cp03/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FeiraCienciasScreen extends StatefulWidget {
  final String title;
  const FeiraCienciasScreen({super.key, required this.title});

  @override
  State<FeiraCienciasScreen> createState() => _FeiraCienciasScreenState();
}

class _FeiraCienciasScreenState extends State<FeiraCienciasScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _responsableController;
  late HomeViewModel _homeViewModel;

  @override
  void initState() {
    _titleController = TextEditingController();
    _responsableController = TextEditingController();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _homeViewModel = Provider.of<HomeViewModel>(context, listen: false);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _responsableController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _homeViewModel = context.watch<HomeViewModel>();

    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Projetos',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Projetos cadastrados (${_homeViewModel.listProjects.length})",
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      itemCount: _homeViewModel.listProjects.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            "${_homeViewModel.listProjects[index].title}",
                          ),
                          subtitle: Text(
                            "Responsável: ${_homeViewModel.listProjects[index].responsable}",
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Form(
                    child: Column(
                      key: _formKey,
                      children: [
                        CustomInputWidget(
                          label: "Nome do projeto",
                          controller: _titleController,
                        ),
                        SizedBox(height: 20),
                        CustomInputWidget(
                          label: "Responsável",
                          controller: _responsableController,
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              style: ButtonStyle(),
                              onPressed: () {
                                clear();
                              },
                              child: Text("Limpar"),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  if (_titleController.text.isNotEmpty &&
                                      _responsableController.text.isNotEmpty) {
                                    saveProject();
                                  }
                                });
                              },
                              child: Text("Salvar"),
                            ),
                          ],
                        ),
                      ],
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

  void clear() {
    setState(() {
      _titleController.clear();
      _responsableController.clear();
    });
  }

  void saveProject() {
    final titleText = _titleController.text;
    final responsableText = _responsableController.text;

    final project = Project(title: titleText, responsable: responsableText);

    setState(() {
      _homeViewModel.add(project);
    });

    clear();
  }
}
