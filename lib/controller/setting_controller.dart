import 'package:front/logic/model/llm/llm_init.dart';
import 'package:front/logic/model/llm/llm_manager.dart';


class SettingController {
  late LLMModelManager llmModelManager;

  SettingController() {
    llmModelManager = LLMModelInit.init();
  }
  
  List<String> getLLMNames() {
    return llmModelManager.models.map((model) => model.name).toList();
  }

  void setSelectedLLM(String name) {
    llmModelManager.selectedModel = llmModelManager.models.firstWhere((model) => model.name == name);
  }

}
