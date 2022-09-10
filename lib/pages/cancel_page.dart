import 'dart:async';

import 'package:flutter/material.dart';

import 'package:quizjets/export_files.dart';

class CancelPage extends StatefulWidget {
  static const String route = '/cancel';

  @override
  _CancelPageState createState() => _CancelPageState();
}

class _CancelPageState extends State<CancelPage> {
  // StreamSubscription<DocumentSnapshot> subscription;

  // @override
  // void initState() {
  //  // initListeners();
  //   super.initState();
  // }

  // void initListeners() async {

  //   var userId = await GetUserInfo().getCurrentUserID();
  //   final DocumentReference documentReference = FirebaseFirestore.instance
  //       .doc('processingPurchase/$userId');
  //   subscription = documentReference.snapshots().listen((datasnapshot) {
  //     Map<dynamic, dynamic> map = datasnapshot.data();
  //     // carOwnerId = datasnapshot.data["carOwnerID"];
  //     if (datasnapshot.exists) {
  //       var itemId = map.values.toList()[0]['id'];
  //       var itemName = map.values.toList()[0]['name'];
  //       var itemDesc = map.values.toList()[0]['desc'];
  //       var itemIcon = map.values.toList()[0]['icon'];
  //       var itemCost = map.values.toList()[0]['cost'];
  //       var monthly = map.values.toList()[0]['monthly'];
  //       DatabaseServices().addSingleItemToPurchase(
  //         context,
  //         '$itemId',
  //         '$itemName',
  //         '$itemDesc',
  //         '$itemIcon',
  //         int.parse(itemCost),
  //         monthly,
  //       );
  //     } 
  //     setState(() {});
  //   });
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: const Size.fromHeight(70),
      //   child: HomeBar(),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // SizedBox(
            //   height: 120.0,
            // ),
            SizedBox(
              height: 250,
              width: 190.0,
              child: Lottie.asset('assets/images/error.json'),
            ),
            SizedBox(
              height: 80,
            ),
            
            Center(
              child: Text(
                'Cancelled',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: Str.POPPINS,
                  fontWeight: FontWeight.w500,
                  //wordSpacing: 2.5,
                  height: 1.5,
                  letterSpacing: 1,
                  color: Colors.black.withOpacity(.8),
                  fontSize: 28.5,
                ),
              ),
            ),
            // SizedBox(
            //   height: 160.0,
            // ),
            // SizedBox(
            //   height: 40.0,
            // ),
            //FooterView(),
          ],
        ),
      ),
    );
  }

  initPurcase() async {
    var userId = await GetUserInfo().getCurrentUserID();
    await FirebaseFirestore.instance
        .collection('processingPurchase')
        .doc(userId)
        .get()
        .then(
      (value) {
        
      print('ITEM ID ${value.id}');
      print('ITEM DESC ${value.data()['desc']}');
        var itemId = value.id;
        var itemName = value.data()['name'];
        var itemDesc = value.data()['desc'];
        var itemIcon = value.data()['icon'];
        var itemCost = value.data()['cost'];
        var monthly = value.data()['monthly'];
        DatabaseServices().addSingleItemToPurchase(
          context,
          '$itemId',
          '$itemName',
          '$itemDesc',
          '$itemIcon',
          int.parse(itemCost),
          monthly,
        );
      },
    );
  }
}
