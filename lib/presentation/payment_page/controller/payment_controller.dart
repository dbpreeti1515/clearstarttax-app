import 'dart:convert';
import 'dart:ffi';

import 'package:credit_card_validator/credit_card_validator.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:intl/intl.dart';
import 'package:preeti_s_application3/core/app_export.dart';
import 'package:preeti_s_application3/presentation/payment_page/models/payment_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../data/API_Services/apiEndpoint.dart';
import '../../../data/Comman/common_method.dart';
import '../../../data/apiModal/getPaymentModal.dart';
import '../../../data/api_constant/api_constant.dart';
import '../../../data/http_methods/http_methods.dart';
import '../../../data/models/SuccessDialogBox/SuccessBox.dart';
import '../../../widgets/comman_widget.dart';
import '../../dashboard_page/controller/dashboard_controller.dart';

/// A controller class for the PaymentPage.
///
/// This class manages the state of the PaymentPage, including the

/// current paymentModelObj

class PaymentController extends GetxController
    with GetSingleTickerProviderStateMixin {
  //PaymentController(this.paymentModelObj);

  TextEditingController nameController = TextEditingController();
  TextEditingController monthController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController zipController = TextEditingController();
  TextEditingController add1Controller = TextEditingController();
  TextEditingController add2Controller = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController bankNameController = TextEditingController();
  TextEditingController bankHolderController = TextEditingController();
  TextEditingController routingController = TextEditingController();
  TextEditingController accountController = TextEditingController();
  RxString validationResult = ''.obs;

  TextEditingController cardinformationvalueController =
      TextEditingController();

  TextEditingController cvvController = TextEditingController();

  TextEditingController emailController = TextEditingController();
  Rx<TextEditingController> paymentController = TextEditingController().obs;
  CreditCardValidator ccValidator = CreditCardValidator();
  //Rx<PaymentModel> paymentModelObj;

  TextEditingController transferZipController = TextEditingController();
  TextEditingController transferAdd1Controller = TextEditingController();
  TextEditingController transferAdd2Controller = TextEditingController();
  TextEditingController transferEmailController = TextEditingController();
  TextEditingController transferCityController = TextEditingController();
  TextEditingController transferAccountController = TextEditingController();

  RxDouble postDue = 0.0.obs;
  RxDouble remaining = 0.0.obs;
  RxBool isValidCardNumber = false.obs;

  TabController? tabController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> transerFormKey = GlobalKey<FormState>();
  Map<String, dynamic> bodyParamsForCredit = {};
  Map<String, dynamic> responseMapForCard = {};
  Map<String, dynamic> bodyParamsForTransfer = {};
  Map<String, dynamic> responseMapForTransfer = {};
  RxString selectedAmount = ''.obs;
  RxString expirydateValidation = ''.obs;
  RxBool isLoading = false.obs;
  RxBool isTranserLoading = false.obs;
  RxString cardType = ''.obs;
  RxBool isMonthField = false.obs;
  RxString cardStatusMsg = ''.obs;
  RxString cardTransectionMsg = ''.obs;
  RxString bankStatusMsg = ''.obs;
  RxString selectValue = "saab".obs;
  RxString transferSelectValue = "saab".obs;
  RxString? selectedItem;
  final getPaymentData = Rxn<GetPaymentModal>();

  void setSelectedValue(String value) {
    selectedAmount.value = value;

  }
  void setSelectedState(String value,int type) {
    if(type==1){
      selectValue.value = value;
    }else{
      transferSelectValue.value = value;
    }


  }

  List<StateItem> states = [
    StateItem(name: 'Select', value: 'saab'),
    StateItem(name: 'Alabama', value: 'AL'),
    StateItem(name: 'Alaska', value: 'AK'),
    StateItem(name: 'Arizona', value: 'AZ'),
    StateItem(name: 'Arkansas', value: 'AR'),
    StateItem(name: 'California', value: 'CA'),
    StateItem(name: 'Colorado', value: 'CO'),
    StateItem(name: 'Connecticut', value: 'CT'),
    StateItem(name: 'Delaware', value: 'DE'),
    StateItem(name: 'District Of Columbia', value: 'DC'),
    StateItem(name: 'Florida', value: 'FL'),
    StateItem(name: 'Georgia', value: 'GA'),
    StateItem(name: 'Hawaii', value: 'HI'),
    StateItem(name: 'Idaho', value: 'ID'),
    StateItem(name: 'Illinois', value: 'IL'),
    StateItem(name: 'Indiana', value: 'IN'),
    StateItem(name: 'Iowa', value: 'IA'),
    StateItem(name: 'Kansas', value: 'KS'),
    StateItem(name: 'Kentucky', value: 'KY'),
    StateItem(name: 'Louisiana', value: 'LA'),
    StateItem(name: 'Maine', value: 'ME'),
    StateItem(name: 'Maryland', value: 'MD'),
    StateItem(name: 'Massachusetts', value: 'MA'),
    StateItem(name: 'Michigan', value: 'MI'),
    StateItem(name: 'Minnesota', value: 'MN'),
    StateItem(name: 'Mississippi', value: 'MS'),
    StateItem(name: 'Missouri', value: 'MO'),
    StateItem(name: 'Montana', value: 'MT'),
    StateItem(name: 'Nebraska', value: 'NE'),
    StateItem(name: 'Nevada', value: 'NV'),
    StateItem(name: 'New Hampshire', value: 'NH'),
    StateItem(name: 'New Jersey', value: 'NJ'),
    StateItem(name: 'New Mexico', value: 'NM'),
    StateItem(name: 'New York', value: 'NY'),
    StateItem(name: 'North Carolina', value: 'NC'),
    StateItem(name: 'North Dakota', value: 'ND'),
    StateItem(name: 'Ohio', value: 'OH'),
    StateItem(name: 'Oklahoma', value: 'OK'),
    StateItem(name: 'Oregon', value: 'OR'),
    StateItem(name: 'Pennsylvania', value: 'PA'),
    StateItem(name: 'Rhode Island', value: 'RI'),
    StateItem(name: 'South Carolina', value: 'SC'),
    StateItem(name: 'South Dakota', value: 'SD'),
    StateItem(name: 'Tennessee', value: 'TN'),
    StateItem(name: 'Texas', value: 'TX'),
    StateItem(name: 'Utah', value: 'UT'),
    StateItem(name: 'Vermont', value: 'VT'),
    StateItem(name: 'Virginia', value: 'VA'),
    StateItem(name: 'Washington', value: 'WA'),
    StateItem(name: 'West Virginia', value: 'WV'),
    StateItem(name: 'Wisconsin', value: 'WI'),
    StateItem(name: 'Wyoming', value: 'WY'),
    StateItem(name: 'Puerto Rico', value: 'PR'),
    StateItem(name: 'Virgin Islands', value: 'VI'),
    StateItem(name: 'Northern Mariana Islands', value: 'MP'),
    StateItem(name: 'Guam', value: 'GU'),
    StateItem(name: 'American Samoa', value: 'AS'),
    StateItem(name: 'Palau', value: 'PW'),
  ];

  onChnageDropdown(value) {
    selectedItem!.value = value;
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await getPaymentAPI();
    emailController.text = email.value;
    transferEmailController.text = email.value;

    tabController = TabController(length: 2, vsync: this);
    //  await creditCardAPI();
  }
void cardClear(){
  nameController.clear();
  cardinformationvalueController.clear();
  cvvController..clear();
  emailController..clear();
  nameController..clear();
  monthController..clear();
  yearController..clear();
  zipController..clear();
  add1Controller..clear();
  add2Controller..clear();
  cityController..clear();

  cardinformationvalueController.clear();
  cvvController.clear();
  emailController.clear();

}
void bankClear(){
  bankNameController.clear();
  bankHolderController.clear();
  routingController.clear();
  accountController.clear();




  transferZipController.clear();
  transferAdd1Controller.clear();
  transferAdd2Controller.clear();
  transferEmailController.clear();
  transferCityController.clear();
}
  @override
  void dispose() {
    super.dispose();
    // Dispose of the TabController when the widget is disposed.
    tabController!.dispose();
    nameController.dispose();
    cardinformationvalueController.dispose();
    cvvController.dispose();
    emailController.dispose();
    nameController.dispose();
    monthController.dispose();
    yearController.dispose();
    zipController.dispose();
    add1Controller.dispose();
    add2Controller.dispose();
    cityController.dispose();
    bankNameController.dispose();
    bankHolderController.dispose();
    routingController.dispose();
    accountController.dispose();
    cardinformationvalueController.dispose();
    cvvController.dispose();
    emailController.dispose();
    paymentController.value.dispose();
    transferZipController.dispose();
    transferAdd1Controller.dispose();
    transferAdd2Controller.dispose();
    transferEmailController.dispose();
    transferCityController.dispose();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> clickOnPayButton(BuildContext context) async {
    //validateCreditCardInfo(cardinformationvalueController.text,monthController.text+yearController.text, cvvController.text);
    if (formKey.currentState!.validate()) {
      if (selectedAmount.value.isEmpty || selectedAmount.value == null) {
        CM.showToast("Please select amount");
      } else {
        creditCardAPI(context);
      }
    }
  }

  Future<void> clickOnTransferPayButton(BuildContext context) async {
    if (transerFormKey.currentState!.validate()) {
      BankTransfer(context);
      // SuccessDialog.showCustomDialog(
      //     context, "msg_congratulations".tr, 'msg_well_done_thank'.tr, true);
    }
  }

  Future<void> getPaymentAPI() async {
    try {
      http.Response? response = await HttpMethod.instance.getRequest(
        url: UriConstant.getPaymentURL,
      );

      getPaymentData.value =
          GetPaymentModal.fromJson(jsonDecode(response!.body));
      selectedAmount.value =
          getPaymentData.value!.data!.data!.pastDue.toString();
      print(getPaymentData.value!.data!.paymentSchedular![0].scheduledDate);
      print(getPaymentData.value!.data!.paymentSchedular![0].amount);
      var dateString =
          getPaymentData.value!.data!.paymentSchedular![0].scheduledDate;
      DateTime dateTime = DateTime.parse(dateString!);
      String formattedDate = DateFormat('dd/MM/yyyy').format(dateTime);
      print(formattedDate);
      // if (getPaymentData.value != null &&
      //     getPaymentData.value?.data != null) {
      //
      //
      //
      // }
    } catch (error) {
      isLoading.value = false;
      // Handle errors
      print('Error fetching data: $error');
    }
  }

  bool validateCreditCard() {
    var creditCardNumber = cardinformationvalueController.text.trim();
    print(creditCardNumber);

    if (ccValidator.validateCCNum(creditCardNumber) == true) {
      validationResult.value = 'Valid Credit Card Number';
      print(validationResult.value);
      isValidCardNumber.value = true;
    } else {
      validationResult.value = 'Invalid Credit Card Number';
      print(validationResult.value);
      isValidCardNumber.value = false;
    }

    return isValidCardNumber.value;
  }

  Future<bool> creditCardAPI(BuildContext context) async {
    isLoading.value = true;
    bodyParamsForCredit = {
      ApiKey.card_type: cardType.value,
      ApiKey.client_email: emailController.text,
      ApiKey.expiry_month: monthController.text,
      ApiKey.expiry_year: yearController.text,
      ApiKey.card_number: cardinformationvalueController.text,
      ApiKey.cvv: cvvController.text,
      ApiKey.case_id: caseId.value,
      ApiKey.amount: selectedAmount.value,
      ApiKey.State: selectValue.value,
      ApiKey.City: cityController.text,
      ApiKey.Zip: zipController.text,
      ApiKey.Address: add1Controller.text,
      ApiKey.AptNo: add2Controller.text ?? '',
      ApiKey.nameOnAccount: nameController.text
    };

    http.Response? response = await HttpMethod.instance.postRequest(
      url: UriConstant.creditCardURL,
      bodyParams: bodyParamsForCredit,
    );

    isLoading.value = true;
    if (CM.responseCheckForPostMethod(response: response)) {
      responseMapForCard = jsonDecode(response!.body);

      isLoading.value = true;

      if (responseMapForCard[ApiKey.status]) {
        cardStatusMsg.value = responseMapForCard['data']['status'];
        cardTransectionMsg.value = responseMapForCard['data']['status'];
        if (cardStatusMsg.value == 'success') {
          PaymentModel.showCardPaymentDialog(
              context, emailController.text, selectedAmount.value,responseMapForCard['data'][ApiKey.tran_id]);
        } else {
          PaymentModel.showTransactionFailedDialog(
              context, cardStatusMsg.value);
        }
        cardClear();
        //CM.showToast(responseMapForCard['data']['status']);
      } else {
        isLoading.value = false;
        cardClear();
        // CM.showToast(responseMapForCard[ApiKey.message]);
      }

      bodyParamsForCredit.clear();
      isLoading.value = false;
      return true;
    } else {
      cardClear();
      bodyParamsForCredit.clear();
      isLoading.value = false;
      return false;
    }
  }

  Future<bool> BankTransfer(BuildContext context) async {
    isTranserLoading.value = true;
    bodyParamsForTransfer = {
      ApiKey.client_email: transferEmailController.text,
      ApiKey.account_holder_name: bankHolderController.text,
      ApiKey.bank_name: bankNameController.text,
      ApiKey.bankrouteingno: routingController.text,
      ApiKey.case_id: caseId.value,

      ApiKey.accountno:transferAccountController.text,
      ApiKey.amount: transferAccountController.text,
      ApiKey.State: transferSelectValue.value,
      ApiKey.City: transferCityController.text,
      ApiKey.Zip: transferZipController.text,
      ApiKey.Address: transferAdd1Controller.text,
      ApiKey.AptNo: transferAdd2Controller.text ?? '',
    };

    http.Response? response = await HttpMethod.instance.postRequest(
      url: UriConstant.bankTransferURL,
      bodyParams: bodyParamsForTransfer,
    );

    isTranserLoading.value = true;
    if (CM.responseCheckForPostMethod(response: response)) {
      responseMapForTransfer = jsonDecode(response!.body);

      isTranserLoading.value = false;
      print(responseMapForTransfer);

      if (responseMapForTransfer[ApiKey.status]) {
        bankStatusMsg.value = responseMapForTransfer['data']['status'];
        bankStatusMsg.value = responseMapForTransfer['data']['status'];
        if (bankStatusMsg.value == 'success') {
          PaymentModel.showBankTransferDialog(
              context, transferEmailController.text,selectedAmount.value,);
        } else {
          PaymentModel.showTransactionFailedDialog(
              context, bankStatusMsg.value);
        }
        bankClear();

        //  CM.showToast(responseMapForTransfer['data']['status']);
      } else {
        bankClear();
        isTranserLoading.value = false;
        // CM.showToast(responseMapForCard[ApiKey.message]);
      }

      bodyParamsForTransfer.clear();
      isTranserLoading.value = false;
      return true;
    }
    else {
      bankClear();
      bodyParamsForTransfer.clear();
      isTranserLoading.value = false;
      return false;
    }
  }
}

class StateItem {
  String name;
  String value;

  StateItem({required this.name, required this.value});
}
