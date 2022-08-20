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
            return CircularProgressIndicator();
          }
          return ListView(
            padding: const EdgeInsets.all(8),
            children: snapshot.data!.docs.map((document) {
              return Card(
                child: ListTile(
                  leading: GestureDetector(
                    onTap: () {},
                    child: const Icon(Icons.edit),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      _delete(document.id);
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
