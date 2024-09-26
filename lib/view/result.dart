// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ar/constant/approute.dart';
import 'package:get/get.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class ResultView extends StatelessWidget {
  const ResultView({super.key});

  @override
  Widget build(BuildContext context) {
    final Map arguments = Get.arguments;
    String result = arguments['result'].toString().toLowerCase();

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
    final AudioPlayer audioPlayer = AudioPlayer();
    return PopScope(
      canPop: false,
      child: Scaffold(
          appBar: AppBar(
            title: Text(title),
            centerTitle: true,
            leading: IconButton(
                onPressed: () {
                  Get.offAllNamed(AppRoute.home);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.blueGrey,
                )),
            actions: const [],
          ),
          body: Stack(
            children: [
              ModelViewer(
                src: src,
                ar: true,
                autoRotate: true,
                cameraControls: true,
                autoPlay: true,
                alt: "A 3D model",
                arScale: ArScale.fixed,
                arPlacement: ArPlacement.floor,
                scale: "0.5 0.5 0.5",
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 0,
                bottom: 40,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    onPressed: () async {
                      await audioPlayer.play(AssetSource(audio));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(20),
                    ),
                    child: const Icon(
                      Icons.audiotrack,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
