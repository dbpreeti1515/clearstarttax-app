import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import '../controller/fqController.dart';
class FQBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FQController>(() => FQController());
  }
}