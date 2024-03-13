import 'package:flutter/material.dart';
import 'package:front/app/app_color.dart';
import 'package:front/controller/main_controller.dart';
import 'package:front/view/layout/column/layout_dual_column.dart';
import 'package:front/view/layout/column/layout_three_row.dart';
import 'package:front/view/layout/my_app_bar.dart';
import 'package:front/view/pages/i_pages.dart';
import 'package:front/view/pages/navigate_button.dart';
import 'package:front/view/pages/page_select/widgets/selectable_control_buttons.dart';
import 'package:front/view/pages/page_select/widgets/selectable_folder_tabs.dart';
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
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 400),
      child: Scaffold(
        appBar: MyAppBar(title: ValueNotifier<String>('Sélection'), isBack: false),
        body: LayoutThreeRow(
          topWidget: const SizedBox(),
          middleWidget: SelectableFolderTabs(controller: widget.controller),
          isTopFlex: false,
          topSize: 24,
          bottomWidget: LayoutDualColumn(
            leftWidget: SelectableControlButtons(controller: widget.controller),
            rightWidget: NavigateButton(type: TypePage.PAGE_COPY, controller: widget.controller),
            leftSize: 3,
            rightSize: 1,
          ),
          isBottomFlex: false,
          bottomSize: 78,
        ),
        bottomNavigationBar: Container(
          color: AppColors.primaryColor1,
          height: 8.0,
        ),
      ),
    );
  }
}