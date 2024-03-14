



import '../../core/validator/validator.dart';
import '../../widgets/comman_widget.dart';
import 'controller/forget_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:preeti_s_application3/core/app_export.dart';
import 'package:preeti_s_application3/widgets/custom_outlined_button.dart';

class ForgetPasswordScreen extends GetWidget<ForgetPasswordController> {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(

        body: Container(
            height: mediaQueryData.size.height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(ImageConstant.imgbackground),
                    fit: BoxFit.cover
                )
            ),
            child: SingleChildScrollView(
              child: Column(children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 28),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10,),
                        child:IconButton(
                          icon: Icon(Icons.arrow_back_ios),
                          color: Colors.white,
                          onPressed: (){
                            Get.back();

                          },
                        ),
                      ),
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
                      SizedBox()
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 18,right: 18),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color:ColorSchemes.primaryColorScheme.background ),
                  child: Form(
                    key: controller.formKey,
                    child: Column( children: [
                      SizedBox(height: 10.v,),
                      Center(
                        child: Text("msg_reset_password_heading".tr,
                            style: CustomTextStyles.titleMediumPrimary,textAlign: TextAlign.center,),

                      ),


                      SizedBox(height: 30.v),
                      emailInputBox(context),
                      SizedBox(height: 35.v),
                      onSubmitButton(context),
                      SizedBox(height: 10.v,),

                    ]),
                  ),
                ),



              ]),
            )));
  }


  Widget emailInputBox(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("lbl_email_address2".tr,style: CustomTextStyles.titleMedium),
          SizedBox(height: 10.v),
          CW.commonTextFieldForLoginSignUP(
            context: context,
            contentPadding: EdgeInsets.all(6),

         //   controller: controller.emailController,
            prefixIcon:     CustomImageView(
                imagePath: ImageConstant.imgSolarNotificat,
                height: 16.adaptSize,
                width: 16.adaptSize,
                margin: EdgeInsets.symmetric(vertical: 11.v,horizontal: 15)),
            validator:(value) => Validator.isEmailValid(value: value),
            keyboardType: TextInputType.emailAddress,
            hintText: "msg_please_enter_your2".tr,







          ),
          SizedBox(height: 9.v),
          Padding(
              padding: EdgeInsets.only(left: 0.h),
              child: Text("msg_password_reset_instructions".tr,
                  style: CustomTextStyles.bodySmall10)),



        ]));
  }
  /// Section Widget
  Widget onSubmitButton(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 0.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

          CustomOutlinedButton(
            height: 40,
            text: "lbl_submit".tr,
            decoration: BoxDecoration(
                color: ColorSchemes.primaryColorScheme.primary,
                borderRadius: BorderRadius.circular(5)
            ),
            onPressed: () => controller.clickOnForgetPasswordButton(context),



          ),
          SizedBox(height: 20.v),

          CW.termCondition('msg_info_clearstarttax_com'.tr,textColor: Colors.white),




        ]));
  }

  /// Navigates to the resetPasswordScreen when the action is triggered.

}
