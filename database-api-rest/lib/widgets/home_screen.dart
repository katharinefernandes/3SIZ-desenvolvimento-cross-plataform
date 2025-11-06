import 'package:flutter/material.dart';
import 'package:myapp/models/todo.dart';
import 'package:myapp/viewmodel/home_view_model.dart';
import 'package:provider/provider.dart';
import 'add_todo_bottom_sheet.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeViewModel _homeViewModel;

  @override
  void initState() {
    // instancia do HomeViewModel
    _homeViewModel = context.read<HomeViewModel>();
    _homeViewModel.fetchTodo();
    super.initState();
  }

  void _showAddTodoSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => AddTodoBottomSheet(onAdd: (value) {
        _homeViewModel.add(value);
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    _homeViewModel = context.watch<HomeViewModel>();

    return Scaffold(
      appBar: AppBar(title: const Text("Minhas Tarefas"), centerTitle: true),
      body: ListView.builder(
        itemCount: _homeViewModel.todos.length,
        itemBuilder: (context, index) {
          final todo = _homeViewModel.todos[index];

          return Dismissible(
            key: UniqueKey(),
            direction: DismissDirection.endToStart,
            onDismissed: (_) {},
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            child: CheckboxListTile(
              title: Text(
                todo.title,
                style: TextStyle(
                  decoration: todo.done
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
              value: todo.done,
              onChanged: (value) {
                _homeViewModel.update(todo.copyWith(done: value));
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTodoSheet,
        child: const Icon(Icons.add),
      ),
    );
  }
}
