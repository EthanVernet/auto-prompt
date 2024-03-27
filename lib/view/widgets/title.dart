import 'package:flutter/material.dart';
import 'package:front/core/app_color.dart';

class TitleWidget extends StatelessWidget {
  final String title;

  const TitleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.greyBackground,
      height: 54,
      alignment: Alignment.centerLeft,
      child : Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Text(
          title,
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
