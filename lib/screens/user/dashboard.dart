// ignore_for_file: sort_child_properties_last, prefer_interpolation_to_compose_strings, use_build_context_synchronously, library_private_types_in_public_api, prefer_const_constructors_in_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quizadminpanel/screens/user/editquizz.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var allQuiz = FirebaseFirestore.instance.collection('questions').snapshots();
  // var quizz=
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: allQuiz,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }
          return ListView(
            padding: const EdgeInsets.all(8),
            children: snapshot.data!.docs.map((document) {
              return Card(
                child: ListTile(
                  leading: GestureDetector(
                    onTap: () {
                      // print(document.id);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditQuiz(
                                id: document.id, name: document['question'])),
                      );
                    },
                    child: const Icon(Icons.edit),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      _delete(document.id);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content:
                              Text('You have successfully deleted a Quiz')));
                    },
                  ), // for Left

                  title: Text(document['question']),
                  subtitle: Text('Answer: ' + document['correctAnswer']),
                ),
              );
            }).toList(),
            shrinkWrap: true,
          );
        },
      ),
    );
  }

  Future<void> _delete(String quizid) async {
    await FirebaseFirestore.instance
        .collection('questions')
        .doc(quizid)
        .delete();

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('You have successfully deleted a product')));
  }
}
