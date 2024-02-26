
import 'package:preeti_s_application3/presentation/HomeScreen/Binding/HomeBinding.dart';
import 'package:preeti_s_application3/presentation/HomeScreen/HomeScreen.dart';
import 'package:preeti_s_application3/presentation/payment_schedule_screen/payment_schedule_screen.dart';
import 'package:preeti_s_application3/presentation/payment_schedule_screen/binding/payment_schedule_binding.dart';


import 'package:preeti_s_application3/presentation/splash_screen_four_screen/splash_screen_four_screen.dart';
import 'package:preeti_s_application3/presentation/splash_screen_four_screen/binding/splash_screen_four_binding.dart';
import 'package:preeti_s_application3/presentation/onboarding_screen_one_screen/onboarding_screen_one_screen.dart';
import 'package:preeti_s_application3/presentation/onboarding_screen_one_screen/binding/onboarding_screen_one_binding.dart';
import 'package:preeti_s_application3/presentation/onboarding_screen_two_screen/onboarding_screen_two_screen.dart';
import 'package:preeti_s_application3/presentation/onboarding_screen_two_screen/binding/onboarding_screen_two_binding.dart';
import 'package:preeti_s_application3/presentation/onboarding_screen_three_screen/onboarding_screen_three_screen.dart';
import 'package:preeti_s_application3/presentation/onboarding_screen_three_screen/binding/onboarding_screen_three_binding.dart';
import 'package:preeti_s_application3/presentation/login_page_screen/login_page_screen.dart';
import 'package:preeti_s_application3/presentation/login_page_screen/binding/login_page_binding.dart';
import 'package:preeti_s_application3/presentation/signup_screen/signup_screen.dart';
import 'package:preeti_s_application3/presentation/signup_screen/binding/signup_binding.dart';
import 'package:preeti_s_application3/presentation/dashboard_container_screen/dashboard_container_screen.dart';
import 'package:preeti_s_application3/presentation/dashboard_container_screen/binding/dashboard_container_binding.dart';
import 'package:preeti_s_application3/presentation/document_screen/document_screen.dart';
import 'package:preeti_s_application3/presentation/document_screen/binding/document_binding.dart';
import 'package:preeti_s_application3/presentation/payment_tab_container_screen/payment_tab_container_screen.dart';
import 'package:preeti_s_application3/presentation/payment_tab_container_screen/binding/payment_tab_container_binding.dart';
import 'package:preeti_s_application3/presentation/appionment_screen/appionment_screen.dart';
import 'package:preeti_s_application3/presentation/appionment_screen/binding/appionment_binding.dart';
import 'package:preeti_s_application3/presentation/faq_screen/faq_screen.dart';
import 'package:preeti_s_application3/presentation/faq_screen/binding/faq_binding.dart';
import 'package:preeti_s_application3/presentation/get_in_touch_screen/get_in_touch_screen.dart';
import 'package:preeti_s_application3/presentation/get_in_touch_screen/binding/get_in_touch_binding.dart';
import 'package:preeti_s_application3/presentation/tax_news_screen/tax_news_screen.dart';
import 'package:preeti_s_application3/presentation/tax_news_screen/binding/tax_news_binding.dart';
import 'package:preeti_s_application3/presentation/status_screen/status_screen.dart';
import 'package:preeti_s_application3/presentation/status_screen/binding/status_binding.dart';
import 'package:preeti_s_application3/presentation/settings_screen/settings_screen.dart';
import 'package:preeti_s_application3/presentation/settings_screen/binding/settings_binding.dart';
import 'package:preeti_s_application3/presentation/news_page_screen/news_page_screen.dart';
import 'package:preeti_s_application3/presentation/news_page_screen/binding/news_page_binding.dart';
import 'package:preeti_s_application3/presentation/app_settings_screen/app_settings_screen.dart';
import 'package:preeti_s_application3/presentation/app_settings_screen/binding/app_settings_binding.dart';
import 'package:preeti_s_application3/presentation/forget_password_screen/forget_password_screen.dart';
import 'package:preeti_s_application3/presentation/forget_password_screen/binding/forget_password_binding.dart';
import 'package:preeti_s_application3/presentation/upload_success_screen/upload_success_screen.dart';
import 'package:preeti_s_application3/presentation/upload_success_screen/binding/upload_success_binding.dart';
import 'package:preeti_s_application3/presentation/reset_password_screen/reset_password_screen.dart';
import 'package:preeti_s_application3/presentation/reset_password_screen/binding/reset_password_binding.dart';
import 'package:preeti_s_application3/presentation/payment_success_screen/payment_success_screen.dart';
import 'package:preeti_s_application3/presentation/payment_success_screen/binding/payment_success_binding.dart';
import 'package:preeti_s_application3/presentation/message_sent_screen/message_sent_screen.dart';
import 'package:preeti_s_application3/presentation/message_sent_screen/binding/message_sent_binding.dart';
import 'package:preeti_s_application3/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:preeti_s_application3/presentation/app_navigation_screen/binding/app_navigation_binding.dart';
import 'package:get/get.dart';

import '../presentation/splash_screen_four_screen/controller/splash_screen_four_controller.dart';

class AppRoutes {
  static const String splashScreenOneScreen = '/splash_screen_one_screen';

  static const String paymentScheduleScreen = '/payment_schedule_screen';

  static const String splashScreenTwoScreen = '/splash_screen_two_screen';

  static const String splashScreenThreeScreen = '/splash_screen_three_screen';

  static const String splashScreenFourScreen = '/splash_screen_four_screen';

  static const String onboardingScreenOneScreen =
      '/onboarding_screen_one_screen';

  static const String onboardingScreenTwoScreen =
      '/onboarding_screen_two_screen';

  static const String onboardingScreenThreeScreen =
      '/onboarding_screen_three_screen';

  static const String loginPageScreen = '/login_page_screen';
  static const String homeScreen = '/home_screen';

  static const String signupScreen = '/signup_screen';

  static const String dashboardPage = '/dashboard_page';

  static const String dashboardContainerScreen = '/dashboard_container_screen';

  static const String documentScreen = '/document_screen';

  static const String paymentPage = '/payment_page';

  static const String paymentTabContainerScreen =
      '/payment_tab_container_screen';

  static const String appionmentScreen = '/appionment_screen';

  static const String faqScreen = '/faq_screen';

  static const String getInTouchScreen = '/get_in_touch_screen';

  static const String taxNewsScreen = '/tax_news_screen';

  static const String statusScreen = '/status_screen';

  static const String settingsScreen = '/settings_screen';

  static const String newsPageScreen = '/news_page_screen';

  static const String appSettingsScreen = '/app_settings_screen';

  static const String forgetPasswordScreen = '/forget_password_screen';

  static const String uploadSuccessScreen = '/upload_success_screen';

  static const String appointmentScreen = '/appointment_screen';

  static const String resetPasswordScreen = '/reset_password_screen';

  static const String paymentSuccessScreen = '/payment_success_screen';

  static const String messageSentScreen = '/message_sent_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static List<GetPage> pages = [

    GetPage(
      name: paymentScheduleScreen,
      page: () => PaymentScheduleScreen(),
      bindings: [
        PaymentScheduleBinding(),
      ],
    ),


    GetPage(
      name: splashScreenFourScreen,
      page: () => SplashScreenFourScreen(),
      bindings: [
        SplashScreenFourBinding(),
      ],
    ),
    GetPage(
      name: onboardingScreenOneScreen,
      page: () => OnboardingScreenOneScreen(),
      bindings: [
        OnboardingScreenOneBinding(),
      ],
    ),
    GetPage(
      name: onboardingScreenTwoScreen,
      page: () => OnboardingScreenTwoScreen(),
      bindings: [
        OnboardingScreenTwoBinding(),
      ],
    ),
    GetPage(
      name: onboardingScreenThreeScreen,
      page: () => OnboardingScreenThreeScreen(),
      bindings: [
        OnboardingScreenThreeBinding(),
      ],
    ),
    GetPage(
      name: loginPageScreen,
      page: () => LoginPageScreen(),
      bindings: [
        LoginPageBinding(),
      ],
    ),  GetPage(
      name: homeScreen,
      page: () => Homescreen(isAppoinment: appoinmentNotification.value),
      bindings: [
        HomeScreenBinding(),
      ],
    ),
    GetPage(
      name: signupScreen,
      page: () => SignupScreen(),
      bindings: [
        SignupBinding(),
      ],
    ),
    GetPage(
      name: dashboardContainerScreen,
      page: () => DashboardContainerScreen(),
      bindings: [
        DashboardContainerBinding(),
      ],
    ),
    GetPage(
      name: documentScreen,
      page: () => DocumentScreen(),
      bindings: [
        DocumentBinding(),
      ],
    ),
    GetPage(
      name: paymentTabContainerScreen,
      page: () => PaymentTabContainerScreen(),
      bindings: [
        PaymentTabContainerBinding(),
      ],
    ),
    GetPage(
      name: appionmentScreen,
      page: () => AppionmentScreen(),
      bindings: [
        AppionmentBinding(),
      ],
    ),
    GetPage(
      name: faqScreen,
      page: () => FaqScreen(),
      bindings: [
        FaqBinding(),
      ],
    ),
    GetPage(
      name: getInTouchScreen,
      page: () => GetInTouchScreen(),
      bindings: [
        GetInTouchBinding(),
      ],
    ),
    GetPage(
      name: taxNewsScreen,
      page: () => TaxNewsScreen(),
      bindings: [
        TaxNewsBinding(),
      ],
    ),
    GetPage(
      name: statusScreen,
      page: () => StatusScreen(),
      bindings: [
        StatusBinding(),
      ],
    ),
    GetPage(
      name: settingsScreen,
      page: () => SettingsScreen(),
      bindings: [
        SettingsBinding(),
      ],
    ),
    GetPage(
      name: newsPageScreen,
      page: () => NewsPageScreen(),
      bindings: [
        NewsPageBinding(),
      ],
    ),
    GetPage(
      name: appSettingsScreen,
      page: () => AppSettingsScreen(),
      bindings: [
        AppSettingsBinding(),
      ],
    ),
    GetPage(
      name: forgetPasswordScreen,
      page: () => ForgetPasswordScreen(),
      bindings: [
        ForgetPasswordBinding(),
      ],
    ),
    GetPage(
      name: uploadSuccessScreen,
      page: () => UploadSuccessScreen(),
      bindings: [
        UploadSuccessBinding(),
      ],
    ),

    GetPage(
      name: resetPasswordScreen,
      page: () => ResetPasswordScreen(),
      bindings: [
        ResetPasswordBinding(),
      ],
    ),
    GetPage(
      name: paymentSuccessScreen,
      page: () => PaymentSuccessScreen(),
      bindings: [
        PaymentSuccessBinding(),
      ],
    ),
    GetPage(
      name: messageSentScreen,
      page: () => MessageSentScreen(),
      bindings: [
        MessageSentBinding(),
      ],
    ),
    GetPage(
      name: appNavigationScreen,
      page: () => AppNavigationScreen(),
      bindings: [
        AppNavigationBinding(),
      ],
    ),
    GetPage(
      name: initialRoute,
      page: () => SplashScreenFourScreen(),
      bindings: [
        SplashScreenFourBinding(),
      ],
    )
  ];
}
