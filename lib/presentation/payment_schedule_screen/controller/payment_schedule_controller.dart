import 'package:preeti_s_application3/core/app_export.dart';
import 'package:preeti_s_application3/presentation/payment_schedule_screen/models/payment_schedule_model.dart';

/// A controller class for the PaymentScheduleScreen.
///
/// This class manages the state of the PaymentScheduleScreen, including the
/// current paymentScheduleModelObj
class PaymentScheduleController extends GetxController {
  Rx<PaymentScheduleModel> paymentScheduleModelObj = PaymentScheduleModel().obs;
}
