import 'package:preeti_s_application3/core/app_export.dart';
import 'package:preeti_s_application3/presentation/onboarding_screen_two_screen/models/onboarding_screen_two_model.dart';

/// A controller class for the OnboardingScreenTwoScreen.
///
/// This class manages the state of the OnboardingScreenTwoScreen, including the
/// current onboardingScreenTwoModelObj
class OnboardingScreenTwoController extends GetxController {
  Rx<OnboardingScreenTwoModel> onboardingScreenTwoModelObj =
      OnboardingScreenTwoModel().obs;
}
