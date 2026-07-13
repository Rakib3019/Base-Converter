import 'package:number_converter/models/number_system.dart';

class ConverterService {
  String convert({
    required String value,
    required NumberSystem from,
    required NumberSystem to,
  }) {
    if (value.trim().isEmpty) {
      return "";
    }

    try {
      int decimalValue;

      /// Convert input to decimal first
      switch (from) {
        case NumberSystem.binary:
          decimalValue = int.parse(value, radix: 2);
          break;

        case NumberSystem.decimal:
          decimalValue = int.parse(value);
          break;

        case NumberSystem.octal:
          decimalValue = int.parse(value, radix: 8);
          break;

        case NumberSystem.hexadecimal:
          decimalValue = int.parse(value, radix: 16);
          break;
      }

      /// Convert decimal to target system
      switch (to) {
        case NumberSystem.binary:
          return decimalValue.toRadixString(2).toUpperCase();

        case NumberSystem.decimal:
          return decimalValue.toString();

        case NumberSystem.octal:
          return decimalValue.toRadixString(8).toUpperCase();

        case NumberSystem.hexadecimal:
          return decimalValue.toRadixString(16).toUpperCase();
      }
    }
    catch (e) {
      return "Invalid input";
    }
  }
}