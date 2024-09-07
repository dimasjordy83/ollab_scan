// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_ar/constant/approute.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Logo
        Padding(
          padding: const EdgeInsets.only(bottom: 40),
          child: Image.asset(
            'assets/logo.png', // Pastikan untuk menambahkan logo Anda di folder assets
            width: 150,
            height: 150,
          ),
        ),
        // Keterangan aplikasi
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Aplikasi yang mengubah foto menjadi AR untuk pembelajaran Bahasa Inggris secara interaktif dan menarik',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: Colors.blue[700],
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 40),

        // IconButton(
        //   icon: Icon(Icons.camera_alt, size: 50, color: Colors.blue[700]),
        //   onPressed: () {
        //     Get.toNamed(AppRoute.scanner);
        //   },
        // ),
        SizedBox(
          width: 200,
          child: GestureDetector(
            onTap: () {
              Get.toNamed(AppRoute.scanner);
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue[700],
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                    ),
                    Text(
                      'Mulai Scan gambar',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    )));
  }
}

         // Center(
            //       child: ElevatedButton(
            // onPressed: () async {
            //   Get.toNamed(AppRoute.scanner);
            // },
            // style: ElevatedButton.styleFrom(
            //   backgroundColor: Colors.blue,
            //   shape: const CircleBorder(),
            //   padding: const EdgeInsets.all(20),
            // ),
            // child: const Icon(
            //   Icons.camera_alt_rounded,
            //   color: Colors.white,
            //   size: 30,
            // ),
            //       ),
            //     ),
