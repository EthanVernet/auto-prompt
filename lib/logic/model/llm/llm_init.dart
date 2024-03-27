import 'package:front/logic/model/llm/llm_manager.dart';
import 'package:front/logic/model/llm/llm_model.dart';

class LLMModelInit {
  static LLMModelManager init() {
    try {
      List<LLMModel> models = [
        LLMModel(name: "GPT-3.5", maxWord: 3000, ),
        LLMModel(name: "GPT-4", maxWord: 6000, ),
      ];
      return LLMModelManager(models);
    } catch (e) {
      throw Exception("LLMModelInit.dart -- init -- Error : $e");
    }
  }
}
