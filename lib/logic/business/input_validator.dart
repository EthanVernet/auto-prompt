<<<<<<< Updated upstream
import 'package:front/controller/controller_project.dart';

class InputValidator {
  final ControllerProject controller;
=======
import 'package:front/controller/controller_configure_project.dart';

class InputValidator {
  final ControllerConfigureProject controller;
>>>>>>> Stashed changes

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
