import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class movie_list extends StatefulWidget {
  const movie_list({Key? key}) : super(key: key);

  @override
  State<movie_list> createState() => _movie_listState();
}

class _movie_listState extends State<movie_list> {
  final _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    CollectionReference moviesRef = _firestore.collection("Movie_Db");
    var insRef = moviesRef.doc("Interstellar");

    return Scaffold(
      backgroundColor: Colors.black45,
      appBar: AppBar(
        leading: const BackButton(
            color: Colors.black
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [Colors.yellow, Colors.yellow],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
          )),
        ),
        title: const Text(
          'Your Watchlist',
          textAlign: TextAlign.left,
          style: TextStyle(
              fontFamily: 'ComicNeue',
              color: Colors.black87),
        ),
      ),
      body: Center(
        child: Expanded(
          child: StreamBuilder<QuerySnapshot>(
            stream: moviesRef.snapshots(),
            builder: (BuildContext context, AsyncSnapshot asyncsnapshot) {
              if (asyncsnapshot.hasError) {
                return const Center(child: Text("Sonra tekrar deneyiniz."));
              } else {
                if (asyncsnapshot.hasData) {
                  List<DocumentSnapshot> listOfDocumentSnap =
                      asyncsnapshot.data.docs;
                  return Flexible(
                    child: ListView.builder(
                      //padding: const EdgeInsets.only(top: 10.0),
                      itemCount: listOfDocumentSnap.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 100,
                          child: Card(
                            margin: const EdgeInsets.only(top: 12.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            color: (Colors.white12),
                            child: Center(
                              child: ListTile(
                                title: Padding(
                                  padding: const EdgeInsets.only(bottom: 5.0),
                                  child: Text(
                                      '${listOfDocumentSnap[index].get("name")}',
                                      style: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: (Colors.white))),
                                ),
                                subtitle: Text(
                                    listOfDocumentSnap[index]
                                        .get("genres")
                                        .toString(),
                                    style: const TextStyle(
                                        fontSize: 16, color: (Colors.white))),
                                trailing: Text(
                                    '${listOfDocumentSnap[index].get("year")}',
                                    style: const TextStyle(
                                        fontSize: 16, color: (Colors.white))),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }
            },
          ),
        ),
      ),
    );
  }
}
