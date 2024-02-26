import '../controller/upload_success_controller.dart';
import 'package:get/get.dart';

/// A binding class for the UploadSuccessScreen.
///
/// This class ensures that the UploadSuccessController is created when the
/// UploadSuccessScreen is first loaded.
class UploadSuccessBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UploadSuccessController());
  }
}
