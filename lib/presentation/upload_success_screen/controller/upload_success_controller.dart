import 'package:preeti_s_application3/core/app_export.dart';
import 'package:preeti_s_application3/presentation/upload_success_screen/models/upload_success_model.dart';

/// A controller class for the UploadSuccessScreen.
///
/// This class manages the state of the UploadSuccessScreen, including the
/// current uploadSuccessModelObj
class UploadSuccessController extends GetxController {
  Rx<UploadSuccessModel> uploadSuccessModelObj = UploadSuccessModel().obs;
}
