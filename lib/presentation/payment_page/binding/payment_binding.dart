
import 'package:get/get.dart';

import '../controller/payment_controller.dart';

/// A binding class for the StatusScreen.
///
/// This class ensures that the StatusController is created when the
/// StatusScreen is first loaded.
class PaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PaymentController());
  }
}
