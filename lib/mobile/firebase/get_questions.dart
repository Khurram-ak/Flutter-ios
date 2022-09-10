import 'package:cloud_firestore/cloud_firestore.dart';

class GetQuestions {
  Stream<QuerySnapshot> getQuestions(String subId, String categoryId) async* {
    //final uid = await GetUserInfo().getCurrentUserID();
    yield* FirebaseFirestore.instance
        .collection('questions')
        .doc('$subId')
        .collection('quizCollection')
        .doc('$categoryId')
        .collection('quizCollection')
        .snapshots();
  }
}
