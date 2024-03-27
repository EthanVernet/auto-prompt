import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:front/view/widgets/button.dart';

class WidgetCopyButton extends StatelessWidget {
  final TextEditingController textController;

  const WidgetCopyButton({super.key, required this.textController});

  void _copyToClipboard(BuildContext context) {
    Clipboard.setData(ClipboardData(text: textController.text)).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Content copied to clipboard.')),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Button(
      boldTitle: 'Copy',
      normalTitle: '',
      onPressed: () => _copyToClipboard(context),
      isLoading: false,
    );
  }
}
