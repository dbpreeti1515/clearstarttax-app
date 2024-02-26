import '../controller/get_in_touch_controller.dart';
import 'package:get/get.dart';

/// A binding class for the GetInTouchScreen.
///
/// This class ensures that the GetInTouchController is created when the
/// GetInTouchScreen is first loaded.
class GetInTouchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetInTouchController());
  }
}
