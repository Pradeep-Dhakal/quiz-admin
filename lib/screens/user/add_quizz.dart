// ignore_for_file: prefer_const_constructors_in_immutables, library_private_types_in_public_api, prefer_final_fields, sort_child_properties_last

import 'package:cloud_firestore/cloud_firestore.dart';
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
  final CollectionReference quizqa =
      FirebaseFirestore.instance.collection('questions');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
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
                height: 20,
              ),
              TextField(
                controller: option2Controller,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Option 3',
                  hintText: 'Enter Option 3',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: option3Controller,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Option 3',
                  hintText: 'Enter option 3',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: option4Controller,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Option 4',
                  hintText: 'Enter option 4',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: correctAnswewrController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Correct Option',
                  hintText: 'Enter corredt option',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              MaterialButton(
                onPressed: () async {
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
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('You have successfully deleted a Quiz'),
                    ),
                  );
                },
                child: const Text('Add Quiz'),
                color: Colors.teal,
                textColor: Colors.white,
                minWidth: 100,
                height: 40,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
