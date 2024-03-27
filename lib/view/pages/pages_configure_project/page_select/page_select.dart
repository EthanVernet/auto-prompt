import 'package:flutter/material.dart';
import 'package:front/core/app_color.dart';
import 'package:front/controller/controller_configure_project.dart';
import 'package:front/view/layout/my_app_bar.dart';
import 'package:front/view/pages/i_pages.dart';
import 'package:front/view/pages/navigate_button.dart';
import 'package:front/view/pages/type_page.dart';
import 'package:front/view/widgets/border.dart';
import 'package:front/view/widgets/space.dart';
import 'package:front/view/widgets/sub_title.dart';
import 'package:front/view/widgets/title.dart';

import 'widgets/files/widget_file_button_deselect_all.dart';
import 'widgets/files/widget_file_button_select_all.dart';
import 'widgets/files/widget_file_list.dart';
import 'widgets/folders/widget_folder_list.dart';
import 'widgets/folders/widget_folder_sub_title.dart';

class PageSelect extends StatefulWidget implements IPages {
  final ControllerConfigureProject controller;

  const PageSelect({Key? key, required this.controller}) : super(key: key);

  @override
  _PageSelectState createState() => _PageSelectState();
}

class _PageSelectState extends State<PageSelect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: 'Default',
        hasStep: true,
        titleStep: 'Select',
        isBack: true,
        indexStep: 2,
      ),
      body: Column(
        children: [
          const TitleWidget(title: 'File Selection Widget'),
          Container(
            height: 54,
            color: AppColors.greyBackground,
            child: Row(
              children: [
                const SubTitleWidget(title: 'Select Folder Project'),
                WidgetFolderSubtitle(controller: widget.controller),
              ],
            ),
          ),
          const BorderWidget(inColumn: true, color: AppColors.lightGreyBorder),
          Expanded(
            child: Row(
              children: [
                WidgetFolderList(controller: widget.controller),
                const BorderWidget(inColumn: false, color: AppColors.lightGreyBorder),
                Expanded(
                  child: SelectableFileList(controller: widget.controller),
                ),
              ],
            ),
          ),
          const BorderWidget(inColumn: true, color: AppColors.lightGreyBorder),
          Container(
            height: 54,
            color: AppColors.greyBackground,
            child: Row(
              children: [
                const Space(inColumn: false),
                WidgetFileButtonSelectAll(
                  controller: widget.controller,
                  onSelected: () {
                    setState(() {});
                  },
                ),
                const Space(inColumn: false),
                const Space(inColumn: false),
                WidgetFileButtonDeselectAll(
                    controller: widget.controller,
                    onDeselected: () {
                      setState(() {});
                  },
                ),
                const Expanded(child: SizedBox.shrink()),
                NavigateButton(
                    type: TypePage.PAGE_COPY,
                    controller: widget.controller
                ),
                const Space(inColumn: false)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
