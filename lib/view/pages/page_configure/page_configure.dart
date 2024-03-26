import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:front/app/app_color.dart'; // Ensure this path is correct
import 'package:front/controller/controller_project.dart';
import 'package:front/view/layout/my_app_bar.dart';
import 'package:front/view/pages/i_pages.dart';
import 'package:front/view/pages/navigate_button.dart';
import 'package:front/view/pages/page_configure/widgets/sections/widget_section_list.dart';
import 'package:front/view/pages/page_configure/widgets/widget_extension_selector.dart';
import 'package:front/view/pages/page_configure/widgets/widget_file_picker.dart';
import 'package:front/view/pages/type_page.dart'; // Ensure this path is correct
// Ensure all your imports are correct and necessary packages are included in your pubspec.yaml file

class PageConfigure extends StatelessWidget implements IPages {
  final ControllerProject controller;

  PageConfigure({Key? key})
      : controller = ControllerProject(), // This will always create a new instance of MainController, ensure this is your intention
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'Default',
        hasStep: true,
        titleStep: 'Configure',
        indexStep: 1,
      ),
      body: Column(
        children: [
          Container(
            color: AppColors.greyBackground,
            height: 54,
            alignment: Alignment.centerLeft,
            child :const Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Text(
                'Prompt Configuration Section',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
          Container(
            height: 1,
            color: AppColors.lightGreyBorder,
          ),
          Container(
            color: AppColors.lightBackground,
            height: 54,
            child: Row(
              children: [
                SizedBox(
                  width: 262,
                  child: WidgetExtensionSelector(controller: controller,),
                ),
                Container(
                  width: 1,
                  color: AppColors.lightGreyBorder,
                ),
                Expanded(
                  child: WidgetFilePicker(controller: controller,),
                ),
              ],
            ),
          ),
          Container(
            height: 1,
            color: AppColors.lightGreyBorder,
          ),
          Expanded(child: WidgetSectionsList(controller: controller,)),
          Container(
            height: 1,
            color: AppColors.lightGreyBorder,
          ),
          Container(
            height: 54,
            color: AppColors.greyBackground,
            child: Row(
              children: [
                const Expanded(child: SizedBox.shrink()),
                SizedBox(
                  width: 176,
                  child: NavigateButton(type: TypePage.PAGE_SELECT, controller: controller),
                ),
                const SizedBox(width: 16),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: AppColors.lightBackground,
    );
  }
}
