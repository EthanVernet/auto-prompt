class LLMModel {
  String name;
  int maxWord;

  LLMModel({required this.name, required this.maxWord});

  @override
  String toString() {
    return 'LLMModel{name: $name, maxCharacters: $maxWord}';
  }
}
