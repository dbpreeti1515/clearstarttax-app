import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:preeti_s_application3/core/app_export.dart';
import 'package:preeti_s_application3/presentation/news_page_screen/models/news_page_model.dart';
import 'package:http/http.dart' as http;
import 'package:webview_flutter/webview_flutter.dart';

import '../../../data/API_Services/apiEndpoint.dart';
import '../../../data/apiModal/testmonialDescriptionModal.dart';

/// A controller class for the NewsPageScreen.
///
/// This class manages the state of the NewsPageScreen, including the
/// current newsPageModelObj
///    RxList data = [].obs;

class NewsPageController extends GetxController {
  Rx<NewsPageModel> newsPageModelObj = NewsPageModel().obs;
  RxBool isLoading = true.obs;
  RxInt testimonialDescriptionId = 0.obs;
  RxDouble contentheight = 1.0.obs;
  RxDouble contentheight1 = 1.0.obs;

  RxList testimonialDescriptionData = [].obs;
  RxList testimonialRelatedData = [].obs;
  WebViewController?  webController1;
  WebViewController?  webController;

  final descriptionModal = Rxn<testimonialDescriptionModal>();

  @override
  void onInit() async{
    super.onInit();



    TestimonialRelatedAPI(7087, 46);
    //TestimonialDescriptionAPI();
  }

  Future<void> TestimonialDescriptionAPI(int postId) async {
    print("this is Id $postId");
    var url = Uri.parse(UriConstant.testimonialDescriptionURL);

    var queryParams = {'post_id': "$postId"};
    var uri = Uri.parse(url.toString()).replace(queryParameters: queryParams);

    try {
      http.Response response = await http.get(uri);

      if (response.statusCode == 200) {
        //print(testimonialDescriptionModal.fromJson(jsonDecode(response.body??'') as Map<String,dynamic>));

        testimonialDescriptionData.value = json.decode(response.body);

        webController = WebViewController()
        ..enableZoom(true)
        
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..setBackgroundColor(const Color(0x00000000))
          ..setNavigationDelegate(
            NavigationDelegate(
              onProgress: (int progress) {

              },


              onPageStarted: (String url) {},
              onPageFinished: (String url) {
                updateHeight();
              },
              onWebResourceError: (WebResourceError error) {},
              onNavigationRequest: (NavigationRequest request) {

                return NavigationDecision.navigate;
              },

            ),
          )
          ..loadRequest(Uri.parse('data:text/html;charset=utf-8,'+'<!DOCTYPE html><html><head><meta name="viewport" content="width=device-width, initial-scale=1.0">' + Uri.encodeComponent(testimonialDescriptionData.value[0]['post_content'])));

  webController1 = WebViewController()

          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..setBackgroundColor(const Color(0x00000000))
          ..setNavigationDelegate(
            NavigationDelegate(
              onProgress: (int progress) {

              },
              onPageStarted: (String url) {
                updateHeight();
              },

              onPageFinished: (String url) {},
              onWebResourceError: (WebResourceError error) {},
              onNavigationRequest: (NavigationRequest request) {

                return NavigationDecision.navigate;
              },
            ),
          )
          ..loadRequest(Uri.parse('data:text/html;charset=utf-8,' +'<!DOCTYPE html><html><head><meta name="viewport" content="width=device-width, initial-scale=1.0">'+ Uri.encodeComponent(testimonialDescriptionData.value[0]['content2'])));





      } else {
        print('Failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> TestimonialRelatedAPI(
      int post_not_in_id, int category_id) async {
    var url = Uri.parse(UriConstant.testimonialDescriptionURL);

    var queryParams = {
      'post_not_in_id': post_not_in_id.toString(),
      'category_id': category_id.toString()
    };
    var uri = Uri.parse(url.toString()).replace(queryParameters: queryParams);

    try {
      http.Response response = await http.get(uri);

      if (response.statusCode == 200) {
        //print(testimonialDescriptionModal.fromJson(jsonDecode(response.body??'') as Map<String,dynamic>));

        testimonialRelatedData.value = json.decode(response.body);

      } else {
        print('Failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
  void updateHeight() async {

    if(webController !=null) {
      var height=(await
      webController!.runJavaScriptReturningResult('document.documentElement.scrollHeight;'));
      contentheight.value = double.parse(height.toString());


    print(contentheight.value);
    }
    if(webController1 !=null) {
      var height=(await
      webController1!.runJavaScriptReturningResult('document.documentElement.scrollHeight;'));
      contentheight1.value = double.parse(height.toString());


    print(contentheight1.value);
    }
  // prints height
  }
}
