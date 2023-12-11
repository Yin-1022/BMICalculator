import 'package:flutter/material.dart';

class AgeAndWeight extends StatefulWidget
{
  const AgeAndWeight({super.key});

  @override
  State<AgeAndWeight> createState() => NAgeAndWeight();
}

class NAgeAndWeight extends State<AgeAndWeight>
{
  int age = 20;
  double weight = 50;

  @override
  Widget build (BuildContext context){
    return Expanded
      (
      child: Row
        (
        children:
        [
          Expanded
            (
            child: Container
              (
              color: Colors.black12,
              child: Column
                (
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                [
                  const Text("Age", style: TextStyle(fontSize: 30),),
                  const SizedBox(height: 20,),
                  Text("$age", style: const TextStyle(fontSize: 30),),
                  const SizedBox(height: 20,),
                  Row
                    (
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                    [
                      OutlinedButton(onPressed: () {
                        setState(() {
                          age = age + 1;
                        });
                      },
                          child: const Text(
                            "+1", style: TextStyle(fontSize: 40),)),
                      const SizedBox(width: 20,),
                      OutlinedButton(onPressed: () {
                        setState(() {
                          age = age - 1;
                        });
                      },
                          child: const Text(
                            "-1", style: TextStyle(fontSize: 40),)),
                    ],
                  )
                ],
              ),
            ),
          ),
          Expanded
            (
            child: Container
              (
              color: Colors.black12,
              child: Column
                (
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                  [
                    const Text("Weight", style: TextStyle(fontSize: 30),),
                    const SizedBox(height: 20,),
                    Text("${weight.round()} kg",
                      style: const TextStyle(fontSize: 30),),
                    const SizedBox(height: 20,),
                    Row
                      (
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:
                      [
                        OutlinedButton(onPressed: () {
                          setState(() {
                            weight = weight + 1;
                          });
                        },
                            child: const Text(
                              "+1", style: TextStyle(fontSize: 40),)),
                        const SizedBox(width: 20,),
                        OutlinedButton(onPressed: () {
                          setState(() {
                            weight = weight - 1;
                          });
                        },
                            child: const Text(
                              "-1", style: TextStyle(fontSize: 40),)),
                      ],
                    )
                  ]
              ),
            ),
          ),
        ],
      ),
    );
  }
}