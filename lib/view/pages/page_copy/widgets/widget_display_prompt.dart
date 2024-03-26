import 'package:flutter/material.dart';
import 'package:front/controller/controller_project.dart';

class WidgetDisplayContent extends StatelessWidget {
  final ControllerProject controller;

  const WidgetDisplayContent({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: TextFormField(
        controller: TextEditingController(text: controller.generateFinalContent()),
        maxLines: null,
        style: const TextStyle(fontFamily: 'monospace', fontSize: 12),
      ),
    );
  }
}
