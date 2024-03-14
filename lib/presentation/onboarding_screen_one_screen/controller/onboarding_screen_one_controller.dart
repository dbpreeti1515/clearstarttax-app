import 'package:preeti_s_application3/core/app_export.dart';
import 'package:preeti_s_application3/presentation/onboarding_screen_one_screen/models/onboarding_screen_one_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// A controller class for the OnboardingScreenOneScreen.
///
/// This class manages the state of the OnboardingScreenOneScreen, including the
/// current onboardingScreenOneModelObj
class OnboardingScreenOneController extends GetxController {
  Rx<OnboardingScreenOneModel> onboardingScreenOneModelObj =
      OnboardingScreenOneModel().obs;

  @override
  void onInit() {
    setUser(true);
    super.onInit();
  }

  void setUser(key) async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setBool('isLogin', key);
    print('set user $key');
  }
}
