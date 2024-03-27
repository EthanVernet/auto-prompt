import 'package:flutter/material.dart';
import 'package:front/core/app_color.dart';
import 'package:front/controller/controller_configure_project.dart';
import 'package:front/view/layout/my_app_bar.dart';
import 'package:front/view/pages/i_pages.dart';
import 'package:front/view/pages/pages_configure_project/page_copy/widgets/widget_code_card.dart';
import 'package:front/view/pages/pages_configure_project/page_copy/widgets/widget_copy_button.dart';
import 'package:front/view/widgets/border.dart'; // Ensure BorderWidget is a custom widget that exists
import 'package:front/view/widgets/space.dart'; // Ensure Space is a custom widget that exists
import 'package:front/view/widgets/title.dart'; // Ensure TitleWidget is a custom widget that exists

class PageCopy extends StatelessWidget implements IPages {
  final ControllerConfigureProject controller;

  const PageCopy({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar( // Removed const if your widget depends on parameters that can change
        title: 'Default',
        hasStep: true,
        titleStep: 'Copy',
        indexStep: 3,
        isBack: true,
      ),
      body: Column(
        children: [
          const TitleWidget(title: 'Copy Prompt View'), // Assuming TitleWidget is your custom widget
          const BorderWidget(inColumn: true, color: AppColors.lightGreyBorder), // Assuming BorderWidget is your custom widget
          Expanded(
            child: WidgetCodeCard(controller: controller), // Adjusted the name, assuming it's a custom widget
          ),
          const BorderWidget(inColumn: true, color: AppColors.lightGreyBorder), // Assuming BorderWidget is your custom widget
          Container(
            color: AppColors.lightBackground,
            height: 54,
            child: Row(
              children: [
                const Expanded(child: SizedBox.shrink()),
                WidgetCopyButton(textController: TextEditingController(text: controller.getFinalContent())), // Ensure generateFinalContent() exists in controller
                const Space(inColumn: false) // Assuming Space is a custom widget
              ],
            ),
          ),
        ],
      ),
    );
  }
}
