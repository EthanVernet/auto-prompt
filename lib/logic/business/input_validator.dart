import 'package:front/controller/main_controller.dart';

class InputValidator {
  final MainController controller;

  InputValidator(this.controller);

  bool validateForPageSelect() {
    if (controller.selectedDirectoryPath.isEmpty) {
      return false;
    }
    if (controller.selectedLanguageName == "Tous") {
      return false;
    }
    for (var section in controller.getSections()) {
      if (section.title.isEmpty || section.content.isEmpty) {
        return false;
      }
    }
    return true;
  }

  bool validateForPageCopy() {
    var selectedFiles = controller.selectedFiles;
    return selectedFiles.isNotEmpty;
  }

}
