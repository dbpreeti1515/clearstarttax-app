import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:preeti_s_application3/core/app_export.dart';

import '../../../theme/app_decoration.dart';
import '../../../theme/custom_text_style.dart';
int value = 1;
class pageSliderModal extends GetWidget {

  @override
  Widget build(BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 2.v),
    decoration: AppDecoration.fillOnPrimaryContainer
        .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("msg_what_our_customer".tr,
            style: CustomTextStyles.titleMediumPrimary),
        SizedBox(height: 7.v),
        Container(
          margin: EdgeInsets.only(top: 10, bottom: 10),
          height: 260,
          child: CarouselSlider(


            options: CarouselOptions(
              height: 260.v,

              // autoPlay: true,
             // aspectRatio: 0,
              viewportFraction: 0.65, // Adjust this value to change the width of pages
              aspectRatio: 16 / 9,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.zoom,
              enlargeFactor: 0.2,

            ),
            items: imageSliders,
          ),
        ),
      ],
    ),
  );
  }
final List<Widget> imageSliders = imgList.map((item) {
  print(item);

  return SizedBox(
    //  width: double.maxFinite,
    //height: 500.v,
    child: Align(
      alignment: Alignment.centerRight,
      child: Container(
        width: 213.h,
        height: 255,
        margin: EdgeInsets.only(bottom: 10.v, top: 10.h),
        padding: EdgeInsets.symmetric(
          horizontal: 15.h,
          vertical: 10.v,
        ),
        decoration: AppDecoration.outlineBlack9001.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder10,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomImageView(
              imagePath: item.image,
              height: 80.adaptSize,
              width: 80.adaptSize,
              radius: BorderRadius.circular(
                40.h,
              ),
            ),
             SizedBox(height: 14.v),
            Text(

              item.heading,
              style: theme.textTheme.titleSmall,
            ),
            SizedBox(height: 5.v),
            SizedBox(
              width: 179.h,
              child: Text(
                item.data,


                // overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodySmall,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}).toList();

}
final List<Testimonial> imgList = [


  Testimonial(image: 'assets/images/img_ellipse_5.png', heading: " Andrew C.", data:  "It’s just so much of a relief you know? Somebody going through a major debt crisis I would say: take care of it now. Don’t wait for them to take your stuff. ",),
  Testimonial(image: 'assets/images/img_ellipse_6.png', heading: 'David M.', data: 'I don’t know what I would have done without their help. I really don’t… I would recommend Clear Start Tax Relief because they did a good job for me. '),
  Testimonial(image: 'assets/images/img_ellipse_6_1.png', heading: 'Lori L.', data: 'I’m just not as stressed as I was once the compromised offer was given to me, and if anybody else is going through this issue please give Clear Start Tax a call.'),
  Testimonial(image:  'assets/images/img_ellipse_6_80x80.png', heading: 'Andrew C.', data: '“It’s just so much of a relief you know? Somebody going through a major debt crisis I would say: take care of it now. Don’t wait for them to take your stuff. “'),





];
class Testimonial{
  final String image;
  final String heading;
  final String data;

  Testimonial({required this.image, required this.heading, required this.data});
}
