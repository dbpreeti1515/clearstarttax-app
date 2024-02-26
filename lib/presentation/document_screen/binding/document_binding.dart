import '../controller/document_controller.dart';
import 'package:get/get.dart';

/// A binding class for the DocumentScreen.
///
/// This class ensures that the DocumentController is created when the
/// DocumentScreen is first loaded.
class DocumentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DocumentController());
  }
}
