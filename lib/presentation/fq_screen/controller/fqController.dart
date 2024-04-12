import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../HomeScreen/controller/HomeScreenController.dart';
import '../../dashboard_page/controller/dashboard_controller.dart';

class FQController extends GetxController{
  WebViewController?  webController;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    webController = WebViewController()
      ..enableZoom(true)


      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00ffffff))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {

          },


          onPageStarted: (String url) {},
          onPageFinished: (String url) {

          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {

            return NavigationDecision.navigate;
          },

        ),
      )
      ..loadRequest(Uri.parse('https://client.clearstarttax.com/fqs/app/${email.value}/${randomText1.value}${password}${randomText2.value}'));

  }



}