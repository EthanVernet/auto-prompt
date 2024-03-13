import 'package:flutter/material.dart';

class LayoutThreeRow extends StatefulWidget {
  final Widget topWidget;
  final Widget middleWidget;
  final Widget bottomWidget;
  final double topSize;
  final double middleSize;
  final double bottomSize;
  final bool isTopFlex;
  final bool isMiddleFlex;
  final bool isBottomFlex;

  const LayoutThreeRow({
    Key? key,
    required this.topWidget,
    required this.middleWidget,
    required this.bottomWidget,
    this.topSize = 1,
    this.middleSize = 1,
    this.bottomSize = 1,
    this.isTopFlex = true,
    this.isMiddleFlex = true,
    this.isBottomFlex = true,
  }) : super(key: key);

  @override
  _LayoutThreeRowState createState() => _LayoutThreeRowState();
}

class _LayoutThreeRowState extends State<LayoutThreeRow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          widget.isTopFlex
              ? Expanded(
            flex: widget.topSize.round(), // Convertir en int pour flex
            child: widget.topWidget,
          )
              : SizedBox(
            height: widget.topSize, // Utiliser directement pour la hauteur en pixels
            child: widget.topWidget,
          ),
          widget.isMiddleFlex
              ? Expanded(
            flex: widget.middleSize.round(), // Convertir en int pour flex
            child: widget.middleWidget,
          )
              : SizedBox(
            height: widget.middleSize, // Utiliser directement pour la hauteur en pixels
            child: widget.middleWidget,
          ),
          widget.isBottomFlex
              ? Expanded(
            flex: widget.bottomSize.round(), // Convertir en int pour flex
            child: widget.bottomWidget,
          )
              : SizedBox(
            height: widget.bottomSize, // Utiliser directement pour la hauteur en pixels
            child: widget.bottomWidget,
          ),
        ],
      ),
    );
  }
}
