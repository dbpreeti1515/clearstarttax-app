import 'package:preeti_s_application3/core/app_export.dart';
import 'package:preeti_s_application3/presentation/app_settings_screen/models/app_settings_model.dart';

/// A controller class for the AppSettingsScreen.
///
/// This class manages the state of the AppSettingsScreen, including the
/// current appSettingsModelObj
class AppSettingsController extends GetxController {
  Rx<AppSettingsModel> appSettingsModelObj = AppSettingsModel().obs;

  Rx<bool> isSelectedSwitch = false.obs;

  Rx<bool> isSelectedSwitch1 = false.obs;
}
