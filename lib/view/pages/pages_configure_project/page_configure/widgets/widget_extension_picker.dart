import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front/controller/controller_configure_project.dart';
import 'package:front/view/widgets/drop_button.dart';

class WidgetExtensionPicker extends StatefulWidget {
  final ControllerConfigureProject controller;

  const WidgetExtensionPicker({Key? key, required this.controller}) : super(key: key);

  @override
  State<WidgetExtensionPicker> createState() => _WidgetExtensionPickerState();
}

class _WidgetExtensionPickerState extends State<WidgetExtensionPicker> {
  String? selectedExtension;

  @override
  void initState() {
    super.initState();
    List<String> extensions = widget.controller.getLanguages();
    selectedExtension = extensions.isNotEmpty ? extensions.first : null;
  }

  void _onExtensionSelected(String? newValue) {
    setState(() {
      selectedExtension = newValue;
      if (newValue != null) {
        widget.controller.setSelectedLanguage(newValue);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final extensions = widget.controller.getLanguages();
    return SizedBox(
      width: 230,
      child: DropButton(
        items: extensions,
        selectedItem: selectedExtension,
        onItemSelected: _onExtensionSelected,
      ),
    );
  }
}