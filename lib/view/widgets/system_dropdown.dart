
import 'package:flutter/material.dart';

import '../../models/number_system.dart';

class SystemDropdown extends StatelessWidget {
  final NumberSystem? value;
  final ValueChanged<NumberSystem?> onChanged;

  const SystemDropdown({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<NumberSystem>(
      value: value,
      hint: const Text("Select Base"),
      decoration: InputDecoration(
        labelText: "Input Type",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      items: NumberSystem.values.map((system) {
        return DropdownMenuItem(
          value: system,
          child: Text(system.title),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}