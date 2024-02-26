import '../controller/app_settings_controller.dart';
import 'package:get/get.dart';

/// A binding class for the AppSettingsScreen.
///
/// This class ensures that the AppSettingsController is created when the
/// AppSettingsScreen is first loaded.
class AppSettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AppSettingsController());
  }
}
