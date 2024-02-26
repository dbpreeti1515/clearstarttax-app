import 'package:flutter/material.dart';
import 'package:preeti_s_application3/core/app_export.dart';
import 'package:preeti_s_application3/presentation/forget_password_screen/models/forget_password_model.dart';

import '../../../data/models/SuccessDialogBox/SuccessBox.dart';

/// A controller class for the ForgetPasswordScreen.
///
/// This class manages the state of the ForgetPasswordScreen, including the
/// current forgetPasswordModelObj
class ForgetPasswordController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Rx<ForgetPasswordModel> forgetPasswordModelObj = ForgetPasswordModel().obs;
  final emailController = TextEditingController();
  Future<void> clickOnForgetPasswordButton(BuildContext context) async {




    if (formKey.currentState!.validate()) {


      SuccessDialog.showCustomDialog(context,"msg_forget_password".tr,"msg_reset_password".tr,true);



  }
  }
  onTapSUBMIT() {
    Get.toNamed(
      AppRoutes.resetPasswordScreen,
    );
  }
}
