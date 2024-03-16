import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:front/app/app_color.dart';

class WidgetCopyButton extends StatelessWidget {
  final TextEditingController textController;
  final bool _isLoading = false;

  const WidgetCopyButton({Key? key, required this.textController}) : super(key: key);

  void _copyToClipboard(BuildContext context) {
    Clipboard.setData(ClipboardData(text: textController.text)).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Content copied to clipboard.')),
      );
    });
  }

  static const TextStyle nextButtonTextStyle = TextStyle(fontSize: 12, fontWeight: FontWeight.bold);
  static final buttonStyle = TextButton.styleFrom(
    backgroundColor: AppColors.actionColor,
    foregroundColor: AppColors.lightBackground,
    padding: const EdgeInsets.symmetric(horizontal: 10),
    textStyle: nextButtonTextStyle,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5.0),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.actionColor, width: 1),
        borderRadius: BorderRadius.circular(5.0),
        color: AppColors.actionColor,
      ),
      height: 24.0,
      child: TextButton(
        onPressed: _isLoading ? null : () => _copyToClipboard(context),
        style: buttonStyle,
        child: _isLoading
            ? const SizedBox(
          height: 16,
          width: 16,
          child: CircularProgressIndicator(
            strokeWidth: 1.5,
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.lightBackground),
          ),
        )
            : const Text('Copy', style: nextButtonTextStyle),
      ),
    );
  }
}
