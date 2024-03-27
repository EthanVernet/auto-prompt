import 'package:flutter/material.dart';
import 'package:front/controller/controller_configure_project.dart';
import 'package:front/view/widgets/button.dart';

class WidgetFileButtonDeselectAll extends StatelessWidget {
  final ControllerConfigureProject controller;
  final VoidCallback onDeselected; // Add this line

  const WidgetFileButtonDeselectAll({
    super.key,
    required this.controller,
    required this.onDeselected, // Add this line
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Button(
          boldTitle: 'Deselect',
          normalTitle: 'All',
          onPressed: () {
            controller.deselectAllFiles();
            onDeselected(); // Call the callback after deselecting all files
          },
          isLoading: false,
        ),
      ],
    );
  }
}
