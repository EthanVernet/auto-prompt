import 'package:flutter/material.dart';
import 'package:front/app/app_color.dart';
import 'package:front/controller/main_controller.dart';
import 'package:front/view/layout/column/layout_dual_column.dart';
import 'package:front/view/layout/column/layout_three_row.dart';
import 'package:front/view/layout/my_app_bar.dart';
import 'package:front/view/pages/i_pages.dart';
import 'package:front/view/pages/navigate_button.dart';
import 'package:front/view/pages/page_configure/widgets/widget_extension_selector.dart';
import 'package:front/view/pages/page_configure/widgets/widget_file_picker.dart';
import 'package:front/view/pages/page_configure/widgets/sections/widget_section_list.dart';
import 'package:front/view/pages/type_page.dart';

class PageConfigure extends StatelessWidget implements IPages {
  final MainController controller;

  PageConfigure({Key? key})
      : controller = MainController(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 400),
      child: Scaffold(
        appBar: MyAppBar(title: ValueNotifier<String>('Configure'), isBack: false),
        body: LayoutThreeRow(
          topWidget: LayoutDualColumn(
            leftWidget: WidgetFilePicker(controller: controller),
            rightWidget: WidgetExtensionSelector(controller: controller),
            leftSize: 3,
            rightSize: 200,
            isRightFlex: false,
          ),
          isTopFlex : false,
          topSize: 78,
          middleWidget: WidgetSectionsList(controller: controller),
          middleSize: 8,
          bottomWidget: LayoutDualColumn(
            leftWidget: SizedBox(),
            rightWidget: NavigateButton(type: TypePage.PAGE_SELECT, controller: controller),
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
