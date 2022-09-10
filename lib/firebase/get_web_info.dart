

import 'package:quizjets/export_files.dart';

class GetWebInfo {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<String> getCurrentUserID() async {
    return (_firebaseAuth.currentUser).uid;
  }


  Future getNoEnrolledStudents() async {
    var document = FirebaseFirestore.instance.collection('webInfo').doc('HOME_PAGE');

    return document.get().then((value) => value.data()['enrolled_students']);
  }

  Future getNoSpecialAircrafts() async {
    var document = FirebaseFirestore.instance.collection('webInfo').doc('HOME_PAGE');

    return document.get().then((value) => value.data()['special_aircrafts']);
  }

  Future getNoQuizJetsSub() async {
    var document = FirebaseFirestore.instance.collection('webInfo').doc('HOME_PAGE');

    return document.get().then((value) => value.data()['quizjets_subjects']);
  }
}
