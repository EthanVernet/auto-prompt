import 'package:flutter/material.dart';
import 'package:front/core/app_color.dart';
import 'package:front/controller/controller_configure_project.dart';
import 'package:front/view/layout/my_app_bar.dart';
import 'package:front/view/pages/i_pages.dart';
import 'package:front/view/pages/navigate_button.dart';
import 'package:front/view/pages/type_page.dart';
import 'package:front/view/widgets/border.dart';
import 'package:front/view/widgets/space.dart';
import 'package:front/view/widgets/title.dart';
import 'package:sqflite/sqflite.dart';

import 'widgets/file_picker/widget_file_picker_button.dart';
import 'widgets/file_picker/widget_file_picker_text.dart';
import 'widgets/sections/widget_section_button.dart';
import 'widgets/sections/widget_section_list.dart';
import 'widgets/widget_extension_picker.dart';

class PageConfigure extends StatefulWidget implements IPages {
  final Database db;
  final ControllerConfigureProject controller;

  PageConfigure({super.key, required this.db})
      : controller = ControllerConfigureProject(db);

  @override
  _PageConfigureState createState() => _PageConfigureState();
}

class _PageConfigureState extends State<PageConfigure> {
  void _refreshList() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      appBar: const MyAppBar(
        title: 'Default',
        hasStep: true,
        titleStep: 'Configure',
        indexStep: 1,
      ),
      body: Column(
        children: [
          const TitleWidget(title: 'Prompt Configuration Section'),
          const BorderWidget(
              inColumn: true,
              color: AppColors.lightGreyBorder
          ),
          SizedBox(
            height: 54,
            child: Row(
              children: [
                const Space(inColumn: false),
                WidgetExtensionPicker(controller: widget.controller),
                const Space(inColumn: false),
                const BorderWidget(inColumn: false, color: AppColors.lightGreyBorder
                ),
                const Space(inColumn: false),
                WidgetFilePickerButton(
                  controller: widget.controller,
                  onDirectoryPicked: _refreshList,
                ),
                const Space(inColumn: false),
                WidgetFilePickerText(controller: widget.controller),
                const Space(inColumn: false),
              ],
            ),
          ),
          const BorderWidget(inColumn: true, color: AppColors.lightGreyBorder),
          WidgetSectionList(controller: widget.controller),
          const BorderWidget(inColumn: true, color: AppColors.lightGreyBorder),
          SizedBox(
            height: 54,
            child: Row(
              children: [
                const Expanded(child: SizedBox.shrink()),
                WidgetSectionButton(
                    controller: widget.controller,
                    onSectionAdded: _refreshList
                ),
                const Space(inColumn: false),
              ],
            )
          ),
          const BorderWidget(inColumn: true, color: AppColors.lightGreyBorder),
          Container(
            color: AppColors.greyBackground,
            height: 54,
            child: Row(
              children: [
                const Expanded(child: SizedBox.shrink()),
                NavigateButton(
                    type: TypePage.PAGE_SELECT,
                    controller: widget.controller
                ),
                const Space(inColumn: false),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
