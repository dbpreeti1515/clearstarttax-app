import '../controller/news_page_controller.dart';
import 'package:get/get.dart';

/// A binding class for the NewsPageScreen.
///
/// This class ensures that the NewsPageController is created when the
/// NewsPageScreen is first loaded.
class NewsPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NewsPageController());
  }
}
