import 'package:flutter/material.dart';

class BorderWidget extends StatelessWidget {
  final bool inColumn;
  final Color color;

  const BorderWidget({
    Key? key,
    required this.inColumn,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return inColumn
        ? Container(height: 1, color: color)
        : Container(width: 1, color: color);
  }
}
