import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:d_1122/component/constant.dart';

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
  double _value = 160;
  int age = 20;
  double weight = 50;
  double theBMI = 20;
  String selectedGender = '';


  @override
  Widget build(BuildContext context)
  {
    return MaterialApp
    (
      theme: ThemeData.dark(),
       home: Scaffold
         (
           appBar: AppBar
             (
             title: const Text('BMI Calculator', style: TextStyle(fontSize: 30),),
             ),
           body: Column
             (
               children:
                [
                  Expanded(
                    child: Row
                      (
                        children:
                         [
                          Expanded
                            (
                              child: GestureDetector(
                                child: GenderBox(gender: 'Male',selectGender: selectedGender,icon: FontAwesomeIcons.landmark),
                                onTap: ()
                                {
                                  setState(()
                                  {
                                    selectedGender = 'Male';
                                  });
                                },
                              ),
                            ),
                          Expanded(
                            child: GestureDetector(
                                  child: GenderBox(gender: 'Female',selectGender: selectedGender,icon: FontAwesomeIcons.book),
                                  onTap: ()
                                  {
                                    setState(()
                                    {
                                      selectedGender = 'Female';
                                    });
                                  },
                            ),
                          ),
                         ],
                      ),
                  ),
                  Expanded(
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
                              Center(
                                      child: Slider
                                            (
                                              min: 100.0,
                                              max: 200.0,
                                              value: _value,
                                              onChanged: (value){setState(() {
                                                _value=value;
                                              });}
                                            ),
                                    ),
                            ],
                          )
                      ),
                  ),
                  Expanded(
                    child: Row
                      (
                        children:
                        [
                          Expanded(
                            child: Container
                              (
                                color: Colors.black12,
                                child: Column
                                (
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children:
                                    [
                                      const Text("Age",style: TextStyle(fontSize: 30),),
                                      const SizedBox(height: 20,),
                                      Text("$age", style: const TextStyle(fontSize: 30),),
                                      const SizedBox(height: 20,),
                                      Row
                                        (
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children:
                                          [
                                            OutlinedButton(onPressed: (){setState(() {age=age+1;});}, child: const Text("+1",style: TextStyle(fontSize: 40),)),
                                            const SizedBox(width: 20,),
                                            OutlinedButton(onPressed: (){setState(() {age=age-1;});}, child: const Text("-1",style: TextStyle(fontSize: 40),)),
                                          ],
                                        )
                                    ],
                                ),
                              ),
                          ),
                          Expanded(
                            child: Container
                              (
                              color: Colors.black12,
                              child: Column
                              (
                                mainAxisAlignment: MainAxisAlignment.center,
                                children:
                                [
                                  const Text("Weight",style: TextStyle(fontSize: 30),),
                                  const SizedBox(height: 20,),
                                  Text("${weight.round()} kg", style: const TextStyle(fontSize: 30),),
                                  const SizedBox(height: 20,),
                                  Row
                                  (
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children:
                                    [
                                      OutlinedButton(onPressed: (){setState(() {weight=weight+1;});}, child: const Text("+1",style: TextStyle(fontSize: 40),)),
                                      const SizedBox(width: 20,),
                                      OutlinedButton(onPressed: (){setState(() {weight=weight-1;});}, child: const Text("-1",style: TextStyle(fontSize: 40),)),
                                    ],
                                  )
                                ]
                              ),
                            ),
                          ),
                        ],
                      ),
                  ),
                  Expanded(
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
                                    onPressed:()
                                    {
                                      showDialog
                                        (
                                          context: context,
                                          builder: (BuildContext context)
                                            {
                                              return AlertDialog
                                              (
                                                content: Text("Height=${(_value.round())}cm   Weight=${weight.round()}kg \n\n BMI=${(theBMI=weight/(((_value).round()/100)*((_value).round()/100))).toStringAsFixed(1)}",style: const TextStyle(fontSize: 25),textAlign:TextAlign.center,),
                                                actions: [Center(child: TextButton(onPressed: (){Navigator.of(context).pop();}, child: const Text("OK",style: TextStyle(fontSize: 20),)))]
                                              );
                                            }
                                        );
                                    },
                                    child: const Text("Calculate",style: TextStyle(fontSize: 40),)
                                )
                              ],
                          )
                      ),
                  ),
                ],
           )
       )
    );
  }
}

class GenderBox extends StatelessWidget {
  const GenderBox({
    super.key,
    required this.selectGender,
    required this.icon,
    required this.gender
  });

  final String selectGender;
  final IconData icon;
  final String gender;

  @override
  Widget build(BuildContext context) {
    return Container
      (
        color: gender ==selectGender ? activeColor : inactiveColor,
        child: Column
          (
            children:
            [
              Expanded(child: Icon(icon,size: 80,),),
              Text("$gender",style: const TextStyle(fontSize: 20),),
              const SizedBox(height: 30,)
            ],
          ),
      );
  }
}




