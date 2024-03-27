import 'package:front/logic/model/section/section_model.dart';

class SectionDecorator{
  SectionModel sectionModel;

  SectionDecorator(this.sectionModel);

  String title() {
    return '${sectionModel.title.toUpperCase()} :';
  }

  String content(){
    return '${sectionModel.content}\n';
  }
}