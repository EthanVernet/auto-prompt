import 'package:flutter/material.dart';
import 'package:front/core/app_color.dart';
import 'package:front/controller/setting_controller.dart';
import 'package:front/view/layout/my_app_bar.dart';
import 'package:front/view/pages/i_pages.dart';
import 'package:front/view/pages/page_setting/widget/llm_selector.dart';

class PageSetting extends StatelessWidget implements IPages {
  final SettingController controller;

  PageSetting({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'Settings',
        hasStep: false,
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
                  child: LLMSelector(controller: controller,),
                ),
                Container(
                  width: 1,
                  color: AppColors.lightGreyBorder,
                ),
                const Expanded(child: SizedBox.shrink())
              ],
            ),
          ),
          Container(
            height: 1,
            color: AppColors.lightGreyBorder,
          ),
        ],
      ),
      backgroundColor: AppColors.lightBackground,
    );
  }
}
