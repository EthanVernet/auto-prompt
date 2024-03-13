import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:front/app/app_color.dart';
import 'package:front/controller/main_controller.dart';
import 'package:front/view/layout/column/layout_dual_row.dart';

class WidgetDisplayPrompt extends StatefulWidget {
  final MainController controller;

  const WidgetDisplayPrompt({super.key, required this.controller});

  @override
  _WidgetDisplayPromptState createState() => _WidgetDisplayPromptState();
}

class _WidgetDisplayPromptState extends State<WidgetDisplayPrompt> {
  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(text: widget.controller.generateFinalContent());
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _copyToClipboard() {
    Clipboard.setData(ClipboardData(text: _textController.text)).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Contenu copié dans le presse-papiers')),
      );
    });
  }

  Widget _buildCopyButton() {
    return Container(
      height: 50.0,
      decoration: BoxDecoration(
        color: AppColors.primaryColor2,
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: TextButton(
        onPressed: _copyToClipboard,
        style: TextButton.styleFrom(
          backgroundColor: AppColors.primaryColor2,
          primary: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Copier'),
            SizedBox(width: 8),
            Icon(Icons.copy),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutDualRow(
      topWidget: TextFormField(
        controller: _textController,
        maxLines: null,
        style: const TextStyle(fontFamily: 'monospace'),
        decoration: const InputDecoration(
          labelText: 'Contenu généré',
          border: OutlineInputBorder(),
        ),
      ),
      bottomWidget: _buildCopyButton(),
      bottomFlex: 78,
      isTopFlex: true,
      isBottomFlex: false,
    );
  }
}
