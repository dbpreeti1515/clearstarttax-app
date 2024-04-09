import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:preeti_s_application3/core/app_export.dart';
import 'package:preeti_s_application3/presentation/tax_news_screen/models/tax_news_model.dart';
import 'package:http/http.dart' as http;
import '../../../data/API_Services/apiEndpoint.dart';
import '../../../data/apiModal/testimonialModal.dart';

/// A controller class for the TaxNewsScreen.
///
/// This class manages the state of the TaxNewsScreen, including the
/// current taxNewsModelObj
class TaxNewsController extends GetxController {
  final ScrollController scrollController = ScrollController();
  final testimonial_modal = Rxn<testimonial_Modal>();
  RxBool isLoading = true.obs;
  RxList testMonialData = [].obs;
  RxList testMonialImageList = [].obs;
  RxList testMonialPostTitleList = [].obs;
  RxList testMonialCategoryList = [].obs;

  @override
  void onInit() {
    super.onInit();
    TestimonialAPI();
  }



  Rx<TaxNewsModel> taxNewsModelObj = TaxNewsModel().obs;
  Future<void> TestimonialAPI() async {
    final response = await http.get(Uri.parse(UriConstant.testimonialURL));

    if (response.statusCode == 200) {

      isLoading.value = false;
      testMonialData.value = json.decode(response.body);

    } else {
      isLoading.value = false;
      throw Exception('Failed to load user data');
    }
  }
}
