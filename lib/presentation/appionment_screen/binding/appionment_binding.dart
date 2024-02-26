import '../controller/appionment_controller.dart';
import 'package:get/get.dart';

/// A binding class for the AppionmentScreen.
///
/// This class ensures that the AppionmentController is created when the
/// AppionmentScreen is first loaded.
class AppionmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AppionmentController());
  }
}
