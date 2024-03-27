import 'package:front/logic/model/file/file_decorator.dart';
import 'package:front/logic/model/file/file_model.dart';
import 'package:front/logic/model/section/section_decorator.dart';
import 'package:front/logic/model/section/section_model.dart';

class CodeContentBuilder {
  String generateContent(List<FileModel> selectedFiles, List<SectionModel> sections) {
    final StringBuffer contentBuilder = StringBuffer();

    contentBuilder.writeln('CODE : ');
    for (final FileModel file in selectedFiles) {
      contentBuilder.writeln(FileDecorator(file).fileName);
      contentBuilder.writeln(FileDecorator(file).fileContent);
    }

    for (final SectionModel section in sections) {
      contentBuilder.writeln(SectionDecorator(section).title);
      contentBuilder.writeln(SectionDecorator(section).content);
    }

    return contentBuilder.toString();
  }
}
