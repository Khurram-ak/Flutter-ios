import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class NewUser {
  final String id;
  final String name;
  String userEmail;
  bool isBlocked;
  final String phoneNumber;
  bool agreedToMarketingComms;
  String joinedDate;
  bool tester;
  List imageUrl = [];
  NewUser({
    @required this.id,
    @required this.name,
    @required this.imageUrl,
    this.isBlocked,
    this.joinedDate,
    this.userEmail,
    this.tester,
    this.agreedToMarketingComms,
    this.phoneNumber,
  });
  factory NewUser.fromDocument(DocumentSnapshot doc) {
    // DateTime date = DateTime.parse(doc["user_DOB"]);
    return NewUser(
        id: doc['userInfo']['userId'],
        isBlocked: doc['blocked'] ?? false,
        phoneNumber: doc['userContacts']['phoneNumber'] ?? "",
        agreedToMarketingComms: doc['agreedToMarketingComms'] ?? false,
        userEmail: doc['userContacts']['userEmail'] ?? "",
        tester: doc['tester'] ?? false,
        name: doc['userInfo']['fullName'] ?? "",
        joinedDate: doc['userInfo']['joinedDate'] ?? "",
        imageUrl: doc['userPhoto']['url'] != null
            ? List.generate(doc['userPhoto']['url'].length, (index) {
                return doc['userPhoto']['url'][index];
              })
            : null);
  }
}
