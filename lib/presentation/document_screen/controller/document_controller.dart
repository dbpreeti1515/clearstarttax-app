import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:preeti_s_application3/core/app_export.dart';
import 'package:preeti_s_application3/data/API_Services/apiEndpoint.dart';
import 'package:path/path.dart' as path;
import 'package:preeti_s_application3/presentation/dashboard_page/controller/dashboard_controller.dart';
import 'package:preeti_s_application3/presentation/document_screen/models/document_model.dart';
import 'package:flutter/material.dart';

import '../../../api_constant/api_constant.dart';
import '../../../data/Comman/common_method.dart';
import '../../../data/apiModal/getSelltementOfficerModal.dart';
import '../../../data/apiModal/getUserModal.dart';

import '../../../data/models/SuccessDialogBox/SuccessBox.dart';

/// A controller class for the DocumentScreen.
///
/// This class manages the state of the DocumentScreen, including the
/// current documentModelObj
class DocumentController extends GetxController {
  Rx<DocumentModel> documentModelObj = DocumentModel().obs;
  final getSatOfficerData = Rxn<GetSattlementOfficerModal>();
  File? pdfFile;
  final ScrollController scrollController = ScrollController();
  RxMap uploadDocumentData = Map().obs;
  RxBool isLoading = false.obs;
  RxString uploadUrl = "".tr.obs;
  var git;
  List? multipartFiles;

  RxList<File> selectedFiles = <File>[].obs;

  @override
  void onInit() async {
    // TODO: implement onInit

    super.onInit();
    await getSettlementOfficerAPI();
    WidgetsBinding.instance.addPostFrameCallback((_) {});
  }

  // This Function collect List of all the images selected by user and convert them into multipart files
  static Future<List<http.MultipartFile>> collectImages(
      List<File> files) async {
    List<http.MultipartFile> multipartFiles = [];
    for (var file in files) {
      final bytes = await file.readAsBytes();
      final multipartFile = http.MultipartFile.fromBytes(
        'files', // Field name expected by your API
        bytes,
        filename: file.path.split('/').last,
      );
      multipartFiles.add(multipartFile);
    }

    return multipartFiles;
  }

  Future<void> pickPDF() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.any,
    );

    if (result != null) {
      // Filter out duplicate paths before adding to selectedFiles
      Set<String?> newPaths = result.paths.toSet();
      newPaths.removeWhere(
          (path) => selectedFiles.any((file) => file.path == path));

      // Add the new unique files to selectedFiles
      selectedFiles.addAll(newPaths.map((path) => File(path!)));

      // Show toast if all selected files were duplicates
      if (newPaths.isEmpty) {
        CM.showToast("All selected documents are duplicates.");
      }
    } else {
      CM.showToast("Please select a document.");
      FilePicker.platform.clearTemporaryFiles();
      return;
    }

    return;
  }

  Future<void> uploadPDF(BuildContext context) async {
    print(selectedFiles.value.length);
    var response;
    isLoading.value = true;
       for (var file in selectedFiles.value) {
         var request = http.MultipartRequest(
             'POST',
             Uri.parse(
                 'https://clearstart.irslogics.com/publicapi/2020-02-22/documents/casedocument?apikey=f08f2b3c48ad4134b4ef62abd4aa721d&CaseID=$caseId&Comment=test'));
         //   for (var file in selectedFiles.value) {
         request.files.add(
           await http.MultipartFile.fromPath(
             'File', // Field name expected by your API
            file.path,
           ),
         );
         // }
         isLoading.value = true;
          response = await request.send();
       }

    try {



      isLoading.value = true;
      var data = await response.stream.bytesToString();
      var map = jsonDecode(data);

      isLoading.value = true;

      if (response.statusCode == 200) {
        isLoading.value = false;

        selectedFiles.value = [];

        SuccessDialog.showCustomDialog(
            context,
            "lbl_done".tr,
            Text(
              'msg_document_sent_your'.tr,
              textAlign: TextAlign.center,
            ));

        // for(var file in selectedFiles.value){
        //   selectedFiles.value.remove(file);
        //
        // }

        pdfFile = null;

        print('File uploaded successfully');
      }
      if (response.statusCode == 403) {
        CM.showToast(map['message']);
        selectedFiles.value = [];
        isLoading.value = false;
      } else if (response.statusCode == 500) {
        CM.showToast('Try again after some time');
        isLoading.value = false;
        selectedFiles.value = [];
      } else {
        isLoading.value = false;
        print('File upload failed with status: ${response.statusCode}');
      }
    } catch (e) {
      isLoading.value = false;
      print('Error during file upload: $e');
    }
  }

  Future<void> getSettlementOfficerAPI() async {
    print("sat api");
    var url = Uri.parse(UriConstant.getSettlementOfficerURL);

    var queryParams = {
      ApiKey.apikey: ApiKey.apikeyvalue,
      'CaseID': caseId.value
    };

    print("sat api 1");
    var uri = Uri.parse(
        'https://clearstart.irslogics.com/publicapi/Appointment/GetSetOfficerEmail?apikey=f08f2b3c48ad4134b4ef62abd4aa721d&CaseID=18259');

    http.Response response = await http.get(uri);
    print("sat api 2");
    try {
      if (response.statusCode == 200) {
        getSatOfficerData.value =
            GetSattlementOfficerModal.fromJson(jsonDecode(response.body));

        String str = getSatOfficerData.value!.data!;
        List<String> strarray = str.split(": ");

        satOfficerEmail.value = strarray[1];
        print("sat api 3");
      } else {
        print('Failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
