import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ar/constant/approute.dart';
import 'package:flutter_ar/controller/scan_controller.dart';
import 'package:get/get.dart';

class ScannerView extends StatelessWidget {
  const ScannerView({super.key});

  @override
  Widget build(BuildContext context) {
    final ScanController scanController = Get.put(ScanController());
    scanController.initAll();

    return PopScope(
      canPop: false,
      child: Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Stack(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: GetBuilder<ScanController>(
                    init: ScanController(),
                    builder: (controller) {
                      if (controller.isCamerainitialized.value &&
                          controller.cameraController.value.isInitialized) {
                        return CameraPreview(controller.cameraController);
                      } else {
                        return SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          child: Center(
                              child: CircularProgressIndicator(
                            color: Colors.blue[700],
                          )),
                        );
                      }
                    },
                  ),
                ),
                // SizedBox(
                //   width: MediaQuery.of(context).size.width,
                //   height: MediaQuery.of(context).size.height / 1.35,
                //   child: Center(
                //       child: SizedBox(
                //           width: MediaQuery.of(context).size.width / 1.3,
                //           child:
                //               SvgPicture.asset("assets/images/gridbox.svg"))),
                // ),
                Positioned(
                    top: 10,
                    left: 0,
                    right: 0,
                    child: SizedBox(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {
                                scanController.stopCamera();
                                Get.back();
                                // Get.offAllNamed(AppRoutes.dashboard);
                              },
                              icon: const Icon(
                                Icons.arrow_back,
                                color: Colors.blueGrey,
                              )),
                          const Text(
                            "scan",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                          const SizedBox(
                            width: 30.0,
                          ),
                        ],
                      ),
                    )),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      Container(
                        color: Colors.black38,
                        width: double.infinity,
                        height: 105,
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // SizedBox(
                            //   width: 35,
                            //   child: IconButton(
                            //       onPressed: () {},
                            //       icon: const Icon(
                            //         Icons.photo,
                            //         size: 35,
                            //         color: Colors.white,
                            //       )),
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                Obx(() => scanController.resultScan.value.confidence != 0 &&
                        scanController.resultScan.value.confidence! * 100 >= 10
                    ? Positioned(
                        bottom: 40,
                        left: 0,
                        right: 0,
                        child: InkWell(
                          onTap: () {
                            scanController.stopCamera();
                            Get.toNamed(AppRoute.result, arguments: {
                              'result': scanController.resultScan.value.label
                            });
                          },
                          child: Center(
                            child: Text(
                              style: const TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              scanController.resultScan.value.label ?? '',
                            ),
                          ),
                        ))
                    : Container())
              ],
            ),
          )),
    );
  }
}
