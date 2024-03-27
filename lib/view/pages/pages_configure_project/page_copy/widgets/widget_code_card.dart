import 'package:flutter/material.dart';
import 'package:front/core/app_color.dart';
import 'package:front/controller/controller_configure_project.dart';

class WidgetCodeCard extends StatelessWidget {
  final ControllerConfigureProject controller;

  const WidgetCodeCard({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          color: AppColors.lightBackground,
          child: TextFormField(
            controller: TextEditingController(text: controller.getFinalContent()),
            maxLines: null,
            style: const TextStyle(fontFamily: 'monospace', fontSize: 12),
          ),
        )
      )
    );
  }
}
