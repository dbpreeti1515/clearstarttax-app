import '../controller/login_page_controller.dart';
import 'package:get/get.dart';

/// A binding class for the LoginPageScreen.
///
/// This class ensures that the LoginPageController is created when the
/// LoginPageScreen is first loaded.
class LoginPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginPageController());
  }
}
