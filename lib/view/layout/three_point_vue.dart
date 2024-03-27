import 'package:flutter/material.dart';
import 'package:front/core/app_color.dart';

class ThreePointVue extends StatelessWidget {
  final int step;

  ThreePointVue({super.key, required this.step});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomLeft,
      height: 52,
      // Ajouter un Padding widget ici pour envelopper le Row
      child: Padding(
        padding: const EdgeInsets.only(bottom: 11), // Bottom padding de 4px
        child: Row(
          children: [
            buildCircle(1), // Premier cercle
            const SizedBox(width: 4),
            buildCircle(2), // Deuxième cercle
            const SizedBox(width: 4),
            buildCircle(3), //// Troisième cercle
          ],
        ),
      ),
    );
  }

  Widget buildCircle(int index) {
    return Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        color: step == index ? AppColors.actionColor : AppColors.greyBackground,
        shape: BoxShape.circle,
      ),
    );
  }
}
