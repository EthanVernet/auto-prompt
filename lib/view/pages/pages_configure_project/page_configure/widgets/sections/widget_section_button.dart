import 'package:flutter/material.dart';
import 'package:front/controller/controller_configure_project.dart';
import 'package:front/view/widgets/button.dart';

class WidgetSectionButton extends StatelessWidget {
  final ControllerConfigureProject controller;
  final VoidCallback onSectionAdded;

  const WidgetSectionButton({super.key, required this.controller, required this.onSectionAdded});

  @override
  Widget build(BuildContext context) {
    return Button(
      boldTitle: 'Add',
      normalTitle: 'Prompt Section',
      onPressed: () {
        controller.addSection("New Title", "New Content");
        onSectionAdded();
      },
    );
  }
}
