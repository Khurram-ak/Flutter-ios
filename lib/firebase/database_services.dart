import 'package:flutter/material.dart';
import 'package:quizjets/export_files.dart';
import 'package:intl/intl.dart';
import 'package:quizjets/models/category.dart';
import 'package:quizjets/models/purchase_info.dart';

class DatabaseServices {
  var _db = FirebaseFirestore.instance;

  Stream<WebInfo> streamWebInfo() {
    return _db.collection('webInfo').doc('HOME_PAGE').snapshots().map(
          (event) => WebInfo.fromMap(
            event.data(),
          ),
        );
  }

  Stream<PurchaseInfo> streamProcessingPurchase(userId) {
    return _db.collection('processingPurchase').doc(userId).snapshots().map(
          (event) => PurchaseInfo.fromMap(
            event.data(),
          ),
        );
  }

  Stream<CurrentUser> streamUserInfo(userId) {
    return _db.collection('userBase').doc(userId).snapshots().map(
          (event) => CurrentUser.fromMap(
            event.data(),
          ),
        );
  }

  Stream<List<Subject>> streamSubjects() {
    var ref = _db.collection('subjects');
    return ref.snapshots().map(
          (event) => event.docs.map((e) => Subject.fromFirestore(e)).toList(),
        );
  }

  Stream<List<Cart>> streamCart(userId) {
    var ref =
        _db.collection('userCart').doc('$userId').collection('cartCollection');
    return ref.snapshots().map(
          (event) => event.docs.map((e) => Cart.fromFirestore(e)).toList(),
        );
  }

  Stream<List<Category>> streamCategory(subjectId) {
    var ref = _db
        .collection('categories')
        .doc('$subjectId')
        .collection('categoryCollection');
    return ref.snapshots().map(
          (event) => event.docs.map((e) => Category.fromFirestore(e)).toList(),
        );
  }

  Stream<List<Purchase>> streamPurchases(userId) {
    var ref = _db
        .collection('userPurchases')
        .doc('$userId')
        .collection('purchasesCollection');
    return ref.snapshots().map(
          (event) => event.docs.map((e) => Purchase.fromFirestore(e)).toList(),
        );
  }

  Stream<List<Faq>> streamFaqs() {
    var ref = _db.collection('faqsBase');
    return ref.snapshots().map(
          (event) => event.docs.map((e) => Faq.fromFirestore(e)).toList(),
        );
  }

  Stream<List<Pricing>> streamPricing() {
    var ref = _db.collection('pricing');
    return ref.snapshots().map(
          (event) => event.docs.map((e) => Pricing.fromFirestore(e)).toList(),
        );
  }

  Future getPlanes() async {
    List planesList = [];
    await _db.collection('subjects').get().then(
      (value) {
        print('VALUE DOCS :: ${value.docs}');
        for (var item in value.docs) {
          Plane plane = Plane(
            item["icon"],
            item["desc"],
            item["name"],
            item["cost"],
          );
          planesList.add(plane);
        }
      },
    );
    print('LIST COUNT :: ${planesList.length}');
    return planesList;
  }

  addToCart(
    airCraftId,
    context,
    cost,
    name,
    icon,
    desc,
  ) async {
    var userId = await GetUserInfo().getCurrentUserID();
    _db.collection('userCart').doc(userId).set({
      'dummyField': '',
    });
    _db
        .collection('userCart')
        .doc(userId)
        .collection('cartCollection')
        .doc(airCraftId)
        .set(
      {
        'name': name,
        'id': '$airCraftId',
        'icon': icon,
        'cost': cost,
        'desc': desc,
      },
    ).then(
      (value) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Color(0xFF007EC7),
            content: Text(
              "Success!",
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontFamily: Str.POPPINS,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.2,
              ),
            ),
          ),
        );
      },
    );
  }

  removeFromCart(id, context) async {
    var userId = await GetUserInfo().getCurrentUserID();
    _db
        .collection('userCart')
        .doc(userId)
        .collection('cartCollection')
        .doc(id)
        .delete()
        .then(
      (value) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Color(0xFF007EC7),
            content: Text(
              "Success!",
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontFamily: Str.POPPINS,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.2,
              ),
            ),
          ),
        );
      },
    );
  }

  Future<bool> checkIfPricingExists(pricingId) async {
    var userId = await GetUserInfo().getCurrentUserID();

    try {
      await _db
          .collection('userCart')
          .doc(userId)
          .collection('cartCollection')
          .doc(pricingId)
          .get()
          .then((doc) {
        return true;
      });
      return true;
    } catch (e) {
      // If any error
      return false;
    }
  }

  Future<bool> checkIfItemExists(id) async {
    var userId = await GetUserInfo().getCurrentUserID();
    print('PURCHASE ID:: $id');
    try {
      await _db
          .collection('userPurchases/$userId/purchasesCollection/$id')
          .get()
          .then((doc) {
        return true;
      });
      return true;
    } catch (e) {
      // If any error
      return false;
    }
  }

  addItemToPurchase(
    BuildContext context,
  ) async {
    var userId = await GetUserInfo().getCurrentUserID();

    await FirebaseFirestore.instance
        .collection('userCart')
        .doc('$userId')
        .collection('cartCollection')
        .get()
        .then((value) {
      for (var item in value.docs) {
        _db.collection('userPurchases').doc(userId).set({
          'dummyField': '',
        });
        _db
            .collection('userPurchases')
            .doc(userId)
            .collection('purchasesCollection')
            .doc(item["id"])
            .set({
          'id': item["id"],
          'name': item["name"],
          'desc': item["desc"],
          'icon': item["icon"],
          'cost': item["cost"],
          'date':
              DateFormat('EEE, MMM d, ' 'hh:mm aaa').format(new DateTime.now()),
        }).then((doc) async {
          await _db
              .collection('userCart')
              .doc(userId)
              .collection('cartCollection')
              .doc(item["id"])
              .delete();
        });

        Navigator.of(context).pushNamed(PurchasesPage.route);
      }
    });
  }

  addSingleItemToPurchase(
    BuildContext context,
    id,
    name,
    desc,
    icon,
    cost,
    monthlySub,
  ) async {
    var userId = await GetUserInfo().getCurrentUserID();

    _db.collection('userPurchases').doc(userId).set({
      'dummyField': '',
    });
    _db
        .collection('userPurchases')
        .doc(userId)
        .collection('purchasesCollection')
        .doc(id)
        .set({
      'id': id,
      'name': name,
      'desc': desc,
      'icon': icon,
      'cost': cost,
      'date': new DateTime.now(),
      'monthlySubscription': monthlySub,
    }).then((doc) async {
      Future.delayed(const Duration(milliseconds: 800), () async {
        await _db
            .collection('userCart')
            .doc(userId)
            .collection('cartCollection')
            .doc(id)
            .delete()
            .then((value) => popUpWidgetScreenUntil(
                  context,
                  HomePage(),
                ));
        // Navigator.of(context).pushNamed(HomePage.route);
      });
    });
  }
}
