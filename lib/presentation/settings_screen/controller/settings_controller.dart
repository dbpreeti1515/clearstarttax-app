import 'package:preeti_s_application3/core/app_export.dart';
import 'package:preeti_s_application3/presentation/settings_screen/models/settings_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the SettingsScreen.
///
/// This class manages the state of the SettingsScreen, including the
/// current settingsModelObj
class SettingsController extends GetxController {
  TextEditingController signOutController = TextEditingController();

  Rx<SettingsModel> settingsModelObj = SettingsModel().obs;

  @override
  void onClose() {
    super.onClose();
    signOutController.dispose();
  }
}
