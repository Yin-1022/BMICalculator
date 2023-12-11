import 'package:flutter/material.dart';

class HeightSlide extends StatefulWidget
{
  const HeightSlide({super.key});

  @override
  State<HeightSlide> createState() => HeightSlider();
}

class HeightSlider extends State<HeightSlide>
{

  double _value = 160;
  double height = 160;

  @override
  Widget build(BuildContext context)
  {
    return Expanded
      (
      child: Container
        (
          color: Colors.black12,
          height: 200,
          child: Column
            (
            mainAxisAlignment: MainAxisAlignment.center,
            children:
            [
              Center(child: Text("Height: ${_value.round()} cm", style: const TextStyle(fontSize: 30),)),
              Center
                (
                child: Slider
                  (
                    min: 100.0,
                    max: 200.0,
                    value: _value,
                    onChanged: (value){setState(() {_value=value;height=_value;print(height.round());});}
                  ),
                ),
            ],
          )
      ),
    );
  }
}
