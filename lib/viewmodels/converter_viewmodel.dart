import 'package:flutter/cupertino.dart';
import 'package:number_converter/models/number_system.dart';
import 'package:number_converter/services/converter_service.dart';
import 'package:number_converter/utils/validators.dart';

class ConverterViewModel extends ChangeNotifier {
  final ConverterService _converter =ConverterService();

  final TextEditingController controller= TextEditingController();

  NumberSystem? selectedSystem;

  Map<NumberSystem, String> results={};

  String? errorMessage;

  void convert() {
    final input = controller.text.trim();

    // Check if a base is selected
    if (selectedSystem == null) {
      errorMessage = "Please select a number system";
      results.clear();
      notifyListeners();
      return;
    }

    // Validate input
    if (!Validators.isValid(input, selectedSystem!)) {
      errorMessage = "Invalid ${selectedSystem!.title} number";
      results.clear();
      notifyListeners();
      return;
    }

    errorMessage = null;
    results.clear();

    // Convert to all other number systems
    for (NumberSystem system in NumberSystem.values) {
      if (system == selectedSystem) continue;

      results[system] = _converter.convert(
        value: input,
        from: selectedSystem!,
        to: system,
      );
    }

    notifyListeners();
  }
  void changeSystem(NumberSystem system){
    selectedSystem =system;
    notifyListeners();
  }
  void clear(){
    controller.clear();
    results.clear();
    errorMessage =null;
    notifyListeners();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

}