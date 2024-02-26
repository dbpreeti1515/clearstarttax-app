import '../controller/faq_controller.dart';
import 'package:get/get.dart';

/// A binding class for the FaqScreen.
///
/// This class ensures that the FaqController is created when the
/// FaqScreen is first loaded.
class FaqBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FaqController());
  }
}
