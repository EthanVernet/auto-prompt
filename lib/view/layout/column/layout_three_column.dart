import 'package:flutter/material.dart';

class LayoutTripleColumn extends StatelessWidget {
  final Widget leftWidget;
  final Widget middleWidget;
  final Widget rightWidget;
  final double leftSize;
  final double middleSize;
  final double rightSize;
  final bool isLeftFlex;
  final bool isMiddleFlex;
  final bool isRightFlex;

  LayoutTripleColumn({
    Key? key,
    required this.leftWidget,
    required this.middleWidget,
    required this.rightWidget,
    this.leftSize = 1,
    this.middleSize = 1,
    this.rightSize = 1,
    this.isLeftFlex = true,
    this.isMiddleFlex = true,
    this.isRightFlex = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];

    // Left widget configuration
    if (isLeftFlex) {
      children.add(Expanded(flex: leftSize.round(), child: leftWidget));
    } else {
      children.add(Container(width: leftSize, child: leftWidget));
    }

    // Middle widget configuration
    if (isMiddleFlex) {
      children.add(Expanded(flex: middleSize.round(), child: middleWidget));
    } else {
      children.add(Container(width: middleSize, child: middleWidget));
    }

    // Right widget configuration
    if (isRightFlex) {
      children.add(Expanded(flex: rightSize.round(), child: rightWidget));
    } else {
      children.add(Container(width: rightSize, child: rightWidget));
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }
}
