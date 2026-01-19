import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../generated/locale_keys.g.dart';

class PhoneFieldController extends ChangeNotifier {
  final controller = TextEditingController();
  String errorMessage = "";
  PhoneFieldBorder phoneFieldBorder = PhoneFieldBorder.initial;

  /// Whether the field is required or optional
  final bool isRequired;

  PhoneFieldController({this.isRequired = true});

  bool validatePhoneField() {
    final text = controller.text.trim();
    final RegExp regex = RegExp(r'^(05\d{8}|5\d{8})$');
    final bool isSaudiNumber = regex.hasMatch(text);

    // ✅ If field is empty
    if (text.isEmpty) {
      if (isRequired) {
        // Required → must not be empty
        errorMessage = LocaleKeys.emptyPhone.tr();
        phoneFieldBorder = PhoneFieldBorder.error;
        notifyListeners();
        return false;
      } else {
        // Not required → skip validation
        disableError();
        return true;
      }
    }

    // ✅ If not empty, must be a valid Saudi number
    if (!isSaudiNumber) {
      errorMessage = LocaleKeys.validatePhone.tr();
      phoneFieldBorder = PhoneFieldBorder.error;
      notifyListeners();
      return false;
    }

    // ✅ Valid number
    disableError();
    return true;
  }

  void disableError() {
    phoneFieldBorder = PhoneFieldBorder.validated;
    errorMessage = "";
    notifyListeners();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

enum PhoneFieldBorder { initial, error, validated }
