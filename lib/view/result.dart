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
    switch (result) {
      // case "cooking":
      //   src = "assets/model/cooking.glb";
      //   break;
      // case "paint":
      //   src = "assets/model/paint.glb";
      //   break;
      // case "reading":
      //   src = "assets/model/reading.glb";
      //   break;
      // case "sweep":
      //   src = "assets/model/sweep.glb";
      //   break;
      // case "watching":
      //   src = "assets/model/watching.glb";
      //   break;
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
    final AudioPlayer audioPlayer = AudioPlayer();
    return PopScope(
      canPop: false,
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Hasil Scan"),
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
