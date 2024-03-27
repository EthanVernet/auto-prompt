import 'package:flutter/material.dart';
import 'package:front/controller/controller_configure_project.dart';
import 'package:front/view/widgets/button.dart';

class WidgetFilePickerButton extends StatelessWidget {
  final ControllerConfigureProject controller;
  final VoidCallback onDirectoryPicked;

  const WidgetFilePickerButton({
    super.key,
    required this.controller,
    required this.onDirectoryPicked,
  });

  Future<void> _pickDirectory() async {
    String? directoryPath = await controller.pickDirectory();
    if (directoryPath != null) {
      onDirectoryPicked();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Button(
      boldTitle: 'Select',
      normalTitle: 'Folder Project',
      onPressed: _pickDirectory,
    );
  }
}
