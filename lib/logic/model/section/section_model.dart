class SectionModel {
  int id;
  String title;
  String content;

  SectionModel({required this.id, required this.title, required this.content});

  Map<String, dynamic> toMap() {
    return {
      'id' : id,
      'title': title,
      'content': content,
    };
  }

  factory SectionModel.fromMap(Map<String, dynamic> map) {
    return SectionModel(
      id: map['id'],
      title: map['title'],
      content: map['content'],
    );
  }
}
