import 'package:preeti_s_application3/core/app_export.dart';
import 'package:preeti_s_application3/presentation/dashboard_container_screen/models/dashboard_container_model.dart';

import '../../../widgets/custom_bottom_bar.dart';

/// A controller class for the DashboardContainerScreen.
///
/// This class manages the state of the DashboardContainerScreen, including the
/// current dashboardContainerModelObj
class DashboardContainerController extends GetxController {
  Rx<DashboardContainerModel> dashboardContainerModelObj =
      DashboardContainerModel().obs;
  var selectedIndex = 0.obs; // Observable for the selected index

  void changePage(int index) {
    selectedIndex.value = index;
    // Use Get.to() to navigate to the selected page
    switch (index) {
      case 0:
        Get.toNamed('/home');
        break;
      case 1:
        Get.toNamed('/page1');
        break;
      case 2:
        Get.toNamed('/page2');
        break;
      case 3:
        Get.toNamed('/page3');
        break;
    }
  }

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgDashboard,
      activeIcon: ImageConstant.imgDashboard,
      type: BottomBarEnum.Dashboard,


    ),
    BottomMenuModel(
      icon: ImageConstant.imgDocument,
      activeIcon: ImageConstant.imgDocument,
      type: BottomBarEnum.Document,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgCamera,
      activeIcon: ImageConstant.imgCamera,
      type: BottomBarEnum.Camera,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgAppoinment,
      activeIcon: ImageConstant.imgAppoinment,
      type: BottomBarEnum.Appoinment,
    )
  ];
  onTaxNews() {
    Get.toNamed(
      AppRoutes.taxNewsScreen,
    );
  }
  onAppSetting() {
    Get.toNamed(
      AppRoutes.appSettingsScreen,
    );
  }
  onFQQ() {
    Get.toNamed(
      AppRoutes.faqScreen,
    );
  }
  onGetInTouch() {
    Get.toNamed(
      AppRoutes.getInTouchScreen,
    );
  }
  onLogout() {
    Get.toNamed(
      AppRoutes.loginPageScreen,
    );
  }
}
