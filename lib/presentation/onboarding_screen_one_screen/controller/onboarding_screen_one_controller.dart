import 'package:preeti_s_application3/core/app_export.dart';
import 'package:preeti_s_application3/presentation/onboarding_screen_one_screen/models/onboarding_screen_one_model.dart';

/// A controller class for the OnboardingScreenOneScreen.
///
/// This class manages the state of the OnboardingScreenOneScreen, including the
/// current onboardingScreenOneModelObj
class OnboardingScreenOneController extends GetxController {
  Rx<OnboardingScreenOneModel> onboardingScreenOneModelObj =
      OnboardingScreenOneModel().obs;
}
