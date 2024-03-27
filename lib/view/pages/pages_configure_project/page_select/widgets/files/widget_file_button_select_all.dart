import 'package:flutter/material.dart';
import 'package:front/controller/controller_configure_project.dart';
import 'package:front/view/widgets/button.dart';

class WidgetFileButtonSelectAll extends StatelessWidget {
  final ControllerConfigureProject controller;
  final VoidCallback onSelected; // Add this line

  const WidgetFileButtonSelectAll({
    super.key,
    required this.controller,
    required this.onSelected, // Add this line
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Button(
          boldTitle: 'Select',
          normalTitle: 'All',
          onPressed: () {
            controller.selectAllFiles();
            onSelected();
          },
          isLoading: false,
          width: 230,
        ),
      ],
    );
  }
}
