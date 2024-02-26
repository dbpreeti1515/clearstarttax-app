import '../controller/payment_success_controller.dart';
import 'package:get/get.dart';

/// A binding class for the PaymentSuccessScreen.
///
/// This class ensures that the PaymentSuccessController is created when the
/// PaymentSuccessScreen is first loaded.
class PaymentSuccessBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PaymentSuccessController());
  }
}
