import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:preeti_s_application3/presentation/fq_screen/controller/fqController.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FQScreen extends GetView<FQController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: controller.webController != null
                ? Stack(
                  children: [
                    WebViewWidget(controller: controller.webController!),
                    IconButton(
                        padding: EdgeInsets.only(left: 20, top: 10),

                        onPressed: (){
                          Get.back();

                        }, icon: Icon(Icons.arrow_back_ios)),
                  ],
                )
                : Center(
                    child: CircularProgressIndicator(),
                  )));
  }
}
