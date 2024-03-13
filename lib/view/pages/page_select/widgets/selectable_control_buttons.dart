import 'package:flutter/material.dart';
import 'package:front/app/app_color.dart';
import 'package:front/controller/main_controller.dart';

class SelectableControlButtons extends StatelessWidget {
  final MainController controller;

  const SelectableControlButtons({Key? key, required this.controller}) : super(key: key);

  void _selectAllFiles() {
    controller.selectAllFiles();
  }

  void _deselectAllFiles() {
    controller.deselectAllFiles();
  }

  Widget _buildButton({required VoidCallback onPressed, required String label, required IconData icon}) {
    return Container(
      height: 50.0,
      decoration: BoxDecoration(
        color: AppColors.primaryColor2,
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(label),
            const SizedBox(width: 8),
            Icon(icon),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start, // Modifié pour aligner à droite
      children: [
        _buildButton(
          onPressed: _selectAllFiles,
          label: 'Tout sélectionner',
          icon: Icons.check_circle,
        ),
        const SizedBox(width: 16), // Espacement fixe entre les boutons
        _buildButton(
          onPressed: _deselectAllFiles,
          label: 'Tout désélectionner',
          icon: Icons.remove_circle_outline,
        ),
      ],
    );
  }
}
