import 'package:preeti_s_application3/core/app_export.dart';
import 'package:preeti_s_application3/presentation/payment_tab_container_screen/models/payment_tab_container_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the PaymentTabContainerScreen.
///
/// This class manages the state of the PaymentTabContainerScreen, including the
/// current paymentTabContainerModelObj
class PaymentTabContainerController extends GetxController
    with GetSingleTickerProviderStateMixin {
  Rx<PaymentTabContainerModel> paymentTabContainerModelObj =
      PaymentTabContainerModel().obs;

  late TabController tabviewController =
      Get.put(TabController(vsync: this, length: 2));

  Rx<String> radioGroup = "".obs;

  Rx<String> radioGroup1 = "".obs;

  Rx<String> radioGroup2 = "".obs;
}
