import 'package:flutter/material.dart';
import 'package:number_converter/models/number_system.dart';
import 'package:number_converter/viewmodels/converter_viewmodel.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});


  static const Color primary = Color(0xFF204B57);
  static const Color secondary = Color(0xFF3BC9BB);


  @override
  Widget build(BuildContext context) {
    final vm = context.watch<ConverterViewModel>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 18,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
//title
              const Text(
                "Base Converter",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: primary,
                ),
              ),

//sub title
              const Text(
                "Convert between Binary, Decimal,\nOctal and Hexadecimal",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 16),

              /// INPUT CARD

              Card(
                elevation: 2,
                shadowColor: primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    children: [
                      Text(
                          vm.selectedSystem == null
                              ? "Select a number system first."
                              : vm.selectedSystem!.instruction,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: primary,
                          )
                      ),

                      const SizedBox(height: 8),

//dropdown
                      DropdownButtonFormField<NumberSystem>(
                        value: vm.selectedSystem,
                        hint: Text("Select Base"),

                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),

                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: secondary,
                              width: 0.5,
                            ),
                          ),

                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                                color: primary,
                                width: 0.5
                            ),
                          ),
                        ),

                        items: NumberSystem.values.map((system) {
                          return DropdownMenuItem(
                            value: system,
                            child: Text(system.title),
                          );
                        }).toList(),

                        onChanged: (value) {
                          if (value != null) {
                            context
                                .read<ConverterViewModel>()
                                .changeSystem(value);
                          }
                        },
                      ),
                      const SizedBox(height: 18),
//Textfield
                      TextField(
                        controller: vm.controller,
                        enabled: vm.selectedSystem != null,
                        cursorColor: primary,

                        decoration: InputDecoration(
                          hintText: vm.selectedSystem == null
                              ? "Select a base first"
                              : "Enter Number",

                          hintStyle: TextStyle(
                            color: Colors.grey.shade400,
                          ),

                          filled: true,
                          fillColor: vm.selectedSystem == null
                              ? Colors.grey.shade100
                              : Colors.white,

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color: secondary,
                              width: 0.5,
                            ),
                          ),

                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color: secondary,
                              width: 0.5,
                            ),
                          ),

                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color: primary,
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 25),
//button
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: SizedBox(
                      height: 55,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primary,
                          foregroundColor: Colors.white,
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        onPressed: () {
                          context.read<ConverterViewModel>().convert();
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Text(
                              "Convert",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 8),

                            Icon(Icons.compare_arrows,size: 20,color: Colors.white,),

                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      height: 55,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: secondary,
                          foregroundColor: Colors.white,
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        onPressed: () {
                          context.read<ConverterViewModel>().clear();
                        },
                        child: Text(
                          "Clear",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              Divider(
                color: primary,
                thickness: 1.5,
              ),
//error message
              const SizedBox(height: 12),
              if (vm.errorMessage != null)
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.red.shade50,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.red.shade300),
                  ),
                  child: Text(
                    vm.errorMessage!,
                    style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

//result card
              Card(
                elevation: 2,
                shadowColor: primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      const Text(
                        "Results",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: primary,
                        ),
                      ),

                      const SizedBox(height: 20),

                      if (vm.results.isEmpty)
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            vertical: 40,
                          ),
                          child: const Center(
                            child: Text(
                              "No conversion yet",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),

                      if (vm.results.isNotEmpty)
                        ...vm.results.entries.map(
                              (entry) => Container(
                            width: double.infinity,
                            margin: const EdgeInsets.only(bottom: 15),
                            padding: const EdgeInsets.all(16),

                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                            ),

                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [

                                Text(
                                  entry.key.title,
                                  style: const TextStyle(
                                    color: primary,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                const SizedBox(height: 8),

                                SelectableText(
                                  entry.value,
                                  style: const TextStyle(
                                    fontSize: 17,
                                    color: secondary,
                                    height: 1.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

