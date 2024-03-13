import 'package:flutter/material.dart';
import 'package:front/controller/main_controller.dart';
import 'package:front/app/app_color.dart';

class WidgetExtensionSelector extends StatefulWidget {
  final MainController controller;
  const WidgetExtensionSelector({Key? key, required this.controller}) : super(key: key);

  @override
  _WidgetExtensionSelectorState createState() => _WidgetExtensionSelectorState();
}

class _WidgetExtensionSelectorState extends State<WidgetExtensionSelector> {
  String? selectedLanguage;

  @override
  void initState() {
    super.initState();
    selectedLanguage = widget.controller.getProgrammingLanguages().first;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0, // Définir une hauteur fixe correspondant à celle du bouton de sélection de répertoire
      decoration: const ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)), // Bords plus arrondis
        ),
        color: AppColors.primaryColor2, // Couleur de fond personnalisée
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0), // Ajustez au besoin pour le padding extérieur
      child: DropdownButtonHideUnderline( // Pour supprimer la ligne sous le DropdownButton
        child: ButtonTheme(
          alignedDropdown: true, // Pour que le dropdown soit aligné avec le ButtonTheme
          child: DropdownButton<String>(
            value: selectedLanguage,
            isExpanded: true, // Pour que le DropdownButton occupe tout l'espace horizontal
            onChanged: (String? newValue) {
              setState(() {
                selectedLanguage = newValue;
                widget.controller.setSelectedLanguage(newValue!);
              });
            },
            items: widget.controller.getProgrammingLanguages().map<DropdownMenuItem<String>>((String language) {
              return DropdownMenuItem<String>(
                value: language,
                child: Container(
                  padding: const EdgeInsets.only(left: 16.0), // Décaler le texte vers la droite
                  child: Text(
                    language,
                    style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white), // Texte en gras et blanc
                  ),
                ),
              );
            }).toList(),
            iconEnabledColor: Colors.white, // Couleur de l'icône
            dropdownColor: AppColors.primaryColor2, // Pour que le menu déroulant corresponde à la couleur de fond
          ),
        ),
      ),
    );
  }
}
