import 'dart:convert';


import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:image_picker/image_picker.dart';
import 'package:preeti_s_application3/core/app_export.dart';
import 'package:preeti_s_application3/data/API_Services/apiEndpoint.dart';
import 'package:preeti_s_application3/presentation/dashboard_page/models/dashboard_model.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import '../../../api_constant/api_constant.dart';
import '../../../data/Comman/common_method.dart';
import '../../../data/apiModal/getDashboardModal.dart';
import '../../../data/apiModal/getSelltementOfficerModal.dart';
import '../../../data/apiModal/getUserModal.dart';

import '../../../data/local_database/database_helper/database_helper.dart';
import '../../splash_screen/controller/splash_screen_four_controller.dart';
import '../../tax_news_screen/models/tax_news_model.dart';
import '../models/userprofile_item_model.dart';

/// A controller class for the DashboardPage.
///
/// This class manages the state of the DashboardPage, including the
/// current dashboardModelObj
///
RxString name = ''.obs;
RxString greatinMsg = ''.obs;
RxString email = ''.obs;
RxString caseId = ''.obs;
RxString satOfficerEmail = ''.obs;
RxString statusName = ''.obs;
RxString meansStep = ''.obs;
RxString nextStep = ''.obs;

class DashboardController extends GetxController {
  RxBool isLoading = false.obs;

  RxMap uploadDocumentData = Map().obs;

  final statusInfo = Rxn<Statusinfo>();
  final getDashboardData = Rxn<GetDashBoardModel>();

  RxInt testMonialDataLenght = 0.obs;
  RxInt statusId = 0.obs;
  RxBool fqNotification = false.obs;
  RxBool toNotification = false.obs;
  RxBool appoinmentNotification = false.obs;
  RxList<String> statusForFQ = <String>[].obs;
  RxList<String> statusForTO = <String>[].obs;
  RxList<String> statusForFAppointment = <String>[].obs;
  RxList testMonialData = [].obs;
  RxBool isAppointmentNotification = true.obs;
  RxBool isToNotification = true.obs;
  RxBool isFQNotification = true.obs;


  final DatabaseHelper dbHelper = DatabaseHelper();
  Rx<PageController> pageController = PageController(viewportFraction: 0.8).obs;
  RxDouble currentPage = 0.0.obs;
  UserprofileItemModel userprofileItemModelObj = UserprofileItemModel();
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();

    await getDashboard();

    await TestimonialAPI();

    pageController.value.addListener(() {
      currentPage.value = pageController.value.page!;
      pageController.value = PageController(viewportFraction: 0.8);
      currentPage = 0.0.obs;
    });
  }

  Rx<TaxNewsModel> taxNewsModelObj = TaxNewsModel().obs;
  Future<void> TestimonialAPI() async {
    final response = await http.get(Uri.parse(UriConstant.testimonialURL));

    if (response.statusCode == 200) {
      isLoading.value = false;
      testMonialData.value = json.decode(response.body);
      testMonialDataLenght.value = 2;
    } else {
      isLoading.value = false;
      throw Exception('Failed to load user data');
    }
  }

  Future<void> getDashboard() async {
    isLoading.value = true;

    try {
      http.Response? response = await http.get(
        Uri.parse(UriConstant.dashboardURL),
        headers: {
          ApiKey.authorization: '${ApiKey.bearer} $token',
        },
      );
      isLoading.value = true;

      if (response.statusCode == 200)
        getDashboardData.value =
            GetDashBoardModel.fromJson(jsonDecode(response!.body));

      if (getDashboardData.value != null &&
          getDashboardData.value?.data != null) {
        statusInfo.value = getDashboardData.value!.data!.statusinfo;
        greatinMsg.value = getDashboardData.value!.data!.greeting!;
        statusId.value = getDashboardData.value!.data!.statusId!;
        statusName.value = getDashboardData.value!.data!.statusName!;
        meansStep.value =
            getDashboardData.value!.data!.statusinfo!.whatThisMeans ?? '';
        nextStep.value =
            getDashboardData.value!.data!.statusinfo!.whatHappensNext ?? '';
        getDashboardData.value!.data!.statusForFq!.forEach((element) {
          statusForFQ.value.add(element);
          if (element.toString() == statusId.value.toString()) {
            fqNotification.value = true;
            dbHelper.updateFirstUserColumn('fqNotification', 'true');

          }
        });

        getDashboardData.value!.data!.statusForTo!.forEach((element) {
          statusForTO.value.add(element);
          if (element.toString() == statusId.value.toString()) {
            toNotification.value = true;
            dbHelper.updateFirstUserColumn('toNotification', 'true');

          }
        });
        getDashboardData.value!.data!.statusForAppointment!.forEach((element) {
          statusForFAppointment.value.add(element);
          if (element.toString() == statusId.value.toString()) {
            appoinmentNotification.value = true;
            dbHelper.updateFirstUserColumn('appoinmentNotification', 'true');
           // dbHelper.updateFirstUserColumn('status', 'active');

          }
        });

        isLoading.value = false;
      } else {
        print(response.reasonPhrase);
        isLoading.value = false;
      }
    } catch (e) {
      print(e);
      isLoading.value = false;
    }
  }

  onClickNotification(value) {

    if (value == 0) {
      isFQNotification.value = false;
    } else if (value == 1) {
      isToNotification.value = false;
    } else if (value == 2) {
      isAppointmentNotification.value = false;
    }
  }


}
