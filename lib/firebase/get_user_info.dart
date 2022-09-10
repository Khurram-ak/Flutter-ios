

import 'package:quizjets/export_files.dart';

class GetUserInfo {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<String> getCurrentUserID() async {
    return (_firebaseAuth.currentUser).uid;
  }

  Future<String> getCurrentUserPhoneNumber() async {
    return (_firebaseAuth.currentUser).phoneNumber;
  }

  Future<String> getCurrentUserAvatar() async {
    final uid = await getCurrentUserID();
    var document = FirebaseFirestore.instance.collection('userBase').doc(uid);

    return document.get().then((value) => value.data()['userPhoto']['url'][0]);
  }

  Future getCurrentUserName() async {
    final uid = await getCurrentUserID();
    //CollectionReference users = FirebaseFirestore.instance.collection('userBase').doc(uid);
    var document = FirebaseFirestore.instance.collection('userBase').doc(uid);

    return document.get().then((value) => value.data()['userInfo']['fullName']);
  }

  Future getCurrentUserFName() async {
    final uid = await getCurrentUserID();
    //CollectionReference users = FirebaseFirestore.instance.collection('userBase').doc(uid);
    var document = FirebaseFirestore.instance.collection('userBase').doc(uid);

    return document.get().then((value) => value.data()['userInfo']['firstName']);
  }


  Future getCurrentUserLName() async {
    final uid = await getCurrentUserID();
    //CollectionReference users = FirebaseFirestore.instance.collection('userBase').doc(uid);
    var document = FirebaseFirestore.instance.collection('userBase').doc(uid);

    return document.get().then((value) => value.data()['userInfo']['lastName']);
  }

  Future getUserAbout() async {
    final uid = await getCurrentUserID();
    //CollectionReference users = FirebaseFirestore.instance.collection('userBase').doc(uid);
    var document = FirebaseFirestore.instance.collection('userBase').doc(uid);

    return document.get().then((value) => value.data()['userAbout']['about']);
  }

  Future getUserLocation() async {
    final uid = await getCurrentUserID();
    //CollectionReference users = FirebaseFirestore.instance.collection('userBase').doc(uid);
    var document = FirebaseFirestore.instance.collection('userBase').doc(uid);

    return document.get().then((value) => value.data()['userLocation']['address']);
  }

  Future getUserWork() async {
    final uid = await getCurrentUserID();
    //CollectionReference users = FirebaseFirestore.instance.collection('userBase').doc(uid);
    var document = FirebaseFirestore.instance.collection('userBase').doc(uid);

    return document.get().then((value) => value.data()['userAbout']['work']);
  }


  Future<String> getJoinedOn() async {
    final uid = await getCurrentUserID();
    var document = FirebaseFirestore.instance.collection('userBase').doc(uid);

    return document.get().then((value) => value.data()['userInfo']['joinedDate']);
  }

  Future<String> getCurrentUserEmail() async {
    return (_firebaseAuth.currentUser).email;
  }
}
