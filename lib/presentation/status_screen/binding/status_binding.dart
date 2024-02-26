import '../controller/status_controller.dart';
import 'package:get/get.dart';

/// A binding class for the StatusScreen.
///
/// This class ensures that the StatusController is created when the
/// StatusScreen is first loaded.
class StatusBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StatusController());
  }
}
