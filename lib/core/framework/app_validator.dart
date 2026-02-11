import 'package:easy_localization/easy_localization.dart';

import '../../features/auth/data/models/city_model.dart';
import '../../generated/locale_keys.g.dart';

class AppValidator {
  static String? otpValidator(String? value) {
    RegExp regex = RegExp(r'^\d{4}$');
    if (value == null || value.isEmpty) {
      return LocaleKeys.pinCodeEmpty.tr();
    } else if (!regex.hasMatch(value)) {
      return LocaleKeys.pinCodeValid.tr();
    }
    return null;
  }

  static String? nameValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return LocaleKeys.emptyName.tr();
    }
    return null;
  }

  static String? addressNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.pleaseEnterAddressName.tr();
    }
    return null;
  }

  static String? fullEmailValidator(String? value) {
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    if (value == null || value.isEmpty) {
      return LocaleKeys.emptyEmail.tr();
    } else if (!emailRegex.hasMatch(value)) {
      return LocaleKeys.validEmail.tr();
    }
    return null;
  }

  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) return null;

    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    if (!emailRegex.hasMatch(value)) {
      return LocaleKeys.validEmail.tr();
    } else {
      return null;
    }
  }

  static String? phoneValidator(String? value) {
    final text = value!.trim();
    final RegExp regex = RegExp(r'^(05\d{8}|5\d{8})$');
    final bool isSaudiNumber = regex.hasMatch(text);

    if (text.isEmpty) {
      return LocaleKeys.emptyPhone.tr();
    }

    if (!isSaudiNumber) {
      return LocaleKeys.validatePhone.tr();
    }

    return null;
  }

  static String? suggestionOrComplaintValidator(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.emptySuggestionComplaintMessage.tr();
    }
    return null;
  }

  static String? addressValidator(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.emptyAddress.tr();
    }
    return null;
  }

  static String? storeArabicNameValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return LocaleKeys.typeArabicStoreName.tr();
    }

    final text = value.trim();
    final regex = RegExp(r'^[\u0600-\u06FF\s]+$');

    if (!regex.hasMatch(text)) {
      return LocaleKeys.typeArabicStoreName.tr();
    }

    return null;
  }

  static String? storeEnglishNameValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return LocaleKeys.typeEnglishStoreName.tr();
    }

    final text = value.trim();
    final regex = RegExp(r'^[A-Za-z\s]+$');

    if (!regex.hasMatch(text)) {
      return LocaleKeys.typeEnglishStoreName.tr();
    }

    return null;
  }

  static String? storeDescription(String? value) {
    if (value == null || value.trim().isEmpty) {
      return LocaleKeys.typeStoreDescription.tr();
    }
    return null;
  }

  static String? commercialLicenceNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return LocaleKeys.typeCommercialLicenceNumber.tr();
    }
    return null;
  }

  static String? commercialImageNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return LocaleKeys.typeCommercialLicenceImage.tr();
    }
    return null;
  }

  static String? storeLocation(String? value) {
    if (value == null || value.trim().isEmpty) {
      return LocaleKeys.typeStoreLocation.tr();
    }
    return null;
  }

  static String? adDays(String? value) {
    if (value == null || value.trim().isEmpty) {
      return LocaleKeys.typeAdDays.tr();
    }
    return null;
  }

  static String? adDescription(String? value) {
    if (value == null || value.trim().isEmpty) {
      return LocaleKeys.typeAdDescription.tr();
    }
    return null;
  }

  static String? reportReasonValidator(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.emptyReportReason.tr();
    }
    return null;
  }

  static String? cityValidator(CityModel? value) {
    if (value == null) {
      return LocaleKeys.pleasePickCity.tr();
    }
    return null;
  }

  static String? addBalanceValidator(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.emptyChargeAmount.tr();
    }
    return null;
  }
}
