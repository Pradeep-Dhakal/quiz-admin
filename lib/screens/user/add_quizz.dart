import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AddQuizz extends StatefulWidget {
  AddQuizz({Key? key}) : super(key: key);

  @override
  AddQuizzState createState() => AddQuizzState();
}

class AddQuizzState extends State<AddQuizz> {
  var questionController = TextEditingController();
  var option1Controller = TextEditingController();
  var option2Controller = TextEditingController();
  var option3Controller = TextEditingController();
  var option4Controller = TextEditingController();
  var correctAnswewrController = TextEditingController();

  // final databaseRefrence = Firebase.instance.reference();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            // ignore: prefer_const_constructors
            Text(
              "add Quizz",
              style: const TextStyle(fontSize: 28),
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              // ignore: prefer_const_constructors
              controller: questionController,
              decoration: const InputDecoration(
                  labelText: 'Qusttion', border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: option1Controller,
              decoration: const InputDecoration(
                  labelText: 'optioin 1', border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: option2Controller,
              decoration: const InputDecoration(
                  labelText: 'option 2', border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: option3Controller,
              decoration: const InputDecoration(
                  labelText: 'option 3', border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: option4Controller,
              decoration: const InputDecoration(
                  labelText: 'option 3', border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: correctAnswewrController,
              decoration: const InputDecoration(
                  labelText: 'Correct answer', border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 50,
            ),
            /*
            OutlinedButton(
              onPressed: () {
                if (questionController.text.isNotEmpty &&
                    option1Controller.text.isNotEmpty &&
                    option2Controller.text.isNotEmpty &&
                    option3Controller.text.isNotEmpty &&
                    option3Controller.text.isNotEmpty &&
                    correctAnswewrController.text.isNotEmpty) {
                  InsertQuestionAnswer(
                      questionController.text,
                      option1Controller.text,
                      option2Controller.text,
                      option3Controller.text,
                      option4Controller.text,
                      correctAnswewrController.text);
                }
              },
              child: Text(
                'Save',
                style: TextStyle(fontSize: 18),
              ),
            )
            */
          ]),
        ),
      ),
    );
  }
/*
  void InsertQuestionAnswer(String question, String option1, String option2,
      String option3, String option4, String correctAswer) {
    databaseRefrence.child('path').push().set({
      'question': question,
      'option1': option1,
      'option2': option2,
      'option3': option3,
      'option4': option4,
      'correctAswer': correctAswer,
    });
    questionController.clear();
    option1Controller.clear();
    option2Controller.clear();
    option3Controller.clear();
    option4Controller.clear();
    correctAnswewrController.clear();
  }
  */
}
