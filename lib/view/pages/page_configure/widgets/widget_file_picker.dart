import 'package:flutter/material.dart';
import 'package:front/app/app_color.dart';
import 'package:front/controller/main_controller.dart';
import 'package:front/view/layout/column/layout_dual_column.dart';

class WidgetFilePicker extends StatefulWidget {
  final MainController controller;
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

  Widget _buildRightWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: 32.0, bottom: 14),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            selectedDirectoryPath ?? 'No directory selected',
            style: const TextStyle(fontSize: 18.0),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return LayoutDualColumn(
      leftWidget: Container(
        height: 50.0,
        width: 50.0,
        decoration: BoxDecoration(
          color: AppColors.primaryColor2,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: IconButton(
          icon: const Icon(Icons.folder_open, color: Colors.white),
          onPressed: _pickDirectory,
        ),
      ),
      isLeftFlex: false,
      leftSize: 50,

      rightWidget: _buildRightWidget(),
      isRightFlex: true,
      rightSize: 7,
    );
  }
}
