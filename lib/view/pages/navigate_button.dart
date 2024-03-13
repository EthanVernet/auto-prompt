import 'package:flutter/material.dart';
import 'package:front/app/app_color.dart';
import 'package:front/controller/main_controller.dart';
import 'package:front/controller/navigation_controller.dart';
import 'package:front/view/pages/type_page.dart';

class NavigateButton extends StatefulWidget {
  final TypePage type;
  final MainController? controller;

  const NavigateButton({
    super.key,
    required this.type,
    this.controller,
  });

  @override
  State<NavigateButton> createState() => _NavigateButtonState();
}

class _NavigateButtonState extends State<NavigateButton> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      decoration: BoxDecoration(
        color: AppColors.primaryColor2,
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: TextButton(
        onPressed: _isLoading ? null : () => _handlePress(context),
        style: TextButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
        ),
        child: _isLoading
            ? const CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white))
            : const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Suivant'),
            SizedBox(width: 8),
            Icon(Icons.chevron_right),
          ],
        ),
      ),
    );
  }

  void _handlePress(BuildContext context) {
    if (!_isLoading) {
      setState(() {
        _isLoading = true;
      });

      // Simulate navigation or other asynchronous operation
      Future.delayed(const Duration(seconds: 1), () {
        NavigationController().navigateTo(context, widget.type, widget.controller);

        // Ensure we're still mounted before calling setState in case the widget was disposed
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
        }
      });
    }
  }
}