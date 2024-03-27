import 'package:flutter/material.dart';
import 'package:front/core/app_color.dart';

class Button extends StatefulWidget {
  final String boldTitle;
  final String normalTitle;
  final VoidCallback onPressed;
  final bool isLoading;
  final double width;

  const Button({
    Key? key,
    required this.boldTitle,
    required this.normalTitle,
    required this.onPressed,
    this.isLoading = false,
    this.width = 176,
  }) : super(key: key);

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.actionColor, width: 1),
        borderRadius: BorderRadius.circular(5.0),
        color: AppColors.actionColor,
      ),
      width: widget.width,
      height: 26,
      child: TextButton(
        onPressed: widget.isLoading ? null : widget.onPressed,
        style: TextButton.styleFrom(
          backgroundColor: AppColors.actionColor,
          foregroundColor: AppColors.lightBackground,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        child: widget.isLoading
            ? const SizedBox(
          height: 16,
          width: 16,
          child: CircularProgressIndicator(
            strokeWidth: 1.5,
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.lightBackground),
          ),
        )
            : RichText(
          text: TextSpan(
            children: [
              TextSpan(text: widget.boldTitle, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
              TextSpan(text: ' ${widget.normalTitle}', style: const TextStyle(fontSize: 12)),
            ],
          ),
        ),
      ),
    );
  }
}
