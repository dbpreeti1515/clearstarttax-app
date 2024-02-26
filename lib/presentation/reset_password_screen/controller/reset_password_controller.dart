import 'package:preeti_s_application3/core/app_export.dart';
import 'package:preeti_s_application3/presentation/reset_password_screen/models/reset_password_model.dart';

/// A controller class for the ResetPasswordScreen.
///
/// This class manages the state of the ResetPasswordScreen, including the
/// current resetPasswordModelObj
class ResetPasswordController extends GetxController {
  Rx<ResetPasswordModel> resetPasswordModelObj = ResetPasswordModel().obs;
}
