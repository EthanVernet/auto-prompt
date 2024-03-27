import 'package:flutter/material.dart';
import 'package:front/core/app_color.dart';
import 'package:front/controller/setting_controller.dart';

class LLMSelector extends StatefulWidget {
  final SettingController controller;

  const LLMSelector({Key? key, required this.controller}) : super(key: key);

  @override
  _LLMSelectorState createState() => _LLMSelectorState();
}

class _LLMSelectorState extends State<LLMSelector> {
  String? selectedModel;

  @override
  void initState() {
    super.initState();
    List<String> llmNames = widget.controller.getLLMNames();
    if (llmNames.isNotEmpty) {
      selectedModel = llmNames.first;
      widget.controller.setSelectedLLM(selectedModel!);
    }
  }

  void _onModelSelected(String? newValue) {
    setState(() {
      selectedModel = newValue;
      if (newValue != null) {
        widget.controller.setSelectedLLM(newValue);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final llmNames = widget.controller.getLLMNames();
    return Row(
      children: [
        Container(width: 16), // Spacing at the start
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.actionColor, // Use your app's color theme
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: AppColors.actionColor,
                width: 1,
              ),
            ),
            height: 24,
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                dropdownColor: AppColors.actionColor, // Dropdown background color
                isExpanded: true,
                iconEnabledColor: AppColors.lightBackground, // Icon color
                value: selectedModel,
                onChanged: llmNames.isNotEmpty ? _onModelSelected : null,
                items: llmNames.map<DropdownMenuItem<String>>((String model) {
                  return DropdownMenuItem<String>(
                    value: model,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0), // Left padding for text
                      child: Text(
                        model,
                        style: const TextStyle(
                          color: AppColors.lightBackground, // Text color
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
