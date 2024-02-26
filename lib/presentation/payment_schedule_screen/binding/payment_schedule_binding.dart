import '../controller/payment_schedule_controller.dart';
import 'package:get/get.dart';

/// A binding class for the PaymentScheduleScreen.
///
/// This class ensures that the PaymentScheduleController is created when the
/// PaymentScheduleScreen is first loaded.
class PaymentScheduleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PaymentScheduleController());
  }
}
