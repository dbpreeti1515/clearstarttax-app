import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:preeti_s_application3/core/app_export.dart';
import 'package:preeti_s_application3/presentation/message_sent_screen/models/message_sent_model.dart';

/// A controller class for the MessageSentScreen.
///
/// This class manages the state of the MessageSentScreen, including the
/// current messageSentModelObj
class MessageSentController extends GetxController with GetTickerProviderStateMixin {
  Rx<MessageSentModel> messageSentModelObj = MessageSentModel().obs;
  RxBool isExpanded = false.obs;

}
