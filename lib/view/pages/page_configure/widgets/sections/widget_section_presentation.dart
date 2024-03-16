import 'package:flutter/material.dart';
import 'package:front/app/app_color.dart'; // Assurez-vous que le chemin est correct
import 'package:front/logic/model/section/section_model.dart';

class WidgetSectionPresentation extends StatefulWidget {
  final SectionModel section;
  final VoidCallback onDelete;
  final Function(String title, String content) onUpdate;

  const WidgetSectionPresentation({
    Key? key,
    required this.section,
    required this.onDelete,
    required this.onUpdate,
  }) : super(key: key);

  @override
  State<WidgetSectionPresentation> createState() => _WidgetSectionPresentationState();
}

class _WidgetSectionPresentationState extends State<WidgetSectionPresentation> {
  late final titleController = TextEditingController();
  late final contentController = TextEditingController();
  final FocusNode titleFocusNode = FocusNode();
  final FocusNode contentFocusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    titleFocusNode.addListener(_onFocusChange);
    contentFocusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    final hasFocus = titleFocusNode.hasFocus || contentFocusNode.hasFocus;
    if (_isFocused != hasFocus) {
      setState(() {
        _isFocused = hasFocus;
      });
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    titleFocusNode.dispose();
    contentFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _isFocused ? AppColors.greyBackground : AppColors.lightBackground,
      height: 82,
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 8),
                      Container(
                        height: 24,
                        alignment: Alignment.centerLeft,
                        child: TextFormField(
                          controller: titleController,
                          focusNode: titleFocusNode,
                          onChanged: (value) => widget.onUpdate(value, contentController.text),
                          decoration: const InputDecoration(
                            hintText: 'Titre',
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              color: AppColors.actionColor,
                            ),
                          ),
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: contentController,
                          focusNode: contentFocusNode,
                          onChanged: (value) => widget.onUpdate(titleController.text, value),
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          decoration: const InputDecoration(
                            hintText: 'Contenu',
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              color: AppColors.actionColor,
                            ),
                          ),
                          style: const TextStyle(fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 52,
                  child: IconButton(
                    icon: const Icon(Icons.delete, color: AppColors.actionColor),
                    onPressed: widget.onDelete,
                  ),
                ),
                const SizedBox(width: 16),
              ],
            ),
          ),
          Container(
            height: 1,
            color: AppColors.lightGreyBorder,
          ),
        ],
      ),
    );
  }
}
