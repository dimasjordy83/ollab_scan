class AssetsHandler {
  static Map<String, String> getResultAssets(String result) {
    String src;
    String audio;
    String title;
    switch (result) {
      case "cooking":
      case "paint":
      case "reading":
      case "solving":
      case "watching":
        src = "assets/model/$result.glb";
        audio = "audio/$result.mp3";
        title = "Task 8 Fill and Write";
        break;
      case "number":
        src = "assets/model/number.glb";
        audio = "audio/number.mp3";
        title = "Task 3 Listen and Repeat";
        break;
      case "badroom":
      case "bathroom":
      case "dining room":
      case "garage":
      case "kitchen":
        src = "assets/model/$result.glb";
        audio = "audio/$result.mp3";
        title = "Lesson";
        break;
      case "capter4_brush":
      case "capter4_cooking":
      case "capter4_eating":
      case "capter4_reading":
      case "capter4_sleeping":
        src = "assets/model/$result.glb";
        audio = "audio/$result.mp3";
        title = "Simple Present Tense";
        break;
      case "bookshelf":
      case "lamp":
      case "model":
      case "sit":
      case "table":
      case "television":
        src = "assets/model/$result.glb";
        audio = "audio/$result.mp3";
        title = "Task 6 Listen and Say";
        break;
      case "dippers":
      case "shower":
      case "soap":
      case "toothbrush":
      case "toothpaste":
        src = "assets/model/$result.glb";
        audio = "audio/$result.mp3";
        title = "Task 2 Say a chant";
        break;
      case "cook-water":
      case "cooking_egg":
      case "cutting":
      case "mopping":
      case "sweep":
        src = "assets/model/$result.glb";
        audio = "audio/$result.mp3";
        title = "Task 1 Say out Loud";
        break;
      default:
        src = "assets/model/default.glb";
        audio = "audio/default.mp3";
        title = "Default";
        break;
    }

    return {'src': src, 'audio': audio, 'title': title};
  }
}
