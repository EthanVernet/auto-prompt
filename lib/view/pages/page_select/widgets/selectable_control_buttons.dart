import 'package:flutter/material.dart';
import 'package:front/app/app_color.dart';
import 'package:front/controller/main_controller.dart';

class SelectableControlButtons extends StatelessWidget {
  final MainController controller;

  const SelectableControlButtons({Key? key, required this.controller}) : super(key: key);

  static const TextStyle buttonTextStyle = TextStyle(
    fontSize: 12,
    color: AppColors.lightBackground,
  );

  static final ButtonStyle buttonStyle = TextButton.styleFrom(
    backgroundColor: AppColors.actionColor,
    padding: const EdgeInsets.symmetric(horizontal: 10),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
  );

  void _onButtonPressed(bool selectAll) {
    if (selectAll) {
      controller.selectAllFiles();
    } else {
      controller.deselectAllFiles();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 16),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
                color: AppColors.actionColor,
                width: 1
            ),
            borderRadius: BorderRadius.circular(5),
            color: AppColors.actionColor,
          ),
          width: 230,
          height: 24,
          child: TextButton(
            onPressed: () => _onButtonPressed(true),
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              foregroundColor: AppColors.lightBackground,
              textStyle: const TextStyle(fontSize: 12),
            ),
            child: RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'Select ',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                  TextSpan(
                    text: 'All',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 33,),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
                color: AppColors.actionColor,
                width: 1
            ),
            borderRadius: BorderRadius.circular(5),
            color: AppColors.actionColor,
          ),
          width: 176,
          height: 24,
          child: TextButton(
            onPressed: () =>_onButtonPressed(false),
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              foregroundColor: AppColors.lightBackground,
              textStyle: const TextStyle(fontSize: 12),
            ),
            child: RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'Deselect ',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                  TextSpan(
                    text: 'All',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
