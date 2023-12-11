import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GenderSelect extends StatefulWidget
{
  const GenderSelect({super.key});

  @override
  State<GenderSelect> createState() => _GenderState();
}

class _GenderState extends State<GenderSelect>
{
  Color inactiveColor = const Color(0xFF0A0E21);
  Color activeColor = const Color(0xFF1D1E33);
  Color selectGender = Colors.white;
  String gender = '';

  @override
  Widget build(BuildContext context)
  {
      return Expanded
        (
        child: Row
          (
          children:
          [
            Expanded
              (
              child: GestureDetector
                (
                child: Container
                  (
                  color:
                  selectGender = gender == 'male' ? inactiveColor : activeColor,
                  child: const Column
                    (
                    children:
                    [
                      Expanded(
                        child: Icon(FontAwesomeIcons.landmark, size: 80,),),
                      Text("Male", style: TextStyle(fontSize: 20),),
                      SizedBox(height: 30,)
                    ],
                  ),
                ),
                onTap: () {
                  setState(() {
                    gender = 'male';
                  });
                },
              ),
            ),
            Expanded
              (
              child: GestureDetector
                (
                child: Container
                  (
                  color:
                  selectGender =
                  gender == 'female' ? inactiveColor : activeColor,
                  child: const Column
                    (
                    children:
                    [
                      Expanded(child: Icon(FontAwesomeIcons.book, size: 80,),),
                      Text("Female", style: TextStyle(fontSize: 18),),
                      SizedBox(height: 30,)
                    ],
                  ),
                ),
                onTap: () {
                  setState(() {
                    gender = 'female';
                  });
                },
              ),
            ),
          ],
        ),
      );
    }
}
