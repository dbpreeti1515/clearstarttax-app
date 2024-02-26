import 'package:preeti_s_application3/presentation/HomeScreen/controller/HomeScreenController.dart';


import 'package:get/get.dart';

/// A binding class for the LoginPageScreen.
///
/// This class ensures that the LoginPageController is created when the
/// LoginPageScreen is first loaded.
class HomeScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeScreenController());
  }
}