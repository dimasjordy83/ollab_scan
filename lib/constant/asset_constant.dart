
class AssetsHandler {
  static Map<String, String> getResultAssets(String result) {
    String src;
    String audio;

    switch (result) {
      case "number":
        src = "assets/model/number.glb";
        audio = "audio/number.mp3";
        break;
      case "listening 1":
        src = "assets/model/talk1.glb";
        audio = "audio/talk1.mp3";
        break;
      case "listening 2":
        src = "assets/model/talk2.glb";
        audio = "audio/talk2.mp3";
        break;
      default:
        src = "assets/model/cooking.glb";
        audio = "audio/talk1.mp3";
        break;
    }

    return {
      'src': src,
      'audio': audio,
    };
  }
}
