import 'package:cloud_firestore/cloud_firestore.dart';

class GetCategories {
  Stream<QuerySnapshot> getCategories(String subId) async* {
    //final uid = await GetUserInfo().getCurrentUserID();
    yield* FirebaseFirestore.instance
        .collection('categories')
        .doc(subId)
        .collection('categoryCollection')
        .snapshots();
  }
}
