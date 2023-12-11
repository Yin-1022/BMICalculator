import 'package:d_1122/Toolist/age_and_weight.dart';
import 'package:d_1122/Toolist/calculate_button.dart';
import 'package:d_1122/Toolist/height_slide.dart';
import 'package:flutter/material.dart';
import 'package:d_1122/Toolist/gender_select.dart';

void main()
{
  runApp(const MaterialApp(home: BMICalculator()));
}

class BMICalculator extends StatefulWidget
{
  const BMICalculator({super.key});
  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp
    (
      theme: ThemeData.dark(),
       home: Scaffold
         (
           appBar: AppBar(title: const Text('BMI Calculator', style: TextStyle(fontSize: 30),),),
           body: const Column
             (
               children:
                [
                  GenderSelect(),
                  HeightSlide(),
                  AgeAndWeight(),
                  CalculateButton(),
                ],
             )
         )
    );
  }
}




