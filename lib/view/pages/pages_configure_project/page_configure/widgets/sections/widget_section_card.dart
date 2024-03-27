import 'package:flutter/material.dart';
import 'package:front/core/app_color.dart';
import 'package:front/logic/model/section/section_model.dart';

class WidgetSectionCard extends StatefulWidget {
  final SectionModel section;
  final VoidCallback onDelete;
  final Function(String title, String content) onUpdate;

  const WidgetSectionCard({
    Key? key,
    required this.section,
    required this.onDelete,
    required this.onUpdate,
  }) : super(key: key);

  @override
  State<WidgetSectionCard> createState() => _WidgetSectionCardState();
}

class _WidgetSectionCardState extends State<WidgetSectionCard> {
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
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 24,
                  alignment: Alignment.centerLeft,
                  child: TextFormField(
                    controller: titleController,
                    focusNode: titleFocusNode,
                    onChanged: (value) => widget.onUpdate(value, contentController.text),
                    decoration: const InputDecoration(
                      hintText: 'Title',
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
                      hintText: 'Content',
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
          IconButton(
            icon: const Icon(Icons.delete, color: AppColors.actionColor),
            onPressed: widget.onDelete,
          ),
        ],
      ),
    );
  }
}