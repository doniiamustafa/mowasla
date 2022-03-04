import 'package:flutter/material.dart';

class Validator {
  String? isEmail(String? value) {
    value = value ?? "";
    if (value.length < 3) {
      return "Enter Correct Value";
    } else if (RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value)) {
      return null;
    }
    return "Enter Correct Value";
  }

  String? isPassword(String value) {
    if (value.length < 8) return "Enter correct Value";
    return null;
  }

  String? isName(String value) {
    if (value.length < 3) return "Enter a name not lessthan 3 characters";
    return null;
  }


  String? phoneNumberValidation(String? value) {
    value = value ?? "";
    // String phoneValidator = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    // RegExp regularExpression = new RegExp(phoneValidator);

    if (value.length == 0) {
      return 'Please enter mobile number';
    } else if (RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)').hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return null;
  }

  

}
