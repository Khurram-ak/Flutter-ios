import 'dart:async';

import 'package:flutter/material.dart';

import 'package:quizjets/export_files.dart';
import 'package:quizjets/models/purchase_info.dart';

class SuccessPage extends StatefulWidget {
  static const String route = '/success';

  @override
  _SuccessPageState createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  StreamSubscription<DocumentSnapshot> subscription;

  @override
  void initState() {
    super.initState();
    print('before listener payment success');
    initListeners();
    print('after listener payment success');
    initProcess();
    
  }

  initProcess() {
    initListeners();
   // initBackAfterDelay();
  }

  void initListeners() {
    print('listeners before fired');
    print('ask idd??');
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User user = auth.currentUser;
    final uid = user.uid;

    //var userId = await GetUserInfo().getCurrentUserID();
    print('print user id $uid');
    final DocumentReference documentReference =
        FirebaseFirestore.instance.doc('processingPurchase/$uid');
    subscription = documentReference.snapshots().listen((datasnapshot) {
      print('listeners fired');
      Map<dynamic, dynamic> map = datasnapshot.data();
      // carOwnerId = datasnapshot.data["carOwnerID"];
      print('item MAP::: $map');
      if (datasnapshot.exists) {
        var itemId = map['id'];
        print('item ID::: $itemId');
        var itemName = map['name'];
        print('item NAME::: $itemName');
        var itemDesc = map['desc'];
        print('item DESC::: $itemDesc');
        var itemIcon = map['icon'];
        print('item ICONS::: $itemIcon');
        var itemCost = map['cost'];
        print('item COST::: $itemCost');
        var monthly = map['monthly'];
        print('item MONTLY::: $monthly');
        DatabaseServices().addSingleItemToPurchase(
          context,
          '$itemId',
          '$itemName',
          '$itemDesc',
          '$itemIcon',
          int.parse(itemCost),
          monthly,
        );
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    // var purchaseInfo = Provider.of<PurchaseInfo>(context);
    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: const Size.fromHeight(70),
      //   child: HomeBar(),
      // ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // SizedBox(
          //   height: 120.0,
          // ),
          SizedBox(
            height: 400,
            width: 450.0,
            child: Lottie.asset('assets/images/success.json'),
          ),

          Center(
            child: Text(
              'Success',
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
    );
  }

  initBackAfterDelay() {
    Future.delayed(const Duration(seconds: 10), () {
// Here you can write your code

      popUpWidgetScreenUntil(
        context,
        HomePage(),
      );
    });
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
