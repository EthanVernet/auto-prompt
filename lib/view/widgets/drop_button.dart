import 'package:flutter/material.dart';
import 'package:front/core/app_color.dart';

class DropButton extends StatelessWidget {
  final List<String> items;
  final String? selectedItem;
  final ValueChanged<String?> onItemSelected;

  const DropButton({
    Key? key,
    required this.items,
    this.selectedItem,
    required this.onItemSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.actionColor,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: AppColors.actionColor,
          width: 1,
        ),
      ),
      height: 26,
      width: 230,
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          dropdownColor: AppColors.actionColor,
          isExpanded: true,
          iconEnabledColor: AppColors.lightBackground,
          value: selectedItem,
          onChanged: items.isNotEmpty ? onItemSelected : null,
          items: items.map<DropdownMenuItem<String>>((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  item,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: AppColors.lightBackground,
                    fontSize: 12,
                  ),
                ),
              ),
            );
          }).toList(),
          style: const TextStyle(
            color: AppColors.lightBackground,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
