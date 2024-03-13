import 'package:flutter/material.dart';

class LayoutDualRow extends StatefulWidget {
  final Widget topWidget;
  final Widget bottomWidget;
  final int topFlex;
  final int bottomFlex;
  final bool isTopFlex;
  final bool isBottomFlex;

  const LayoutDualRow({
    Key? key,
    required this.topWidget,
    required this.bottomWidget,
    this.topFlex = 1,
    this.bottomFlex = 1,
    this.isTopFlex = true,
    this.isBottomFlex = true,
  }) : super(key: key);

  @override
  _LayoutDualRowState createState() => _LayoutDualRowState();
}

class _LayoutDualRowState extends State<LayoutDualRow> {
  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];

    if (widget.isTopFlex) {
      children.add(
        Expanded(
          flex: widget.topFlex,
          child: widget.topWidget,
        ),
      );
    } else {
      children.add(
        Container(
          // Vous pouvez utiliser une hauteur fixe ou toute autre propriété pour déterminer la taille du widget non-flexible
          child: widget.topWidget,
        ),
      );
    }

    children.add(const SizedBox(height: 20)); // Espacement entre les deux widgets

    if (widget.isBottomFlex) {
      children.add(
        Expanded(
          flex: widget.bottomFlex,
          child: widget.bottomWidget,
        ),
      );
    } else {
      children.add(
        Container(
          // Vous pouvez utiliser une hauteur fixe ou toute autre propriété pour déterminer la taille du widget non-flexible
          child: widget.bottomWidget,
        ),
      );
    }

    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        children: children,
      ),
    );
  }
}
