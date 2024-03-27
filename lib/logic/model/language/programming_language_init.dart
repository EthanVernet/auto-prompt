import 'package:front/logic/model/language/programming_language_model.dart';

import 'programming_language_manager.dart';

class ProgrammingLanguageInit {
  static ProgrammingLanguageManager init() {
    try {
      List<ProgrammingLanguage> languages = [
        ProgrammingLanguage("Python", [".py"]),
        ProgrammingLanguage("Python Docker", [".py", "Dockerfile", ".sh"]),
        ProgrammingLanguage("Flutter", [".dart","pubspeck.yaml"]),
        ProgrammingLanguage("Obsidian", [".md"]),
        ProgrammingLanguage("PDF", [".pdf"]),
      ];
      return ProgrammingLanguageManager(languages);
    } catch (e) {
      throw Exception("programming_language_init.dart -- init -- Error : $e");
    }
  }
}