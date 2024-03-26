import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front/app/app_color.dart';
import 'package:front/controller/controller_project.dart';

class WidgetFilePicker extends StatefulWidget {
  final ControllerProject controller;
  const WidgetFilePicker({Key? key, required this.controller}) : super(key: key);

  @override
  _WidgetFilePickerState createState() => _WidgetFilePickerState();
}

class _WidgetFilePickerState extends State<WidgetFilePicker> {
  String? selectedDirectoryPath;

  Future<void> _pickDirectory() async {
    String? directoryPath = await widget.controller.pickDirectory();

    if (directoryPath != null) {
      setState(() {
        selectedDirectoryPath = directoryPath;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 16,
        ),
        Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.actionColor,
                width: 1
              ),
              borderRadius: BorderRadius.circular(5),
              color: AppColors.actionColor,
            ),
            width: 176,
            height: 24,
            child: TextButton(
              onPressed: _pickDirectory,
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                foregroundColor: AppColors.lightBackground,
                textStyle: const TextStyle(fontSize: 12),
              ),
              child: RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'Select ',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                    TextSpan(
                      text: 'Folder Project',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            )
        ),
        Container(
          width: 16,
        ),
        Expanded(
            child: Text(
              selectedDirectoryPath ?? 'No directory selected',
              style: const TextStyle(
                color: AppColors.darkBackground,
                fontSize: 12,
              ),
            )
        ),
      ],
    );
  }
}