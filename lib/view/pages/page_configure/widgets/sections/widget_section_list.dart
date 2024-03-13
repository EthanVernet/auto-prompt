import 'package:flutter/material.dart';
import 'package:front/controller/main_controller.dart';
import 'package:front/logic/model/section/section_model.dart';
import 'package:front/view/pages/page_configure/widgets/sections/widget_section_presentation.dart';

class WidgetSectionsList extends StatefulWidget {
  final MainController controller;
  WidgetSectionsList({Key? key, required this.controller}) : super(key: key);

  @override
  _WidgetSectionsListState createState() => _WidgetSectionsListState();
}

class _WidgetSectionsListState extends State<WidgetSectionsList> {
  void _addSection() {
    widget.controller.addSection("Nouveau Titre", "Nouveau Contenu");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var sections = widget.controller.getSections();
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: sections.length,
            itemBuilder: (context, index) {
              SectionModel section = sections[index];
              return WidgetSectionPresentation(
                section: section,
                onDelete: () {
                  widget.controller.removeSection(index);
                  setState(() {});
                },
                onUpdate: (title, content) {
                  widget.controller.updateSection(index, title, content);
                  setState(() {});
                },
              );
            },
          ),
        ),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: _addSection,
        ),
      ],
    );
  }
}
