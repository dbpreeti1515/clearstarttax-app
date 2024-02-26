import '../controller/forget_password_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ForgetPasswordScreen.
///
/// This class ensures that the ForgetPasswordController is created when the
/// ForgetPasswordScreen is first loaded.
class ForgetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgetPasswordController());
  }
}
