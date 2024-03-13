import 'section_model.dart';

class SectionManager {
  List<SectionModel> sections = [];

  void addSection(String title, String content) {
    try {
      sections.add(SectionModel(title: title, content: content));
    } catch (e) {
      throw Exception("section_manager.dart -- addSection -- Error : $e");
    }
  }

  void updateSection(int index, String title, String content) {
    try {
      if (index >= 0 && index < sections.length) {
        sections[index].title = title;
        sections[index].content = content;
      }
    } catch (e) {
      throw Exception("section_manager.dart -- updateSection -- Error : $e");
    }
  }

  void removeSection(int index) {
    try {
      if (index >= 0 && index < sections.length) {
        sections.removeAt(index);
      }
    } catch (e) {
      throw Exception("section_manager.dart -- removeSection -- Error : $e");
    }
  }
}

