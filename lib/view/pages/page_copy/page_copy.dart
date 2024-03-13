import 'package:flutter/material.dart';
import 'package:front/app/app_color.dart';
import 'package:front/controller/main_controller.dart';
import 'package:front/view/layout/my_app_bar.dart';
import 'package:front/view/pages/i_pages.dart';
import 'package:front/view/pages/page_copy/widgets/widget_display_prompt.dart';

class PageCopy extends StatelessWidget implements IPages  {
  final MainController controller;

  const PageCopy({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 400),
      child :Scaffold(
        appBar: MyAppBar(title: ValueNotifier<String>('Copie'), isBack: true),
        body: WidgetDisplayPrompt(controller: controller),
        bottomNavigationBar: Container(
          color: AppColors.primaryColor1,
          height: 8.0,
        ),
      ),
    );
  }
}
