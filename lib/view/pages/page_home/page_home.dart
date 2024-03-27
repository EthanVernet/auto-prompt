import 'package:flutter/material.dart';
import 'package:front/core/app_color.dart';
import 'package:front/view/layout/my_app_bar.dart';
import 'package:front/view/pages/i_pages.dart';

class PageHome extends StatelessWidget implements IPages {
  PageHome({super.key});

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

          )
        ],
      ),
      backgroundColor: AppColors.lightBackground,
    );
  }
}
