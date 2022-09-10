import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quizjets/export_files.dart';
import 'package:quizjets/models/new_user.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CardTile extends StatefulWidget {
  final id;
  final icons;
  final name;
  final desc;
  final price;
  final loggedIn;
  final comingSoon;
  var deviceScreenType;

  CardTile({
    this.id,
    this.icons,
    this.name,
    this.desc,
    this.price,
    this.loggedIn,
    this.comingSoon,
    this.deviceScreenType,
  });

  @override
  _CardTileState createState() => _CardTileState();
}

class _CardTileState extends State<CardTile> {
  bool exist;
  bool loading = true;
  bool inCart = false;
  StreamSubscription<DocumentSnapshot> subscription;
  StreamSubscription<DocumentSnapshot> cartSubscription;

  final spinkit = SpinKitThreeBounce(
    color: Colors.white,
    size: 15.0,
  );

  void initListeners() async {
    if (!widget.loggedIn) {
      exist = false;
      loading = false;
      return;
    }
    var userId = await GetUserInfo().getCurrentUserID();
    await FirebaseFirestore.instance
        .collection('userBase')
        .doc(userId)
        .get()
        .then((value) {
      NewUser user = NewUser.fromDocument(value);

      if (user.tester) {
        exist = true;
        loading = false;
        setState(() {});
        return;
      }
      if (user.isBlocked) {
        FirebaseAuth.instance.signOut();
        Navigator.of(context).pushNamed(HomePage.route);
      }
    });
    final DocumentReference documentReference = FirebaseFirestore.instance
        .doc('userPurchases/$userId/purchasesCollection/${widget.id}');
    subscription = documentReference.snapshots().listen((datasnapshot) {
      // carOwnerId = datasnapshot.data["carOwnerID"];
      if (datasnapshot.exists) {
        exist = true;
      } else {
        exist = false;
      }
      loading = false;
      setState(() {});
    });
  }

  void initCartListeners() async {
    if (!widget.loggedIn) {
      inCart = false;
      loading = false;
      return;
    }
    var userId = await GetUserInfo().getCurrentUserID();
    final DocumentReference documentReference = FirebaseFirestore.instance
        .doc('userCart/$userId/cartCollection/${widget.id}');
    subscription = documentReference.snapshots().listen((datasnapshot) {
      // carOwnerId = datasnapshot.data["carOwnerID"];
      if (datasnapshot.exists) {
        inCart = true;
      } else {
        inCart = false;
      }
      loading = false;
      setState(() {});
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    initListeners();
    initCartListeners();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    subscription.cancel();
    cartSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Container(
        height: sizingInformation.deviceScreenType == DeviceScreenType.mobile
            ? 380
            : sizingInformation.deviceScreenType == DeviceScreenType.tablet
                ? 400
                : 487,
        //width: 250.0,
        child: Card(
          elevation: 10,
          child: GestureDetector(
            onTap: () {},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyImage(
                  imageUrl: "${widget.icons}",
                  deviceScreenType: sizingInformation.deviceScreenType,
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 25.0,
                    right: 25.0,
                    top: 10.0,
                  ),
                  child: Text(
                    '${widget.name}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: Str.POPPINS,
                      fontWeight: FontWeight.w500,
                      letterSpacing: .8,
                      wordSpacing: 2.5,
                      color: Colors.black.withOpacity(.9),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 25.0,
                    right: 25.0,
                    top: 10.0,
                  ),
                  child: Row(
                    children: [
                      // Icon(
                      //   Icons.help_center_outlined,
                      //   size: 19.0,
                      //   color: Colors.black.withOpacity(.6),
                      // ),
                      // SizedBox(
                      //   width: 10,
                      // ),
                      // Text(
                      //   'Cost: \$${widget.price}',
                      //   maxLines: 3,
                      //   overflow: TextOverflow.ellipsis,
                      //   style: TextStyle(
                      //     fontSize: 15,
                      //     fontFamily: Str.POPPINS,
                      //     fontWeight: FontWeight.w500,
                      //     letterSpacing: .6,
                      //     wordSpacing: 2.5,
                      //     color: QuizJetsTheme.quizJetsBlue.withOpacity(.6),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 5.0,
                    horizontal: 30.0,
                  ),
                  child: Text(
                    '${widget.desc}',
                    maxLines: sizingInformation.deviceScreenType ==
                            DeviceScreenType.tablet
                        ? 2
                        : 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: Str.POPPINS,
                      fontWeight: FontWeight.w500,
                      letterSpacing: .6,
                      wordSpacing: 2.5,
                      color: Colors.black.withOpacity(.8),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                Container(
                  margin: EdgeInsets.only(
                    bottom: 15.0,
                    right: 30.0,
                    top: 13,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(),
                      ),
                      addToCartBtn(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget addToCartBtn() => Container(
        height: 40.0,
        width: 140.0,
        margin: EdgeInsets.only(
          left: 0,
          top: 0.0,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 9.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(4.0),
          ),
          color: QuizJetsTheme.quizJetsBlue,
        ),
        child: Center(
          child: loading
              ? spinkit
              : (widget.comingSoon)
                  ? Center(
                      child: Text(
                        'Coming Soon',
                        style: TextStyle(
                          fontSize: 14.5,
                          fontFamily: Str.POPPINS,
                          fontWeight: FontWeight.w600,
                          //letterSpacing: .4,
                          wordSpacing: 2.5,
                          color: Colors.white,
                        ),
                      ),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        exist ?? false
                            ? Container()
                            : Icon(
                                Icons.shopping_cart_outlined,
                                size: 18.0,
                                color: Colors.white,
                              ),
                        SizedBox(
                          width: 4.0,
                        ),
                        Center(
                          child: TextButton(
                            onPressed: () async {
                              print('PRESSED ADD CART');
                              if (exist) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => WebCategoriesPage(
                                      subjectId: '${widget.name}',
                                    ),
                                  ),
                                );

                                return;
                              }
                              if (widget.loggedIn) {
                                bool exists = await DatabaseServices()
                                    .checkIfItemExists(widget.id);

                                print('EXISTS ::: $exists');

                                if (inCart) {
                                  DatabaseServices()
                                      .removeFromCart('${widget.id}', context);
                                  return;
                                }

                                DatabaseServices().addToCart(
                                  widget.id,
                                  context,
                                  widget.price,
                                  widget.name,
                                  widget.icons,
                                  widget.desc,
                                );
                              } else {
                                Navigator.of(context)
                                    .pushNamed(LoginPage.route);
                              }
                            },
                            child: Text(
                              exist ?? false
                                  ? 'OPEN'
                                  : inCart
                                      ? 'REMOVE'
                                      : 'Add To Cart',
                              style: TextStyle(
                                fontSize: 13.5,
                                fontFamily: Str.POPPINS,
                                fontWeight: FontWeight.w600,
                                //letterSpacing: .4,
                                wordSpacing: 2.5,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
        ),
      );
}
