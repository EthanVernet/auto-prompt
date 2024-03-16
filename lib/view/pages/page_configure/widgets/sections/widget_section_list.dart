import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front/app/app_color.dart';
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
        Container(
          height: 1,
          color: AppColors.lightGreyBorder,
        ),
        const SizedBox(height: 16,),
        Row(
          children: [
            const Expanded(child: SizedBox.shrink()),
            Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      color: AppColors.actionColor,
                      width: 1
                  ),
                  borderRadius: BorderRadius.circular(5),
                  color: AppColors.actionColor,
                ),
                width: 176,
                height: 24,
                child: TextButton(
                  onPressed: _addSection,
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    foregroundColor: AppColors.lightBackground,
                    textStyle: const TextStyle(fontSize: 12),
                  ),
                  child: RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: 'Add ',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                        TextSpan(
                          text: 'Prompt Section',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                )
            ),
            const SizedBox(width: 16,)
          ],
        ),
        const SizedBox(height: 16,)
      ],
    );
  }
}
