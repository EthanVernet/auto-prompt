
import 'package:front/logic/model/llm/llm_model.dart';

class LLMModelManager {
  late List<LLMModel> _models = [];
  late LLMModel _selected;

  LLMModelManager(List<LLMModel> models) {
    _models = models;
    _selected = models.first;
  }

  LLMModel get selectedModel => _selected;
  set selectedModel(LLMModel selectedModel) {
    _selected = selectedModel;
  }

  void addModel(String name, int maxWord) {
    try {
      _models.add(LLMModel(name: name, maxWord: maxWord));
    } catch (e) {
      throw Exception("LLMModelManager.dart -- addModel -- Error : $e");
    }
  }

  List<LLMModel> get models => List.unmodifiable(_models);
}
