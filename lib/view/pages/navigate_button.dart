import 'package:flutter/material.dart';
import 'package:front/app/app_color.dart';
import 'package:front/controller/controller_project.dart';
import 'package:front/controller/navigation_controller.dart';
import 'package:front/view/pages/type_page.dart';

class NavigateButton extends StatefulWidget {
  final TypePage type;
  final MainController? controller;

  const NavigateButton({super.key, required this.type, this.controller});

  @override
  State<NavigateButton> createState() => _NavigateButtonState();
}

class _NavigateButtonState extends State<NavigateButton> {
  bool _isLoading = false;

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
      height: 24,
      child: TextButton(
        onPressed: _isLoading ? null : () => _handlePress(),
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
            : const Text('Suivant', style: nextButtonTextStyle),
      ),
    );
  }

  void _handlePress() {
    setState(() => _isLoading = true);
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        NavigationController().navigateTo(context, widget.type, widget.controller);
        setState(() => _isLoading = false);
      }
    });
  }
}
