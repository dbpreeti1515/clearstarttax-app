import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart'as http;
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:preeti_s_application3/core/app_export.dart';
import 'package:preeti_s_application3/data/API_Services/apiEndpoint.dart';
import 'package:preeti_s_application3/data/api_constant/api_constant.dart';
import 'package:preeti_s_application3/presentation/dashboard_page/controller/dashboard_controller.dart';
import 'package:preeti_s_application3/presentation/document_screen/models/document_model.dart';
import 'package:flutter/material.dart';

import '../../../data/Comman/common_method.dart';
import '../../../data/apiModal/getUserModal.dart';
import '../../../data/http_methods/http_methods.dart';
import '../../../data/models/SuccessDialogBox/SuccessBox.dart';

/// A controller class for the DocumentScreen.
///
/// This class manages the state of the DocumentScreen, including the
/// current documentModelObj
class DocumentController extends GetxController {
  Rx<DocumentModel> documentModelObj = DocumentModel().obs;

  File? pdfFile;
  RxString FilePath = ''.obs;
  RxMap uploadDocumentData = Map().obs;
  RxBool isLoading = false.obs;




  @override
  void onInit()async {
    // TODO: implement onInit

    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) {});

  }

  Future<File?> pickPDF() async {

    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
      allowMultiple: false,
      withData: true,
    );

    if (result != null && result.files.first.extension == 'pdf') {
      File file = File(result.files.single.path!);
      return file;
    }else{
      CM.showToast(" Please pdf Document ");
      FilePicker.platform.clearTemporaryFiles();

      return null;
    }

    return null;
  }

  Future<void> uploadPDF(File file,BuildContext context) async {
    isLoading.value = true;
    print(1);
    var url = Uri.parse(UriConstant.uploadDocumentURL);
    var queryParams = {
      ApiKey.apikey: ApiKey.apikeyvalue.toString(),
    ApiKey.CaseID:caseId,
    };
    print(2);
    isLoading.value = true;
   // var uri = Uri.parse(url.toString()).replace(queryParameters: queryParams);
    
    print(3);

    var request = http.MultipartRequest('POST', Uri.parse('https://clearstart.irslogics.com/publicapi/2020-02-22/documents/casedocument?apikey=f08f2b3c48ad4134b4ef62abd4aa721d&CaseID=$caseId&Comment=test'))
      ..files.add(await http.MultipartFile.fromPath('file', file.path));
    isLoading.value = true;
    print(4);
    try {

      var response = await request.send();
      print(5);
      isLoading.value = true;
      print(response.stream.toString());
      print(response.toString());
      isLoading.value = true;

      print(6);
      if (response.statusCode == 200) {
        print(7);
        isLoading.value = false;

        SuccessDialog.showCustomDialog(
            context, "msg_congratulations".tr, 'msg_document_sent_your'.tr, true);

       pdfFile = null;
        FilePath.value= '';
        print('File uploaded successfully');
      } else {
        isLoading.value = false;
        print('File upload failed with status: ${response.statusCode}');
      }
    }
    catch (e) {
      print(8);

      isLoading.value = false;
      print('Error during file upload: $e');
    }
  }



}
