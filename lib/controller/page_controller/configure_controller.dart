import 'package:flutter/cupertino.dart';
import 'package:file_picker/file_picker.dart';
import 'package:front/logic/model/folder/folder_model.dart';
import 'package:front/logic/model/language/programming_language_init.dart';
import 'package:front/logic/model/language/programming_language_manager.dart';
import 'package:front/logic/model/section/section_manager.dart';
import 'package:front/logic/model/section/section_model.dart';

class ConfigureController extends ChangeNotifier {
  late FolderModel folderModel;
  late ProgrammingLanguageManager languageManager;
  late SectionManager sectionManager;

  ConfigureController() {
    folderModel = FolderModel(selectedDirectoryPath: '');
    languageManager = ProgrammingLanguageInit.init();
    sectionManager = SectionManager();
  }

  Future<String?> pickDirectory() async {
    try {
      String? path = await FilePicker.platform.getDirectoryPath();
      if (path != null) {
        folderModel.selectedDirectoryPath = path;
        notifyListeners();
        debugPrint('pickDirectory() -- path : $path');
      } else {
        debugPrint('pickDirectory() -- No path selected');
      }
      return path;
    } catch (e) {
      debugPrint('Error selecting directory: $e');
      return null;
    }
  }


  List<String> getProgrammingLanguages() {
    return languageManager.languages.map((lang) => lang.name).toList();
  }

  void setSelectedLanguage(String languageName) {
    var selectedLang = languageManager.languages.firstWhere(
          (lang) => lang.name == languageName,
      orElse: () => languageManager.languages.first,
    );
    languageManager.selectedLanguage = selectedLang;
    notifyListeners();
  }

  List<SectionModel> getSections() => sectionManager.sections;

  void addSection(String title, String content) {
    sectionManager.addSection(title, content);
    notifyListeners();
  }

  void updateSection(int index, String title, String content) {
    if (index >= 0 && index < sectionManager.sections.length) {
      sectionManager.updateSection(index, title, content);
      notifyListeners();
    }
  }

  void removeSection(int index) {
    if (index >= 0 && index < sectionManager.sections.length) {
      sectionManager.removeSection(index);
      notifyListeners();
    }
  }

  String get selectedDirectoryPath => folderModel.selectedDirectoryPath;
  String get selectedLanguageName => languageManager.selectedLanguage.name;

}
