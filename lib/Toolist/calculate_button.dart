import 'package:flutter/material.dart';
import 'package:d_1122/Toolist/age_and_weight.dart';
import 'package:d_1122/Toolist/height_slide.dart';

class CalculateButton extends StatefulWidget
{
  const CalculateButton ({super.key});

  @override
  State<CalculateButton> createState() => Calculation();
}

class Calculation extends State<CalculateButton>
{
  HeightSlider heightSlider = HeightSlider();
  NAgeAndWeight nAgeAndWeight = NAgeAndWeight();

  double theBMI = 20;

  @override
  Widget build (BuildContext context)
  {
      return Expanded
        (
        child: Container
          (
            color: Colors.black12,
            child: Row
              (
              mainAxisAlignment: MainAxisAlignment.center,
              children:
              [
                ElevatedButton
                  (
                    onPressed: ()
                    {
                      showDialog
                        (
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog
                              (
                                content: Text("Height=${(heightSlider.height.round())}cm   Weight=${nAgeAndWeight.weight.round()}kg \n\n BMI=${(theBMI = nAgeAndWeight.weight / (((heightSlider.height.round()).round() / 100) * ((heightSlider.height.round()).round() / 100))).toStringAsFixed(1)}",
                                  style: const TextStyle(fontSize: 25),
                                  textAlign: TextAlign.center,),
                                actions: [Center(
                                    child: TextButton(onPressed: () {Navigator.of(context).pop();},
                                    child: const Text("OK", style: TextStyle(fontSize: 20),)))
                                ]
                            );
                          }
                      );
                    },
                    child: const Text("Calculate", style: TextStyle(fontSize: 40),)
                  )
              ],
            )
        ),
      );
  }
}