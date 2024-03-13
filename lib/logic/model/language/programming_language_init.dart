import 'programming_language_manager.dart';

class ProgrammingLanguageInit {
  static ProgrammingLanguageManager init() {
    try {
      ProgrammingLanguageManager manager = ProgrammingLanguageManager();
      manager.addLanguage("C#", [".xaml", ".cs"]);
      manager.addLanguage("Java", [".java"]);
      manager.addLanguage("Flutter", [".dart", "pubspeck.yaml",]);
      manager.addLanguage("Python", [".py"]);
      manager.addLanguage("Obsidian", [".md"]);
      manager.addLanguage("React", [".jsx", ".tsx"]);
      manager.addLanguage("Vue", [".vue"]);
      manager.addLanguage("Angular", [".ts", ".html"]);
      manager.addLanguage("Spring Boot", [".java"]);
      manager.addLanguage("Laravel", [".php"]);

      return manager;
    } catch (e) {
      throw Exception("programming_language_init.dart -- init -- Error : $e");
    }
  }
}