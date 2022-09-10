import 'package:cloud_firestore/cloud_firestore.dart';

class GetSubjects {
  Stream<QuerySnapshot> getSubjects() async* {
    //final uid = await GetUserInfo().getCurrentUserID();
    yield* FirebaseFirestore.instance
        .collection('subjects')
        .where('active', isEqualTo: true)
        .snapshots();
  }

  Stream<QuerySnapshot> getOtherSubjects() async* {
    //final uid = await GetUserInfo().getCurrentUserID();
    yield* FirebaseFirestore.instance
        .collection('subjects')
        .where('active', isEqualTo: false)
        .snapshots();
  }
}
