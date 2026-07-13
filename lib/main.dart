import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:number_converter/view/screens/home_screen.dart';
import 'package:number_converter/viewmodels/converter_viewmodel.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(const NumberConverterApp());

}
class NumberConverterApp extends StatelessWidget {
  const NumberConverterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create:(_) => ConverterViewModel(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Base Converter',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white
      ),
      home: const HomeScreen(),

    ),
    );
  }
}
