import 'package:front/logic/model/file/file_model.dart';
import 'package:front/logic/model/section/section_model.dart';

class CodeContentBuilder {
  String generateContent(List<FileContentModel> selectedFiles, List<SectionModel> sections) {
    final StringBuffer contentBuilder = StringBuffer();

    contentBuilder.writeln('CODE : ');
    for (final file in selectedFiles) {
      contentBuilder.writeln('${file.fileName}');
      contentBuilder.writeln('${file.fileContent}\n');
    }

    for (final section in sections) {
      contentBuilder.writeln('${section.title.toUpperCase()}');
      contentBuilder.writeln('${section.content}\n');
    }

    return contentBuilder.toString();
  }
}
