import 'package:flutter/material.dart';

class InputCustom extends StatelessWidget {
  final TextEditingController controller;

  const InputCustom({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
    );
  }
}