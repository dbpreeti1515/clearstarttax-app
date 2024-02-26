import '../controller/message_sent_controller.dart';
import 'package:get/get.dart';

/// A binding class for the MessageSentScreen.
///
/// This class ensures that the MessageSentController is created when the
/// MessageSentScreen is first loaded.
class MessageSentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MessageSentController());
  }
}
