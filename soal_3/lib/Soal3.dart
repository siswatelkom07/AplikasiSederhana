import 'package:flutter/material.dart';
import 'calculatorButton.dart';

class Soal3 extends StatefulWidget {
  const Soal3({super.key});

  @override
  State<Soal3> createState() => _Soal3State();
}

class _Soal3State extends State<Soal3> {
  List<double> grades =[];
  String input = '';
  String result = '';
  final List<String> buttons =[
     '1', '2', '3', '4',
    '5', '6', '7', '8',
    '9', '0','C','=',','
  ];
  bool DarkMode = false;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Grade calculating App",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.red,
        actions: [IconButton(onPressed: () {
         setState(() { DarkMode = true; });
        }, icon: Icon(Icons.sunny))],
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
              child: Container(
                width: double.infinity,
                height: double.infinity,
  color: DarkMode ? Colors.black : const Color.fromARGB(255, 255, 255, 255),
  child: Column(
    children: [
      Text(
        input,
        style: TextStyle(
          fontSize: 24,
          color: DarkMode ? Colors.white : Colors.grey,
        ),
      ),
      Text(
        result,
        style: TextStyle(
          fontSize: 48,
          fontWeight: FontWeight.bold,
          color: DarkMode ? Colors.white : Colors.black,
        ),
      ),
    ],
  ),
)
)
          , Expanded(
          flex: 2,
          child: GridView.builder(
            itemCount: buttons.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
            itemBuilder: (BuildContext context, int index) {
              String buttonText = buttons[index];
              return CalculatorButton(
                text: buttonText,
                callback: buttonPressed,
              );
            }
          )
          )
        ],
      ),
    );
  }
 void buttonPressed(String buttonText) {
  if (buttonText == 'C') {
    // Clear input
    setState(() {
      input = '';
      result = '';
      grades.clear(); 
    });
  } else if (buttonText == '=') {
    calculateAverage();
  } else {
    setState(() {
      input += buttonText;
    });
  }
}

void calculateAverage() {
  List<String> gradeStrings = input.split(',');
  
  grades = gradeStrings.map((grade) => double.tryParse(grade.trim()) ?? 0.0).toList();

  if (grades.isNotEmpty) {
    double average = grades.reduce((a, b) => a + b) / grades.length;
    String letterGrade;
    if (average >= 90) {
      letterGrade = 'A';
    } else if (average >= 80) {
      letterGrade = 'B';
    } else if (average >= 70) {
      letterGrade = 'C';
    } else if (average >= 60) {
      letterGrade = 'D';
    } else {
      letterGrade = 'F';
    }

    setState(() {
      result = 'Average: ${average.toStringAsFixed(2)} ($letterGrade)';
    });
  }
}

}
