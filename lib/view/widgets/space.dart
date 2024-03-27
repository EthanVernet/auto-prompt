import 'package:flutter/material.dart';
import 'package:front/core/app_constant.dart';

class Space extends StatelessWidget {
  final bool inColumn;

  const Space({super.key, required this.inColumn});

  @override
  Widget build(BuildContext context) {
    return inColumn
        ? Container(height: AppConstants.space)
        : Container(width: AppConstants.space);
  }
}
