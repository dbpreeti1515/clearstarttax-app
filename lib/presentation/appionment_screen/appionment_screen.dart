import 'package:flutter/gestures.dart';
import 'package:intl/intl.dart';
import 'package:preeti_s_application3/presentation/HomeScreen/controller/HomeScreenController.dart';
import 'package:preeti_s_application3/presentation/dashboard_page/controller/dashboard_controller.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/Comman/common_method.dart';
import '../../data/models/SuccessDialogBox/SuccessBox.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/comman_widget.dart';
import '../splash_screen/controller/splash_screen_four_controller.dart';
import 'controller/appionment_controller.dart';
import 'package:flutter/material.dart';
import 'package:preeti_s_application3/core/app_export.dart';
import 'package:preeti_s_application3/widgets/app_bar/appbar_leading_image.dart';

import 'package:preeti_s_application3/widgets/custom_outlined_button.dart';

class AppionmentScreen extends GetWidget<AppionmentController> {
  AppionmentScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
        child: Scaffold(
      appBar: CustomAppBar(
        leading:
        AppbarLeadingImage(
            imagePath: ImageConstant.imgSolarHamburgerMenuBroken,
            margin: EdgeInsets.all(mediaQueryData.size.width*.035),
            onTap: () {
              Scaffold.of(context).openDrawer();
              //onTapImage();
            }),

      ),
      body: Container(
          margin: EdgeInsets.only(bottom: 20),
          width: double.maxFinite,
          child: Column(children: [
            SizedBox(height: 19.v),
            Expanded(
                child: ScrollConfiguration(
                  behavior: ListScrollBehaviour(

                  ),
                  child: SingleChildScrollView(
                      child: Padding(
                          padding: EdgeInsets.only(
                              left: 30.h, right: 30.h, bottom: 5.v),
                          child: Column(children: [
                            Obx(
                              () => CW.buildDashboardRow(
                                  text: "msg_seamless_scheduling".tr),
                            ),
                            SizedBox(height: 20.v),
                            Container(
                                decoration: AppDecoration.outlineBlack.copyWith(
                                    borderRadius:
                                        BorderRadiusStyle.roundedBorder10),
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      CW.statusCard(
                                          text: "msg_book_your_appointment".tr,
                                          height: 57.v),
                                      SizedBox(height: 20.v),
                                      _buildColumnFrame(),
                                      Obx(() {
                                        print("${controller
                                            .isAppointmentAppear.value ==
                                            true} and i ${db.value!.status=="active"}");
                                        return db.value!.status=="active"
                                            ?  Obx(() =>

                                          controller
                                              .isAppointmentAppear.value == true
                                              ?Container(
                                                padding:
                                                    EdgeInsets.only(left: 15),
                                                child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      SizedBox(height: 20.v),
                                                      Obx(
                                                        () => Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  left: 5),
                                                          child: RichText(
                                                              text: TextSpan(
                                                                  children: [
                                                                    TextSpan(
                                                                        text: "lbl_officer_mail"
                                                                            .tr,
                                                                        style: CustomTextStyles
                                                                            .titleSmallBlack900_2),
                                                                    TextSpan(
                                                                        text: satOfficerEmail.value ??
                                                                            '',
                                                                        style: theme
                                                                            .textTheme
                                                                            .bodyMedium)
                                                                  ]),
                                                              textAlign:
                                                                  TextAlign
                                                                      .left),
                                                        ),
                                                      ),

                                                      if (controller
                                                          .formattterSelectedDate
                                                        .value!='null'&& controller
                                                          .formattterSelectedDate
                                                          .value!='') ...{
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  bottom: 5,
                                                                  top: 10,
                                                                  left: 5),
                                                          child: Row(
                                                            children: [
                                                              Text(
                                                                  "msg_slot_date_12_8_2023"
                                                                      .tr,
                                                                  style: CustomTextStyles
                                                                      .titleSmallBlack900_1),
                                                              Obx(
                                                                () => Text(
                                                                    controller
                                                                            .formattterSelectedDate
                                                                            .value ??
                                                                        "",
                                                                    style: theme
                                                                        .textTheme
                                                                        .bodyMedium),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      },

                                                      Padding(
                                                        padding: const EdgeInsets.only(right: 8.0),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Obx(
                                                              () => Radio(
                                                                  value: 60,
                                                                  groupValue:
                                                                      controller
                                                                          .selectedValue
                                                                          .value,
                                                                  onChanged: (int?
                                                                      value) {
                                                                    print(value!);
                                                                  }),
                                                            ),
                                                            Flexible(
                                                              flex: 1,
                                                              child: Text(
                                                                'msg_30_minute_time_slot'.tr,
                                                                style: TextStyle(fontSize: 12),
                                                              ),
                                                            ),

                                                          ],
                                                        ),
                                                      ),

                                                      // Add more radio button rows as needed

                                                      SizedBox(height: 15.v),
                                                      _buildColumnThirtySix(
                                                          context),
                                                      SizedBox(height: 30.v),
                                                    ]),
                                              )
                                              :appoinmentTime(
                                              controller.str,
                                              controller
                                                  .formattterDate
                                                  .value,
                                              controller
                                                  .selectedTimeZone.name))
                                            : appoinmentTime(
                                                controller.str,
                                                controller
                                                    .formattterDate
                                                    .value,
                                                controller
                                                    .selectedTimeZone.name);
                                      }),
                                      CW.termCondition(satOfficerEmail.value),
                                      SizedBox(
                                        height: 20,
                                      )
                                    ])),
                          ]))),
                ))
          ])),
    ));
  }

  /// Section Widget
  Widget _buildColumnFrame() {
    return Container(
        decoration:
            BoxDecoration(borderRadius: BorderRadiusStyle.roundedBorder10),
        child: Column(children: [
          SizedBox(
              height: 268.v,
              width: mediaQueryData.size.width,
              child: CalendarDatePicker(
                selectableDayPredicate: (DateTime date) {
                  return date.weekday != DateTime.sunday &&
                      date.weekday != DateTime.saturday;
                },
                initialDate: controller.selectedDate,
                firstDate: DateTime.now(),
                lastDate: DateTime(2101),
                onDateChanged: controller.handleDateChanged,
              ))
        ]));
  }

  /// Section Widget
  Widget _buildColumnThirtySix(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 0, right: 15),
        child: Column(children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("msg_select_your_time".tr, style: theme.textTheme.titleMedium),
            SizedBox(height: 10.v),
            Container(
              padding: EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.grey)),
              child: DropdownButtonFormField<String>(
                isExpanded: true,
                dropdownColor: Colors.white,
                padding: EdgeInsets.zero,
                iconDisabledColor: Colors.white,
                iconEnabledColor: Colors.white,
                decoration: InputDecoration.collapsed(
                    hintText: '',
                    hintStyle: TextStyle(overflow: TextOverflow.ellipsis)),
                value: controller.selectedTimeZone.value,
                onChanged: (String? newValue) {
                  controller.selectedTimeZone.value = newValue!;
                  print(newValue);
                },
                items: controller.timeZoneList.map((TimeZone value) {
                  return DropdownMenuItem<String>(
                    value: value.value,
                    child: Text(
                      value.name,
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 11),
                      overflow: TextOverflow.ellipsis,
                    ),
                  );
                }).toList(),
              ),
            ),
          ]),
          SizedBox(height: 30.v),
          CustomOutlinedButton(
              width: 216.h,
              buttonStyle:
                  ElevatedButton.styleFrom(backgroundColor: theme.primaryColor),
              text: "msg_get_available_slots".tr,
              onPressed: () async {
                if (controller.formattterSelectedDate.value == '' ||
                    controller.formattterSelectedDate.value=='null') {
                  CM.showToast('msg_date_selection'.tr);
                } else {
                  if (controller.formattterAPIdDate.value.isNotEmpty &&
                      controller.selectedDate != null) {
                    print(controller.formattterAPIdDate.value);
                    print(controller.selectedDate);
                    await controller.getAvailableAPI();
                  }

                  if (controller.getAvailableSlot.value.isNotEmpty)
                    showDateListDialog(context);

                }
              })
        ]));
  }

  void showDateListDialog(
    BuildContext context,
  ) {
    showDialog(
      useSafeArea: true,


      context: context,
      builder: (BuildContext context) {
        RxBool isColor = false.obs;
        return AlertDialog(
          insetPadding: EdgeInsets.all(25),
          contentPadding: EdgeInsets.only(left: 15, right: 15),
          shadowColor: Colors.transparent,
          backgroundColor: Colors.white,
          titlePadding: EdgeInsets.zero,
          title: Stack(
            children: [
              CW.statusCard(height: 57, text: "available_time_slots".tr),
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                    onPressed: () {
                      Get.back();
                      isColor.value = false;
                    },
                    icon: Icon(
                      Icons.close,
                      color: Colors.white,
                    )),
              )
            ],
          ),
          content: Container(
            margin: EdgeInsets.only(top: 10.v),
            decoration: BoxDecoration(),
            width: double.maxFinite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Obx(
                  () => Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "lbl_officer_mail".tr,
                              style: CustomTextStyles.titleSmallBlack900_2),
                          TextSpan(
                              text: satOfficerEmail.value ?? '',
                              style: theme.textTheme.bodyMedium)
                        ]),
                        textAlign: TextAlign.left),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10, top: 10, left: 5),
                  child: Row(
                    children: [
                      Text("msg_slot_date_12_8_2023".tr,
                          style: CustomTextStyles.titleSmallBlack900_1),
                      Obx(
                        () => Text(
                            controller.formattterSelectedDate.value ?? "",
                            style: theme.textTheme.bodyMedium),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Obx(
                      () => Radio(
                        value: 60,
                        groupValue: controller.selectedValue.value,
                        onChanged: (int? value) =>
                            controller.handleRadioValueChanged(value!),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Text(
                        'msg_30_minute_time_slot'.tr,
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                if(controller.getAvailableSlot.value.length>1)
                if (controller.getAvailableSlot.value[1].toString() ==
                    'All slots are booked for this date')
                  Center(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(onTap: () {
                            isColor.value = !isColor.value;
                          },
                              child: Obx(() {
                            return Container(
                              width: mediaQueryData.size.width,
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color:isColor.value
                                      ? theme.secondaryHeaderColor
                                      : Colors.white,
                                  border:
                                      Border.all(color: Colors.grey, width: 1),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Text(
                                controller.getAvailableSlot.value[0],
                                textAlign: TextAlign.center,
                              ),
                            );
                          })),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            controller.getAvailableSlot.value[1],
                            style: TextStyle(color: Colors.red),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                Obx(() {
                  return controller.getAvailableSlot.length>1?
                    controller.getAvailableSlot.value[1].toString() ==
                          'msg_all_secheduled_appointment'.tr
                      ? SizedBox()
                      : Container(
                          height: 150,
                          child: Scrollbar(
                            thickness: 4,
                            thumbVisibility: true,

                            child: ListView.separated(
                              padding: EdgeInsets.only(left: 5, right: 15) ,
                              physics: AlwaysScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                isColor.value = false;
                                controller.selectedIndex.value = 100;


                                  return controller.getAvailableSlot.value[1]
                                              .toString() ==
                                          'All slots are booked for this date'||
                                      controller.getAvailableSlot.value[0].toString()=="msg_no_secheduled_appointment".tr
                            
                                      ? Container(

                                          child: Column(
                                            children: [
                                              GestureDetector(
                                                  onTap: () {
                                                controller.selectedIndex.value =
                                                    index;
                                                {
                                                  controller.str = controller.getAvailableSlot
                                                      .value[index];
                                                  List<String> strarray =
                                                      controller.str.split("-");
                            
                                                  controller.selectedTimeSlot
                                                      .value = controller
                                                          .formattterAPIdDate
                                                          .value +
                                                      ' ' +
                                                      strarray[0];
                            
                                                  print(controller
                                                      .selectedTimeSlot.value);
                                                }
                                              },
                                                  child: Obx(() {
                            
                                                return Container(
                                                  padding: EdgeInsets.all(8),
                                                  decoration: BoxDecoration(
                                                      color: index == controller
                                                                  .selectedIndex
                                                                  .value
                                                          ? theme
                                                              .secondaryHeaderColor
                                                          : Colors.white,
                                                      border: Border.all(
                                                          color: Colors.grey,
                                                          width: 1),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  child: Text(
                                                    controller.getAvailableSlot
                                                        .value[0],
                                                    textAlign: TextAlign.center,
                                                  ),
                                                );
                                              }))
                                            ],
                                          ),
                                        )
                                      : GestureDetector(
                                      onTap: () {
                                          controller.selectedIndex.value = index;
                                          {
                                            controller.str = controller
                                                .getAvailableSlot.value[index];
                                            List<String> strarray =
                                                controller.str.split("-");
                            
                                            controller.selectedTimeSlot.value =
                                                controller.formattterAPIdDate
                                                        .value +
                                                    ' ' +
                                                    strarray[0];
                            
                                            print(controller
                                                .selectedTimeSlot.value);
                                          }
                                        }, child: Obx(() {
                                          return Container(
                                            padding: EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                                color: index ==
                                                        controller
                                                            .selectedIndex.value
                                                    ? theme.secondaryHeaderColor
                                                    : Colors.white,
                                                border: Border.all(
                                                    color: Colors.grey, width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: Text(
                                              controller
                                                  .getAvailableSlot.value[index],
                                              textAlign: TextAlign.center,
                                            ),
                                          );
                                        }));
                                },
                                separatorBuilder: (context, index) {
                                  return SizedBox(
                                    height: 10,
                                  );
                                },
                                itemCount:
                                    controller.getAvailableSlot.value.length),
                          ),
                        )
                      :SizedBox(
                    width: mediaQueryData.size.width,
                    child: GestureDetector(
                        onTap: () {
                          // controller.selectedIndex.value =
                          //     index;
                          {
                            // controller.str = controller.getAvailableSlot
                            //     .value[index];
                            List<String> strarray =
                            controller.str.split("-");

                            controller.selectedTimeSlot
                                .value = controller
                                .formattterAPIdDate
                                .value +
                                ' ' +
                                strarray[0];

                            print(controller
                                .selectedTimeSlot.value);
                          }
                        },
                        child: Obx(() {

                          return Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    color: Colors.grey,
                                    width: 1),
                                borderRadius:
                                BorderRadius.circular(
                                    5)),
                            child: Text(
                              controller.getAvailableSlot
                                  .value[0].toString().capitalizeFirst!,
                              textAlign: TextAlign.center,

                            ),
                          );
                        })),

                  );
                }),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.grey, width: 1)),
                  height: 100,
                  child: TextFormField(
                    controller: controller.messsageController,
                    maxLines: 15,
                    decoration: InputDecoration(
                        hintText: 'Write message', border: InputBorder.none),
                  ),
                )
              ],
            ),
          ),
          actions: [
            Center(
              child: controller.isLoading.value
                  ? CircularProgressIndicator()
                  : Container(
                      margin: EdgeInsets.only(top: 20),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                      decoration: BoxDecoration(
                          color: theme.primaryColor,
                          borderRadius: BorderRadius.circular(8)),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent),
                        onPressed: () {
                          if (controller.selectedTimeSlot.value.isNotEmpty &&
                                  controller.selectedIndex.value != 0 ||
                              controller.selectedTimeSlot.value != '' &&
                                  controller.selectedIndex.value != 0) {
                            print(controller.selectedIndex.value);
                            controller.bookAppoinmentAPI();
                          } else {
                            CM.showToast("Please select valid slot");
                          }
                          isColor.value = false;
                        },
                        child: Text(
                          'Book Appointment',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
            ),
          ],
        );
      },
    );
  }

  Widget appoinmentTime(String TimeSlot, String Date, String TimeZone) {
    print("This is date $Date");
    String formattedDate= '';
    if(Date.isNotEmpty||Date!=''){
      DateTime inputDate = DateFormat('dd/MM/yyyy').parse(Date);
      formattedDate = DateFormat('EEEE, MMMM d yyyy').format(inputDate);
    }


    return Container(
      margin: EdgeInsets.only(left: 15, right: 15, bottom: 20),
      child: Column(
        children: [
          Center(
              child: CustomImageView(
            imagePath: ImageConstant.imgSechdule,
            color: theme.primaryColor,
            height: 40,
            width: 40,
          )),
          SizedBox(
            height: 20.v,
          ),
          Text(
            "msg_confirmation".tr,
            style: TextStyle(
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w500,
                fontSize: 16),
          ),
          SizedBox(
            height: 15.h,
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(5)),
            child: Column(
              children: [
                timeText(
                    Icons.person,
                    Text(
                      "clear_start_tax".tr,
                      style: CustomTextStyles.textBlackMedium,
                    )),
                SizedBox(
                  height: 10.h,
                ),
                timeText(
                    Icons.more_time_outlined,
                    Row(
                      children: [
                        Container(
                          width: mediaQueryData.size.width / 3.4,
                          child: Text(
                            TimeSlot,
                            style: CustomTextStyles.textBlackMedium,
                          ),
                        ),
                        SizedBox(
                          width: 15.h,
                        ),
                        Container(
                          width: mediaQueryData.size.width / 3.4,
                          child: Text(
                            formattedDate,
                            style: CustomTextStyles.textBlackMedium,
                          ),
                        ),
                      ],
                    )),
                SizedBox(
                  height: 10.h,
                ),
                timeText(
                    Icons.more_time_outlined,
                    Flexible(
                        child: Text(
                      TimeZone,
                      style: CustomTextStyles.textBlackMedium,
                    ))),
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            "msg_appointmen_time".tr,
            style: TextStyle(color: Colors.black),
          ),
          SizedBox(
            height: 10.h,
          ),
          RichText(
            text: TextSpan(
                text: "msg_appointmen_bottom".tr,
                style: TextStyle(color: Colors.black, fontSize: 13),
                children: [
                  WidgetSpan(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      child: CustomImageView(
                        imagePath: ImageConstant.imgSolarPhoneCallingBroken,
                        height: 15.adaptSize,
                        width: 15,
                        margin: EdgeInsets.zero,
                      ),
                    ),
                  ),
                  TextSpan(
                    text: "lbl_888_235_0004".tr,
                    style: TextStyle(color: theme.primaryColor, fontSize: 12),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        _launchPhone();
                        // Handle tap event here
                      },
                  ),
                  TextSpan(text: 'msg_press'.tr)
                ]),
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }

  static void _launchPhone() async {
    const String phone = 'tel:+18882350004';
    if (await canLaunch(phone)) {
      await launch(phone);
    } else {
      throw 'Could not launch $phone';
    }
  }

  Widget timeText(IconData icons, Widget widget) {
    return Container(
      child: Row(
        children: [
          Icon(
            icons,
            color: Colors.grey,
            size: 20,
          ),
          SizedBox(
            width: 10.h,
          ),
          widget
        ],
      ),
    );
  }

  /// Navigates to the settingsScreen when the action is triggered.
  onTapImage() {
    Get.toNamed(
      AppRoutes.settingsScreen,
    );
  }

  /// Navigates to the appointmentScreen when the action is triggered.

}
