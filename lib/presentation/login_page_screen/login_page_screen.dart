

import '../../core/validator/validator.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/comman_widget.dart';
import 'controller/login_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:preeti_s_application3/core/app_export.dart';
import 'package:preeti_s_application3/core/utils/validation_functions.dart';
import 'package:preeti_s_application3/widgets/custom_checkbox_button.dart';
import 'package:preeti_s_application3/widgets/custom_outlined_button.dart';
import 'package:preeti_s_application3/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class LoginPageScreen extends GetWidget<LoginPageController> {
  LoginPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Scaffold(

      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Container(

          height: mediaQueryData.size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(ImageConstant.imgbackground),
                  fit: BoxFit.cover
              )
          ),
          child: ScrollConfiguration(
            behavior: ListScrollBehaviour(),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  Container(
                      height: 70.v,
                      margin: EdgeInsets.only(left: 0.h, top: 75.v, bottom: 60.v),
                      child: Stack(alignment: Alignment.topLeft, children: [
                        Container(
                          margin:
                          EdgeInsets.only( top: 17.v, bottom: 10.v),
                          child: Image(
                            image: AssetImage(
                              ImageConstant.imgImage2,
                            ),
                          ),
                        ),
                        // AppbarTitleImage(
                        //     imagePath: ImageConstant.imgSantaHat1,
                        //     margin: EdgeInsets.only(right: 204.h, bottom: 33.v))
                      ])),
                  Container(
                    margin: EdgeInsets.only(left: 18,right: 18),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color:ColorSchemes.primaryColorScheme.background ),
                    

                    child: Form(
                      key: controller.form_Key,
                        child: Column(
                      children: [
                        _buildWelcomeBackTo(),
                        SizedBox(height: 25.v),
                        emailInputBox(context),
                        SizedBox(height: 15.v),
                        passwordInputBox(context),

                        signInButtton(),
                        SizedBox(height: 20.v),
                      ],
                    )),
                  ),

                  SizedBox(height: 5.v),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildWelcomeBackTo() {
    return Container(
      margin: EdgeInsets.only(top: 25),
      child: Text('msg_welcome'.tr,
      style: CustomTextStyles.titleMediumPrimary,),
    );
  }

  /// Section Widget
  Widget emailInputBox(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("msg_enter_address".tr, style: CustomTextStyles.titleMedium),
          SizedBox(height: 8.v),
          CW.commonTextFieldForLoginSignUP(
            context: context,
            contentPadding: EdgeInsets.all(6),
            controller: controller.emailController,
            prefixIcon: CustomImageView(
                imagePath: ImageConstant.imgSolarUserIdBroken,
                height: 16.adaptSize,
                width: 16.adaptSize,
                margin: EdgeInsets.symmetric(vertical: 11.v, horizontal: 10)),
            validator: (value) => Validator.isEmailValid(value: value),
            keyboardType: TextInputType.emailAddress,
            hintText: "msg_example_gmail_com".tr,
          ),
        ]));
  }

  /// Section Widget
  Widget passwordInputBox(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.h),

        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("lbl_password".tr, style: CustomTextStyles.titleMedium),
          SizedBox(height: 8.v),
          CW.commonTextFieldForLoginSignUP(
            context: context,
            contentPadding: EdgeInsets.all(6),
            controller: controller.passwordController,
            hintStyle: TextStyle(fontSize:14 ),
            hintText: "msg_password".tr,
            keyboardType: TextInputType.visiblePassword,
            prefixIcon: Container(
                margin: EdgeInsets.symmetric(horizontal: 10.h, vertical: 0.v),
                child: CustomImageView(
                    imagePath: ImageConstant.imgSolarpasswordbroken,
                    height: 16.adaptSize,
                    width: 16.adaptSize)),

            validator: (value) => Validator.isPasswordValid(value: value),
          ),
        ]));
  }

  /// Section Widget
  Widget signInButtton() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
            children: [
          // Align(
          //     alignment: Alignment.centerLeft,
          //     child: Obx(() => CustomCheckboxButton(
          //         alignment: Alignment.centerLeft,
          //         text: "lbl_remember_me".tr,
          //         textStyle: CustomTextStyles.checkboxheading,
          //         value: controller.rememberMe.value,
          //         decoration: BoxDecoration(
          //
          //         ),
          //         padding: EdgeInsets.symmetric(vertical: 1.v),
          //         onChange: (value) {
          //           controller.rememberMe.value = value;
          //         }))),
          Container(



            child: TextButton(
                style: TextButton.styleFrom(padding: EdgeInsets.only(right: 5),

                ),
                onPressed: () {
                  controller.onTapTxtForgotYourPassword();
                },
                child: Text("msg_forgot_your_password".tr,
                    style: CustomTextStyles.bodyLargePrimary
                       )),
          ),



          Obx(() {
            return  controller.isLoading.value?Center(
              child: CircularProgressIndicator(),):
            CustomOutlinedButton(
              height: 40,

              text: "lbl_sign_in".tr,
              decoration: BoxDecoration(
                  color: ColorSchemes.primaryColorScheme.primary,
                  borderRadius: BorderRadius.circular(5)),
              onPressed: () => controller.clickOnSignUpButton(),
            );
          })
       ,


          Container(


            margin: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text("msg_don_t_have_an_account".tr,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyLarge!.copyWith(color: Colors.white)),
                ),
                SizedBox(width: 5.h,),
                TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size(40, 30),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,),
                    onPressed: () {
                      controller.onTapTxtSignUpNow();
                    },
                    child: Text("lbl_sign_up_now".tr,
                        style: CustomTextStyles.bodyExtraLargePrimary))
              ],
            ),
          ),
          SizedBox(height: 20.v,),

          CW.termCondition('msg_info_clearstarttax_com'.tr,textColor: Colors.white)



        ]));
  }

  /// Navigates to the dashboardContainerScreen when the action is triggered.

  /// Navigates to the forgetPasswordScreen when the action is triggered.

}
