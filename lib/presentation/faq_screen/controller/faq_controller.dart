import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:preeti_s_application3/core/app_export.dart';
import 'package:preeti_s_application3/data/API_Services/apiEndpoint.dart';
import 'package:preeti_s_application3/presentation/faq_screen/models/faq_model.dart';
import 'package:http/http.dart' as http;
import 'package:preeti_s_application3/presentation/login_page_screen/controller/login_page_controller.dart';

import '../../../core/http_methods/http_methods.dart';
import '../../../data/apiClient/api_client.dart';
import '../../../data/apiModal/FAQ_Modal.dart';
import '../../splash_screen/controller/splash_screen_four_controller.dart';

/// A controller class for the FaqScreen.
///
/// This class manages the state of the FaqScreen, including the
/// current faqModelObj
class FaqController extends GetxController with GetSingleTickerProviderStateMixin {
  final ApiService apiService = ApiService(
    baseUrl: 'https://client.clearstarttax.com',
    authToken: 'Bearer $token',
  );

  @override
  void onInit()async {
    super.onInit();
    await fetchData();
    tabController = TabController(length: 2, vsync: this);
  }
@override
void dispose() {
  // Dispose of the TabController when the widget is disposed.
  tabController!.dispose();
  super.dispose();
}
  Rx<FaqModel> faqModelObj = FaqModel().obs;
  TabController? tabController;

  final faq_modal = Rxn<FAQ_Modal?>();
  final RxBool isLoading = true.obs;
  final RxMap<dynamic, dynamic> responseData = {}.obs;

  List<ProcessingFaqs> processingFaqsData = [];
  List<ServiceFaqs> serviceFaqs = [];


  Future<void> fetchData() async {
    try {
      isLoading.value = true;

      http.Response? response = await HttpMethod.instance.getRequest(
        url: UriConstant.faqURL,
      );


      faq_modal.value = FAQ_Modal.fromJson(jsonDecode(response!.body));
      print(faq_modal.value);
      if (faq_modal.value!= null && faq_modal.value?.data != null &&
          faq_modal.value!.data!.processingFaqs!.isNotEmpty) {
        faq_modal.value!.data?.processingFaqs?.forEach((element) {
          processingFaqsData.add(element);



        });
      }
      if (faq_modal.value!= null && faq_modal.value?.data != null &&
          faq_modal.value!.data!.serviceFaqs!.isNotEmpty) {
        faq_modal.value!.data?.serviceFaqs?.forEach((element) {
          serviceFaqs.add(element);
          print(serviceFaqs.elementAt(0).question);



        });
      }



      isLoading.value = false;
    } catch (error) {
      isLoading.value = false;
      // Handle errors
      print('Error fetching data: $error');
    }
  }


}
