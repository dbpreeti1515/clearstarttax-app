import '../controller/tax_news_controller.dart';
import 'package:get/get.dart';

/// A binding class for the TaxNewsScreen.
///
/// This class ensures that the TaxNewsController is created when the
/// TaxNewsScreen is first loaded.
class TaxNewsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TaxNewsController());
  }
}
