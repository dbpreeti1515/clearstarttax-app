import 'package:flutter/material.dart';
import 'package:preeti_s_application3/core/app_export.dart';

class CustomBottomBar extends StatelessWidget {
  CustomBottomBar({
    Key? key,
    this.onChanged,
  }) : super(
          key: key,
        );

  RxInt selectedIndex = 0.obs;

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

  Function(BottomBarEnum)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 83.v,
      decoration: BoxDecoration(
        color: theme.colorScheme.onPrimaryContainer,
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.25),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              0,
            ),
          ),
        ],
      ),
      child: Obx(
        () => BottomNavigationBar(
          backgroundColor: Colors.transparent,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedFontSize: 0,
          elevation: 0,
          selectedItemColor: Colors.blue,
          currentIndex: selectedIndex.value,
          type: BottomNavigationBarType.fixed,
          items: List.generate(bottomMenuList.length, (index) {
            return BottomNavigationBarItem(
              icon: CustomImageView(
                imagePath: bottomMenuList[index].icon,
                height: 40.adaptSize,
                width: 40.adaptSize,
                color: appTheme.black900,
                onTap: (){
                  print("this is index $index");

                },

              ),
              activeIcon: CustomImageView(
                imagePath: bottomMenuList[index].activeIcon,
                height: 35.adaptSize,
                width: 35.adaptSize,
                color: appTheme.blueGray100,
              ),

              label: '',
            );
          }),
          onTap: (index) {
            selectedIndex.value = index;
            print("Selected index $selectedIndex and $index");
            onChanged?.call(bottomMenuList[index].type);
          },
        ),
      ),
    );
  }
}

enum BottomBarEnum {
  Dashboard,
  Document,
  Camera,
  Appoinment,
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    required this.type,
  });

  String icon;

  String activeIcon;

  BottomBarEnum type;
}

class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
