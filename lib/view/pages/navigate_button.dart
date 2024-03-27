import 'package:flutter/material.dart';
<<<<<<< Updated upstream
import 'package:front/app/app_color.dart';
import 'package:front/controller/controller_project.dart';
=======
import 'package:front/controller/controller_configure_project.dart';
>>>>>>> Stashed changes
import 'package:front/controller/navigation_controller.dart';
import 'package:front/view/pages/type_page.dart';
import 'package:front/view/widgets/button.dart'; // Assurez-vous que le chemin d'importation est correct

class NavigateButton extends StatefulWidget {
  final TypePage type;
<<<<<<< Updated upstream
  final ControllerProject? controller;
=======
  final ControllerConfigureProject? controller;
>>>>>>> Stashed changes

  const NavigateButton({Key? key, required this.type, this.controller}) : super(key: key);

  @override
  State<NavigateButton> createState() => _NavigateButtonState();
}

class _NavigateButtonState extends State<NavigateButton> {
  bool _isLoading = false;

  void _attemptNavigate() {
    if (!_isLoading) {
      _handlePress();
    }
  }

  void _handlePress() {
    setState(() {
      _isLoading = true;
    });

    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        NavigationController().navigateTo(context, widget.type, widget.controller);

        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Button(
      boldTitle: 'Suivant',
      normalTitle: '',
      onPressed: _attemptNavigate,
      isLoading: _isLoading,
    );
  }
}
