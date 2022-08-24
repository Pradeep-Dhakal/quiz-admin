import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EditQuiz extends StatefulWidget {
  final String id;
  final String name;
  const EditQuiz({Key? key, required this.id, required this.name})
      : super(key: key);

  @override
  State<EditQuiz> createState() => _QditQuizState();
}

class _QditQuizState extends State<EditQuiz> {
  var questionController = TextEditingController();
  var option1Controller = TextEditingController();
  var option2Controller = TextEditingController();
  var option3Controller = TextEditingController();
  var option4Controller = TextEditingController();
  var correctAnswewrController = TextEditingController();

  final CollectionReference quizqa =
      FirebaseFirestore.instance.collection('questions');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Quiz"),
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
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
                height: 50,
              ),
              TextField(
                controller: option1Controller,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'option1',
                  hintText: 'Enter option 1',
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              TextField(
                controller: option2Controller,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'op2',
                  hintText: 'Enter',
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              TextField(
                controller: option3Controller,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'op3',
                  hintText: 'Enter op3',
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              TextField(
                controller: option4Controller,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'op4',
                  hintText: 'Enter',
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              TextFormField(
                onChanged: (value) => value = widget.name,
                initialValue: widget.name,
                controller: correctAnswewrController,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
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
                child: GestureDetector(
                  child: const Text('Update Data'),
                  onTap: () {
                    updateUser(
                      questionController.text,
                      option1Controller.text,
                      option2Controller.text,
                      option3Controller.text,
                      option4Controller.text,
                      correctAnswewrController.text,
                    );
                  },
                ),
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

  // updating
  Future<void> updateUser(
      questionController,
      option1Controller,
      option2Controller,
      option3Controller,
      option4Controller,
      correctAnswewrController) {
    return FirebaseFirestore.instance
        .doc('questions/${widget.id}')
        .update({
          'question': questionController,
          'correctAnswer': correctAnswewrController,
          'answers': [
            option1Controller,
            option2Controller,
            option3Controller,
            option4Controller,
          ],
        })
        .then((value) => Navigator.pop(context))
        .catchError((error) => print("Failed to update user: $error"));
  }

  // getDocumentID() {
  //   FirebaseFirestore.instance
  //       .collection('questions')
  //       .doc(widget.id)
  //       .collection('notes')
  //       .get()
  //       .then((value) {
  //     value.docs.forEach((element) {
  //       print("Note ID: ${element.id}");
  //     });
  //   });
  // }

  updateData() {}
}
