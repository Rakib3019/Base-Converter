import 'package:flutter/material.dart';
import 'package:number_converter/models/number_system.dart';

class Validators {
  static bool isValid(String value, NumberSystem system,){
    if(value.trim().isEmpty){
      return false;
    }

    switch(system){
      case NumberSystem.binary:
        return RegExp(r'^[01]+$').hasMatch(value);

       case NumberSystem.decimal:
         return RegExp(r'^[0-9]+$').hasMatch(value);

       case NumberSystem.octal:
         return RegExp(r'^[0-7]+$').hasMatch(value);

       case NumberSystem.hexadecimal:
         return RegExp(r'^[0-9a-fA-F]+$').hasMatch(value);
    }
  }
}