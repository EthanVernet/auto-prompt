import 'package:flutter/material.dart';
import 'package:front/app/app_color.dart';
import 'package:front/controller/main_controller.dart';
import 'package:front/logic/model/folder/folder_model.dart';
import 'package:front/view/layout/my_app_bar.dart';
import 'package:front/view/pages/i_pages.dart';
import 'package:front/view/pages/navigate_button.dart';
import 'package:front/view/pages/page_select/widgets/selectable_control_buttons.dart';
import 'package:front/view/pages/page_select/widgets/selectable_file_list.dart';
import 'package:front/view/pages/page_select/widgets/widget_folder_tree.dart';
import 'package:front/view/pages/type_page.dart';

class PageSelect extends StatefulWidget implements IPages {
  final MainController controller;

  const PageSelect({Key? key, required this.controller}) : super(key: key);

  @override
  _PageSelectState createState() => _PageSelectState();
}

class _PageSelectState extends State<PageSelect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'Default',
        hasStep: true,
        titleStep: 'Select',
        isBack: true,
        indexStep: 2,
      ),
      body: Column(
        children: [
          Container(
            height: 54,
            color: AppColors.greyBackground,
            alignment: Alignment.centerLeft,
            child: const Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Text(
                'Prompt Configuration Section',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
          Container(
            height: 54,
            color: AppColors.greyBackground,
            child: Row(
              children: [
                Container(
                  width: 262,
                  color: AppColors.greyBackground,
                  alignment: Alignment.centerLeft,
                  child: const Padding(
                    padding: EdgeInsets.only(left: 16.0),
                    child: Text(
                      'Select Folder Project',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                ValueListenableBuilder<FolderModel?>(
                  valueListenable: widget.controller.selectController.selectedFolderNotifier,
                  builder: (_, FolderModel? selectedFolder, __) {
                    String folderName = selectedFolder != null ? " in ${selectedFolder.fileName}" : "";
                    return Expanded(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: 'Select File',
                              style: TextStyle(fontSize: 18, color: AppColors.darkBackground),
                            ),
                            if (selectedFolder != null)
                              TextSpan(
                                text: folderName,
                                style: const TextStyle(fontSize: 18, color: AppColors.actionColor),
                              ),
                          ],
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Container(height: 1, color: AppColors.lightGreyBorder),
          Expanded(
            child: Container(
              color: AppColors.lightBackground,
              child: Row(
                children: [
                  Container(
                    width: 262,
                    color: AppColors.lightBackground,
                    child: WidgetFolderTree(controller: widget.controller),
                  ),
                  Container(
                    width: 1,
                    color: AppColors.lightGreyBorder,
                  ),
                  Expanded(
                    child: SelectableFileList(controller: widget.controller),
                  ),
                ],
              ),
            ),
          ),
          Container(height: 1, color: AppColors.lightGreyBorder),
          Container(
            height: 54,
            color: AppColors.greyBackground,
            child: Row(
              children: [
                Container(
                  color: AppColors.greyBackground,
                  child: SelectableControlButtons(controller: widget.controller),
                ),
                const Expanded(child: SizedBox.shrink()),
                Container(
                  width: 176,
                  color: AppColors.greyBackground,
                  child: NavigateButton(type: TypePage.PAGE_COPY, controller: widget.controller),
                ),
                const SizedBox(width: 16,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
