import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

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
  var qanswers = [];

  // qoptions.insert(0,option1Controller.text);

  // late DatabaseReference dbref;
  final dbref = FirebaseDatabase.instance.ref();
  final CollectionReference quizqa =
      FirebaseFirestore.instance.collection('questions');

  // @override
  // void initState() {
  //   super.initState();
  //   dbref = FirebaseDatabase.instance.ref().child('questions');
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Text(
                'Inserting data in Firebase Realtime Database',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: questionController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Qestion',
                  hintText: 'Enter Question',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: option1Controller,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'option1',
                  hintText: 'Enter option 1',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: option2Controller,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'op2',
                  hintText: 'Enter',
                ),
              ),
              TextField(
                controller: option3Controller,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'op3',
                  hintText: 'Enter op3',
                ),
              ),
              TextField(
                controller: option4Controller,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'op4',
                  hintText: 'Enter',
                ),
              ),
              TextField(
                controller: correctAnswewrController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Correct option',
                  hintText: 'Enter',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              MaterialButton(
                onPressed: () async {
                  // print(qanswers);
                  // qanswers[0] = option1Controller.text;
                  // qanswers[1] = option2Controller.text;
                  // qanswers[2] = option3Controller.text;
                  // qanswers[3] = option4Controller.text;

                  // for (var i = 0; i < 4; i++) {
                  //   if (i == 0) {
                  //     qanswers[i] = option1Controller.text;
                  //   }
                  //   if (i == 1) {
                  //     qanswers[i] = option2Controller.text;
                  //   }
                  //   if (i == 2) {
                  //     qanswers[i] = option3Controller.text;
                  //   }
                  //   if (i == 3) {
                  //     qanswers[i] = option4Controller.text;
                  //   }
                  // }

                  await quizqa.add({
                    'question': questionController.text,
                    'correctAnswer': correctAnswewrController.text,
                    'answers': [
                      option1Controller.text,
                      option2Controller.text,
                      option3Controller.text,
                      option4Controller.text
                    ],
                  });
                  // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  //     content:
                  //         Text('You have successfully deleted a product')));
                },
                child: const Text('Insert Data'),
                color: Colors.blue,
                textColor: Colors.white,
                minWidth: 300,
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
