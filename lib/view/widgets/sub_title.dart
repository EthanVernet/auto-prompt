import 'package:flutter/material.dart';
import 'package:front/core/app_color.dart';

class SubTitleWidget extends StatelessWidget {
  final String title;
  final String? additionalText; // Nouveau paramètre optionnel pour le texte supplémentaire

  const SubTitleWidget({
    super.key,
    required this.title,
    this.additionalText, // Le texte supplémentaire est null par défaut
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 262,
      color: AppColors.greyBackground,
      height: 54,
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: title,
                style: const TextStyle(fontSize: 18, color: Colors.black), // Style du titre principal
              ),
              if (additionalText != null) // Vérifie si un texte supplémentaire a été fourni
                TextSpan(
                  text: additionalText,
                  style: const TextStyle(fontSize: 18, color: AppColors.actionColor), // Style du texte supplémentaire
                ),
            ],
          ),
          overflow: TextOverflow.ellipsis, // Gère le dépassement de texte
        ),
      ),
    );
  }
}
