import 'package:flutter/cupertino.dart';

class ValidationUtils {
  static const String _mobileValidationPattern =
      r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$';
  static const String _emailValidationPattern =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

  static String? requiredValidator(
    final String? value,
    final String fieldName,
  ) =>
      value == null || value.isEmpty
          ? 'please Enter ${fieldName.toLowerCase()}'
          : null;


  static String? validateEmail(
    final String? value,
  ) {
    final String? requiredValidationResult = requiredValidator(
      value,
      'Email',
    );
    if (requiredValidationResult != null) {
      return requiredValidationResult;
    } else {
      final RegExp regExp = RegExp(_emailValidationPattern);
      if (!regExp.hasMatch(value!)) {
        return 'please Enter a Valid Email Address';
      }
    }

    return null;
  }

  static String? isValidIBAN(String iban) {

    iban = iban.replaceAll(' ', '').toUpperCase();

    // Check length
    if (iban.length < 2) {
      return 'InValid';
    }

    // Check country code and length
    final String countryCode = iban.substring(0, 2);
    if (!RegExp(r'^[A-Z]{2}$').hasMatch(countryCode)) {
      return 'InValid';
    }

    final Map<String, int> countryLengths = {
      'AL': 28,
      'AD': 24,
      'AT': 20,
      'AZ': 28,
      'BH': 22,
      'BY': 28,
      'BE': 16,
      'BA': 20,
      'BR': 29,
      'BG': 22,
      'CR': 22,
      'HR': 21,
      'CY': 28,
      'CZ': 24,
      'DK': 18,
      'DO': 28,
      'TL': 23,
      'EE': 20,
      'FO': 18,
      'FI': 18,
      'FR': 27,
      'GE': 22,
      'DE': 22,
      'GI': 23,
      'GR': 27,
      'GL': 18,
      'GT': 28,
      'HU': 28,
      'IS': 26,
      'IE': 22,
      'IL': 23,
      'IT': 27,
      'JO': 30,
      'KZ': 20,
      'XK': 20,
      'KW': 30,
      'LV': 21,
      'LB': 28,
      'LI': 21,
      'LT': 20,
      'LU': 20,
      'MK': 19,
      'MT': 31,
      'MR': 27,
      'MU': 30,
      'MC': 27,
      'MD': 24,
      'ME': 22,
      'NL': 18,
      'NO': 15,
      'PK': 24,
      'PS': 29,
      'PL': 28,
      'PT': 25,
      'QA': 29,
      'RO': 24,
      'SM': 27,
      'SA': 24,
      'RS': 22,
      'SK': 24,
      'SI': 19,
      'ES': 24,
      'SE': 24,
      'CH': 21,
      'TN': 24,
      'TR': 26,
      'UA': 29,
      'AE': 23,
      'GB': 22,
      'VG': 24
    };

    if (countryLengths[countryCode] == null ||
        iban.length != countryLengths[countryCode]) {
      return null;
    }

    String rearrangedIBAN = iban.substring(4) + iban.substring(0, 4);
    rearrangedIBAN = rearrangedIBAN.replaceAllMapped(
        RegExp(r'[A-Z]'),
        (match) => ((match.group(0)!.codeUnitAt(0) - 'A'.codeUnitAt(0)) + 10)
            .toString());

    int checksum = int.parse(rearrangedIBAN.substring(0, 1));
    for (int i = 1; i < rearrangedIBAN.length; i++) {
      final int digit = int.parse(rearrangedIBAN.substring(i, i + 1));
      checksum *= 10;
      checksum += digit;
      checksum %= 97;
    }

    return checksum == 1 ? null : "Invalid";
  }
}
