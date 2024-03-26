import 'package:flutter/material.dart';
import 'package:front/app/app_color.dart';
import 'package:front/controller/controller_project.dart';
import 'package:front/view/layout/my_app_bar.dart';
import 'package:front/view/pages/i_pages.dart';
import 'package:front/view/pages/page_copy/widgets/widget_display_prompt.dart';
import 'package:front/view/pages/page_copy/widgets/wisget_copy_button.dart';

class PageCopy extends StatelessWidget implements IPages {
  final ControllerProject controller;

  const PageCopy({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'Default',
        hasStep: true,
        titleStep: 'Copy',
        indexStep: 3,
        isBack: true,
      ),
      body: Column(
        children: [
          DecoratedBox(
            decoration: const BoxDecoration(color: AppColors.greyBackground),
            child: Container(
              height: 52,
              alignment: Alignment.centerLeft,
              child: const Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Text(
                  'Copy Prompt View',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
          ),
          Container(width: double.infinity, height: 1, color: AppColors.lightGreyBorder),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                color: AppColors.lightBackground,
                child: WidgetDisplayContent(controller: controller),
              ),
            ),
          ),
          Container(width: double.infinity, height: 1, color: AppColors.lightGreyBorder),
          DecoratedBox(
            decoration: const BoxDecoration(color: AppColors.greyBackground),
            child: Container(
              height: 52,
              child: Row(
                children: [
                  Spacer(),
                  SizedBox(
                    width: 176,
                    child: WidgetCopyButton(textController: TextEditingController(text: controller.generateFinalContent())),
                  ),
                  SizedBox(width: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
