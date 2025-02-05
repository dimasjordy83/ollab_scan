// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ar/constant/approute.dart';
import 'package:flutter_ar/constant/asset_constant.dart';
import 'package:get/get.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class ResultView extends StatelessWidget {
  const ResultView({super.key});

  @override
  Widget build(BuildContext context) {
    final Map arguments = Get.arguments;
    String result = arguments['result'].toString().toLowerCase();
    Map<String, String> assets = AssetsHandler.getResultAssets(result);
    String src = assets['src']!;
    String audio = assets['audio']!;
    String title = assets['title']!;
    final AudioPlayer audioPlayer = AudioPlayer();

    // Function to get the display name for the model
    String getDisplayName(String modelName) {
      Map<String, String> replacements = {
        'paint': 'drawing',
        'number': 'task 3',
        'capter4_cooking': 'My mother cooks meal in the kitchen',
        'capter4_reading': 'Do the read books in the living room?',
        'capter4_sleeping': 'Adi does not sleep in the living room',
        'capter4_eating': 'We eat fried rice in the dining room',
        'sit': 'sofa',
        'table': 'Coffee Table',
        'cook-water': 'i can boil water',
        'cooking-egg': 'I can fry an egg',
        'cutting': 'I can cut vegetables',
        'mopping': 'I can mop the floor',
        'sweep': 'I can sweep the floor',
      };
      return replacements[modelName] ?? modelName;
    }

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
              // Display model name
              Positioned(
                top: 10,
                left: 0,
                right: 0,
                child: Center(
                  child: Text(
                    getDisplayName(result),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
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
