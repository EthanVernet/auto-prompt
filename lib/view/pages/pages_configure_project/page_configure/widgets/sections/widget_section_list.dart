import 'package:flutter/material.dart';
import 'package:front/controller/controller_configure_project.dart';
import 'package:front/logic/model/section/section_model.dart';

import 'widget_section_card.dart';

class WidgetSectionList extends StatelessWidget {
  final ControllerConfigureProject controller;

  WidgetSectionList({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sections = controller.getSections();
    return Expanded(
      child: ListView.builder(
        itemCount: sections.length,
        itemBuilder: (context, index) {
          SectionModel section = sections[index];
          return WidgetSectionCard(
            section: section,
            onDelete: () {
              controller.removeSection(index);
            },
            onUpdate: (title, content) {
              controller.updateSection(index, title, content);
            },
          );
        },
      ),
    );
  }
}
