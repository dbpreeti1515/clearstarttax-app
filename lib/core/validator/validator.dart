import 'package:credit_card_validator/credit_card_validator.dart';
import 'package:get/get.dart';

class Validator{
  CreditCardValidator _ccValidator = CreditCardValidator();
  static String? isPasswordValid ({required String? value}) {
    if (value == null ||value.trim().isEmpty){
      return "Please enter password";
    }else if(value.length<6){
      return "err_msg_please_enter_valid_password".tr;
    }

    return null;
  }

 static String? isConfirmPasswordValid ({required String? value,required String? passwordValue,}) {
   if (value == null || value.isEmpty) {
     return 'Please enter confirm password';
   } else if (value != passwordValue) {
     return 'Passwords do not match';
   }

    return null;
  }


   static String? isEmailValid({required String? value}) {
    if (value == null || value.trim().isEmpty) {
      return "Please enter email";
    } else if (!RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value)) {
      return "Please enter valid email";
    } else {
      return null;
    }
  }

   static String? isCaseIDValid({required String? value}) {
    if (value == null || value.trim().toString().isEmpty) {
      return "Please enter ID";
    } else if (!RegExp(r'^[0-9,.\-]+$').hasMatch(value)) {
      return "Please enter valid ID";
    }  else {
      return null;
    }
  }

   static String? isNumberValid({required String? value}) {
    if (value == null || value.trim().toString().isEmpty) {
      return "Please enter number";
    } else if (value.trim().length < 10 || value.trim().length > 12) {
      return "Please enter valid number";
    } else {
      return null;
    }
  }

   static String? isValid({required String? value,required String title})
  {
    if (value == null || value.trim().toString().isEmpty)
    {
      return "Please enter $title";
    } else {
        return null;
      }
    }


}