enum NumberSystem {
  binary,
  decimal,
  octal,
  hexadecimal,
}

extension NumberSystemExtension on NumberSystem{
  String get title{
    switch(this){
      case NumberSystem.binary:
        return "Binary";
      case NumberSystem.decimal:
        return "Decimal";
        case NumberSystem.octal:
        return "Octal";
      case NumberSystem.hexadecimal:
        return "Hexadecimal";
    }
  }


  String get instruction {
    switch (this) {
      case NumberSystem.binary:
        return "Enter only 0 and 1";

      case NumberSystem.decimal:
        return "Enter digits from 0 to 9";

      case NumberSystem.octal:
        return "Enter digits from 0 to 7";

      case NumberSystem.hexadecimal:
        return "Enter digits (0-9) and letters (A-F)";
    }
  }
}