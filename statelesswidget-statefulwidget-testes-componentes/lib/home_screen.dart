import 'package:componentesflutter/input_custom.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final String title;
  const HomeScreen({super.key, required this.title});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Meu APP")),
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.red,
            ),
          ),
          SizedBox(width: 30),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.blueAccent,
              child: Column(
                children: [
                  Text("Login"),
                  InputCustom(controller: controller)
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.purple,
            ),
          )
        ],
      ),
    );
  }
}