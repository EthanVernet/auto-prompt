import 'package:flutter/material.dart';


class LayoutDualColumn extends StatelessWidget {
  final Widget leftWidget;
  final Widget rightWidget;
  final double leftSize;
  final double rightSize;
  final bool isLeftFlex;
  final bool isRightFlex;

  LayoutDualColumn({
    Key? key,
    required this.leftWidget,
    required this.rightWidget,
    this.leftSize = 1,
    this.rightSize = 1,
    this.isLeftFlex = true,
    this.isRightFlex = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];

    if (isLeftFlex) {
      children.add(
        Expanded(
          flex: leftSize.round(),
          child: leftWidget,
        ),
      );
    } else {
      children.add(
        Container(
          width: leftSize,
          child: leftWidget,
        ),
      );
    }

    if (isRightFlex) {
      children.add(
        Expanded(
          flex: rightSize.round(), // Utiliser rightSize comme flex si isRightFlex est true
          child: rightWidget,
        ),
      );
    } else {
      children.add(
        Container(
          width: rightSize, // Utiliser rightSize comme largeur fixe en pixels si isRightFlex est false
          child: rightWidget,
        ),
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }
}
