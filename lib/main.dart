import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
  Color inactiveColor = const Color(0xFF0A0E21);
  Color activeColor = const Color(0xFF1D1E33);
  Color selectGender = Colors.white;
  String gender = '';
  double _value = 160;
  int age = 20;
  double weight = 50;
  double theBMI = 20;

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
                                child: Container
                                  (
                                    color: selectGender = gender=='male' ? inactiveColor : activeColor,
                                    child: const Column
                                      (
                                        children:
                                        [
                                          Expanded(child: Icon(FontAwesomeIcons.landmark,size: 80,),),
                                          Text("Male",style: TextStyle(fontSize: 20),),
                                          SizedBox(height: 30,)
                                        ],
                                      ),
                                  ),
                                onTap: ()
                                {
                                  setState(() {
                                    gender = 'male';
                                  });
                                },
                              ),
                            ),
                          Expanded(
                            child: GestureDetector(
                              child: Container
                                (
                                  color: selectGender = gender=='female' ? inactiveColor : activeColor,
                                  child: const Column
                                    (
                                    children:
                                    [
                                      Expanded(child: Icon(FontAwesomeIcons.book,size: 80,),),
                                      Text("Female",style: TextStyle(fontSize: 18),),
                                      SizedBox(height: 30,)
                                    ],
                                  ),
                                ),
                              onTap: ()
                              {
                                setState(() {
                                  gender = 'female';
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




