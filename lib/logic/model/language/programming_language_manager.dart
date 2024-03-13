import 'programming_language.dart';

class ProgrammingLanguageManager {
  final List<ProgrammingLanguage> _languages = [];
  ProgrammingLanguage _selected = ProgrammingLanguage('Tous', ['.*']);

  ProgrammingLanguageManager();

  // Getter et setter pour selectedLanguage
  ProgrammingLanguage get selectedLanguage => _selected;
  set selectedLanguage(ProgrammingLanguage selectedLanguage) {
    _selected = selectedLanguage;
  }

  void addLanguage(String name, List<String> extensions) {
    try {
      _languages.add(ProgrammingLanguage(name, extensions));
    } catch (e) {
      throw Exception("programming_language_manager.dart -- addLanguage -- Error : $e");
    }
  }

  List<ProgrammingLanguage> get languages => List.unmodifiable(_languages);
}
