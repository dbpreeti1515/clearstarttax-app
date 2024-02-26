import '../controller/splash_screen_four_controller.dart';
import 'package:get/get.dart';

/// A binding class for the SplashScreenFourScreen.
///
/// This class ensures that the SplashScreenFourController is created when the
/// SplashScreenFourScreen is first loaded.
class SplashScreenFourBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashScreenFourController());
  }
}
