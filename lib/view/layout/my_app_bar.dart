import 'package:flutter/material.dart';
import 'package:front/app/app_color.dart';
import 'package:front/view/layout/three_point_vue.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isBack;
  final String title;
  final bool hasStep;
  final String titleStep;
  final int indexStep;

  MyAppBar({
    Key? key,
    this.isBack = false,
    required this.title,
    this.hasStep = false,
    this.titleStep = "",
    this.indexStep = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      decoration: BoxDecoration(
        color: AppColors.darkBackground,
        border: Border.all(color: AppColors.darkBorder),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 52,
            alignment: Alignment.center,
            child: isBack
                ? GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back, size: 24, color: AppColors.lightBackground),
            )
                : Image.asset('assets/icons/rocket.png', width: 24, height: 24),
          ),
          Container(width: 1, color: AppColors.darkBorder),
          Container(
            width: 208,
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Current Project:",
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.normal,
                    color: AppColors.lightBackground,
                  ),
                ),
                Text(
                  title,
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.lightBackground),
                ),
              ],
            ),
          ),
          Container(width: 1, color: AppColors.darkBorder),
          Container(
            width: 208,
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: hasStep
                ? Row(
              children: [
                Container(
                    width: 81,
                    child:  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Step:",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.normal,
                            color: AppColors.lightBackground,
                          ),
                        ),
                        Text(
                          titleStep,
                          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.lightBackground),
                        ),
                      ],
                    )
                ),
                indexStep > 0
                    ? ThreePointVue(step: indexStep)
                    : const SizedBox.shrink()
              ],
            )
                : const SizedBox.shrink(),
          ),
          Container(width: 1, color: AppColors.darkBorder),
          const Expanded(child: SizedBox()),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(52);
}
