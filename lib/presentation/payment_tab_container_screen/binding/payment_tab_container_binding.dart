import '../controller/payment_tab_container_controller.dart';
import 'package:get/get.dart';

/// A binding class for the PaymentTabContainerScreen.
///
/// This class ensures that the PaymentTabContainerController is created when the
/// PaymentTabContainerScreen is first loaded.
class PaymentTabContainerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PaymentTabContainerController());
  }
}
