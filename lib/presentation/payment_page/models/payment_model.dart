import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:preeti_s_application3/core/app_export.dart';
import 'package:preeti_s_application3/data/apiModal/getPaymentModal.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../widgets/comman_widget.dart';
import '../controller/payment_controller.dart';

/// This class defines the variables used in the [payment_page],
/// and is typically used to hold data that is passed between different parts of the application.
class PaymentModel {
   static void _launchEmail() async {

    final controller = Get.put(PaymentController());
  const String email = 'mailto:billing@clearstarttax.com';
  if (await canLaunch(email)) {
  await launch(email);
  } else {
  throw 'Could not launch $email';
  }
}

static void _launchPhone() async {
  const String phone = 'tel:+18882350004';
  if (await canLaunch(phone)) {
    await launch(phone);
  } else {
    throw 'Could not launch $phone';
  }
}

  static void showCardPaymentDialog(
      BuildContext context, String email, String amount,String transectionId) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          contentPadding: EdgeInsets.only(left: 15.h, right: 15.h, bottom: 20),
          title: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Image(
                  image: AssetImage(ImageConstant.imgcorrect),
                  height: 56.v,
                  width: 56.h,
                ),
                SizedBox(
                  height: 15.v,
                ),
            Center(
              child: RichText(
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(
                      text: 'msg_payment_successful'.tr,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        foreground: Paint()
                          ..shader = LinearGradient(
                            colors: [Colors.blue, Colors.green,
                              Color(0xFF40c8b1),
                              Color(0xFF43d499),
                            ],
                          ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
                      ),
                    ),

                  ],
                ),
              ),),

                SizedBox(
                  height: 20.v,
                ),
              ],
            ),
          ),
          content: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "msg_remaining_balance_title".tr + email,
                  style: dateContentStyle(),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20.v,
                ),
                Text(
                  "msg_card_payment_successs".tr,
                  style: dateContentStyle(),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20.v,
                ),
                Text(
                  "msg_remaining_balance_paid".tr + "\$" + amount,
                  style: dateContentStyle(),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10.v,
                ),
                Text(
                  "msg_remaining_balance_transition".tr + "\$" + transectionId,
                  style: dateContentStyle(),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10.v,
                ),
                Divider(
                  color: Colors.grey.shade400,
                  height: 2,
                  thickness: 2,
                ),
                SizedBox(
                  height: 10.v,
                ),
                Text(
                  'msg_remaining_balance_bottom'.tr,
                  style: dateContentStyle(),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
          actions: [
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 0),
                decoration: BoxDecoration(
                    color: theme.primaryColor,
                    borderRadius: BorderRadius.circular(8)),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Close',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
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

  static void showBankTransferDialog(
      BuildContext context, String email, String amount) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          contentPadding: EdgeInsets.only(left: 15.h, right: 15.h, bottom: 20),
          title: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),

                Image(
                  image: AssetImage(ImageConstant.imgcorrect),
                  height: 56.v,
                  width: 56.h,
                ),
                SizedBox(
                  height: 15.v,
                ),
            Center(
              child: RichText(
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(
                      text: 'msg_payment_successful'.tr,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        foreground: Paint()
                          ..shader = LinearGradient(
                            colors: [Colors.blue, Colors.green,
                              Color(0xFF40c8b1),
                              Color(0xFF43d499),
                            ],
                          ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
                      ),
                    ),

                  ],
                ),
              ),),

                SizedBox(
                  height: 20.v,
                ),
              ],
            ),
          ),
          content: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "msg_remaining_balance_title".tr + email,
                  style: dateContentStyle(),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20.v,
                ),
                Text(
                  "msg_bank_payment_successs".tr,
                  style: dateContentStyle(),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20.v,
                ),
                Text(
                  "msg_remaining_balance_paid".tr + "\$" + amount,
                  style: dateContentStyle(),
                  textAlign: TextAlign.center,
                ),

                SizedBox(
                  height: 10.v,
                ),
                Divider(
                  color: Colors.grey.shade400,
                  height: 2,
                  thickness: 2,
                ),
                SizedBox(
                  height: 10.v,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: SelectableText.rich(
                      TextSpan(
                        text: 'For payment questions, contact our team at \n',
                        children: [
                          TextSpan(
                            text: 'billing@clearstarttax.com',
                            style: TextStyle( fontWeight: FontWeight.w400,
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                _launchEmail();
                              },
                          ),
                          TextSpan(text: ' or '),
                          TextSpan(
                            text: '888-235-0004',
                            style: TextStyle( fontWeight: FontWeight.w400,
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                _launchPhone();
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),


              ],
            ),
          ),
          actions: [
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 0),
                decoration: BoxDecoration(
                    color: theme.primaryColor,
                    borderRadius: BorderRadius.circular(8)),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Close',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
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
   static void showTransactionFailedDialog(BuildContext context,String message) {
     showDialog(
       context: context,
       builder: (BuildContext context) {
         return AlertDialog(
           backgroundColor: Colors.white,
           title:RichText(
             text:  TextSpan(
               text: 'Transaction '+message,
               style: TextStyle(
                 color: Colors.black,
                 fontSize: 18,

               ),children: [
                 TextSpan(
                   text: ''
                 )
             ]
             ),
           ),
           content: Column(
             mainAxisSize: MainAxisSize.min,
             children: [
               SvgPicture.asset(ImageConstant.transectionFailed,width: 56,height: 56,),
               SizedBox(height: 16),
               Text('msg_remaining_faild_transection'.tr,style: dateContentStyle(),textAlign: TextAlign.center,),
             ],
           ),
           actions: [
             Center(
               child: Container(
                 margin: EdgeInsets.only(top: 10),
                 padding: EdgeInsets.symmetric(horizontal: 40, vertical: 0),
                 decoration: BoxDecoration(
                     color: theme.primaryColor,
                     borderRadius: BorderRadius.circular(8)),
                 child: ElevatedButton(
                   style: ElevatedButton.styleFrom(
                       backgroundColor: Colors.transparent,
                       shadowColor: Colors.transparent),
                   onPressed: () {
                     Navigator.of(context).pop();
                   },
                   child: Text(
                     'Close',
                     style: TextStyle(
                         color: Colors.white,
                         fontSize: 15,
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
  static void showDateListDialog(
      BuildContext context, List<PaymentSchedular> data) {
    DateTime currentDate = DateTime.now();
    List<DateTime> currentDateList = [];
    List<DateTime> otherDateList = [];
    List<int> currentAmount = [];
    List<int> otherAmount = [];
    print(data.length);
    for (PaymentSchedular dateString in data) {
      print(dateString.scheduledDate);
      DateTime date = DateTime.parse(dateString.scheduledDate!);

      if (date.isBefore(currentDate)) {
        currentDateList.add(date);
        currentAmount.add(dateString.amount!);
      } else {
        otherDateList.add(date);
        otherAmount.add(dateString.amount!);
      }
    }

    showDialog(
      useSafeArea: true,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          shadowColor: Colors.transparent,
          backgroundColor: Colors.white,
          titlePadding: EdgeInsets.zero,
          title: CW.statusCard(height: 57.v, text: 'Payment Schedule'),
          content: Container(
            decoration: BoxDecoration(),
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 10,
                ),
                DataHeading(),
                generatePastDates(currentDateList, currentAmount),
                SizedBox(
                  height: 25,
                ),
                Text(
                  'Upcoming Payments:',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                ),
                SizedBox(
                  height: 15,
                ),
                DataHeading(),
                generatePastDates(otherDateList, otherAmount),
              ],
            ),
          ),
          actions: [
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 0),
                decoration: BoxDecoration(
                    color: theme.primaryColor,
                    borderRadius: BorderRadius.circular(8)),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Close',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
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

  static Widget generatePastDates(List<DateTime> date, List<int> amount) {
    // Generate some past dates for demonstration
    final List formattedDate;

    return Container(
      height: 100,
      child: ListView.separated(
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    DateFormat('dd/MM/yyyy').format(date[index]).toString(),
                    style: dateContentStyle(),
                  ),
                  Text(
                    "\$" +
                        double.parse(amount[index].toString())
                            .toStringAsFixed(2)
                            .toString(),
                    style: dateContentStyle(),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 15.v,
            );
          },
          itemCount: date.length),
    );
  }

  static List<DateTime> generateUpcomingDates() {
    // Generate some upcoming dates for demonstration
    return List.generate(
      5,
      (index) => DateTime.now().add(Duration(days: index + 1)),
    );
  }

  static Widget DataHeading() {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Date',
                style: dateHeadingStyle(),
              ),
              Text(
                'Amount',
                style: dateHeadingStyle(),
              ),
            ],
          ),
          Divider(
            color: Colors.grey.shade400,
          ),
        ],
      ),
    );
  }

  static Widget DateList(
      {List<DateTime>? pastDates, List<DateTime>? upcomingDates}) {
    return Container(
      height: 120,
      child: ListView.builder(
        itemCount: pastDates?.length ?? 0,
        itemBuilder: (context, index) {
          DateTime date = pastDates![index];
          return ListTile(
            title: Text(
              '${date.day}/${date.month}/${date.year}',
              style: TextStyle(color: Colors.red),
            ),
          );
        },
      ),
    );
  }

  static TextStyle dateHeadingStyle() {
    return TextStyle(
        color: Colors.black, fontWeight: FontWeight.w600, fontSize: 14);
  }

  static TextStyle dateContentStyle() {
    return TextStyle(
        fontWeight: FontWeight.w400, color: Colors.black, fontSize: 13);
  }
}
