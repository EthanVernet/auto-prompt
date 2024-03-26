import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front/app/app_color.dart';
import 'package:front/controller/controller_project.dart';

class WidgetExtensionSelector extends StatefulWidget {
  final ControllerProject controller;

  const WidgetExtensionSelector({Key? key, required this.controller}) : super(key: key);

  @override
  State<WidgetExtensionSelector> createState() => _WidgetExtensionSelectorState();
}

class _WidgetExtensionSelectorState extends State<WidgetExtensionSelector> {
  String? selectedLanguage;

  @override
  void initState() {
    super.initState();
    selectedLanguage = widget.controller.getProgrammingLanguages().isNotEmpty
        ? widget.controller.getProgrammingLanguages().first
        : null;
  }

  void _onLanguageSelected(String? newValue) {
    setState(() {
      selectedLanguage = newValue;
      if (newValue != null) {
        widget.controller.setSelectedLanguage(newValue);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final languages = widget.controller.getProgrammingLanguages();
    return Row(
      children: [
        Container(width: 16),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.actionColor,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: AppColors.actionColor,
                width: 1,
              ),
            ),
            height: 24,
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                dropdownColor: AppColors.actionColor,
                isExpanded: true,
                iconEnabledColor: AppColors.lightBackground,
                value: selectedLanguage,
                onChanged: languages.isNotEmpty ? _onLanguageSelected : null,
                items: languages.map<DropdownMenuItem<String>>((String language) {
                  return DropdownMenuItem<String>(
                    value: language,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0), // Ajoute une marge à gauche
                      child: Text(
                        language,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: AppColors.lightBackground,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  );
                }).toList(),
                style: const TextStyle(
                  color: AppColors.lightBackground,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ),
        Container(width: 16),
      ],
    );
  }
}
