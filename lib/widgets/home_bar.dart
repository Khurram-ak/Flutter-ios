import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quizjets/export_files.dart';
import 'package:quizjets/models/category.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeBar extends StatefulWidget {
  @override
  _HomeBarState createState() => _HomeBarState();
}

class _HomeBarState extends State<HomeBar> {
  bool exists;
  StreamSubscription<DocumentSnapshot> subscription;

  @override
  void initState() {
    super.initState();
    initListeners();
  }


  void initListeners() async {
    
    var userId = await GetUserInfo().getCurrentUserID();
    final DocumentReference documentReference = FirebaseFirestore.instance
        .doc('userPurchases/$userId/purchasesCollection/BD700');
    subscription = documentReference.snapshots().listen((datasnapshot) {
      // carOwnerId = datasnapshot.data["carOwnerID"];
      if (datasnapshot.exists) {
        exists = true;
        setState(() {});
      } else {
        exists = false;
        setState(() {});
      }
      print('EXISSSTS.... $exists');
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User>(context);
    bool loggedIn = user != null;


    return ResponsiveBuilder(
      builder: (context, sizingInformation) => AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: QuizJetsTheme.quizJetsBlue,
        iconTheme: new IconThemeData(color: Colors.white),
        elevation: 0.0,
        leading: sizingInformation.deviceScreenType ==
                    DeviceScreenType.mobile ||
                sizingInformation.deviceScreenType == DeviceScreenType.tablet
            ? Container(
                margin: EdgeInsets.only(
                  top: 10,
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: Colors.white,
                    size: sizingInformation.deviceScreenType ==
                            DeviceScreenType.mobile
                        ? 25
                        : 30,
                  ),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                ),
              )
            : Container(),
        title: Container(
          margin: EdgeInsets.only(
            left: (MediaQuery.of(context).size.width < 1150)
                ? 30
                : MediaQuery.of(context).size.width * .075,
          ),
          padding: EdgeInsets.only(
            top: 10.0,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    popUpWidgetScreenUntil(
                      context,
                      HomePage(),
                    );
                    Navigator.of(context).pushNamed(HomePage.route);
                  },
                  child: SizedBox(
                    height: sizingInformation.deviceScreenType ==
                            DeviceScreenType.mobile
                        ? 35
                        : 35.0,
                    width: sizingInformation.deviceScreenType ==
                            DeviceScreenType.mobile
                        ? 150
                        : 180.0,
                    child: SvgPicture.asset(
                      'assets/svgs/logo.svg',
                    ),
                  ),
                  // child: Image(
                  //   height: 50.0,
                  //   width: 190.0,
                  //   image: AssetImage('assets/images/white_logo.png'),
                  // ),
                ),
              ),
              SizedBox(
                width: 65.0,
              ),
              Expanded(
                child: Visibility(
                  visible: sizingInformation.deviceScreenType ==
                              DeviceScreenType.mobile ||
                          sizingInformation.deviceScreenType ==
                              DeviceScreenType.tablet
                      ? false
                      : true,
                  child: Row(
                    children: [
                      !loggedIn ?? false
                          ? Container()
                          : exists?? false ? TextButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(MyCoursewarePage.route);
                              },
                              child: Text(
                                'MY COURSEWARE',
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: 14.5,
                                  fontFamily: Str.POPPINS,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: .4,
                                  wordSpacing: 2.5,
                                  color: Colors.white,
                                ),
                              ),
                            ) : TextButton(
                              onPressed: () {
                                // locator<NavigationService>()
                                //     .navigateTo(CoursewareRoute);
                                Navigator.of(context)
                                    .pushNamed(CoursewarePage.route);
                              },
                              child: Text(
                                'COURSEWARE',
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: 14.5,
                                  fontFamily: Str.POPPINS,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: .4,
                                  wordSpacing: 2.5,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                      loggedIn ?? true
                          ? Container()
                          : TextButton(
                              onPressed: () {
                                // locator<NavigationService>()
                                //     .navigateTo(CoursewareRoute);
                                Navigator.of(context)
                                    .pushNamed(CoursewarePage.route);
                              },
                              child: Text(
                                'COURSEWARE',
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: 14.5,
                                  fontFamily: Str.POPPINS,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: .4,
                                  wordSpacing: 2.5,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                      SizedBox(
                        width: 55.0,
                      ),
                      TextButton(
                        onPressed: () {
                          // locator<NavigationService>().navigateTo(PricingRoute);
                          Navigator.of(context).pushNamed(PricingPage.route);
                        },
                        child: Text(
                          'PRICING',
                          style: TextStyle(
                            fontSize: 14.5,
                            fontFamily: Str.POPPINS,
                            fontWeight: FontWeight.w600,
                            letterSpacing: .4,
                            wordSpacing: 2.5,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 55.0,
                      ),
                      loggedIn ?? true
                          ? Container()
                          : TextButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(LoginPage.route);
                              },
                              child: Text(
                                'LOGIN',
                                style: TextStyle(
                                  fontSize: 14.5,
                                  fontFamily: Str.POPPINS,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: .4,
                                  wordSpacing: 2.5,
                                  color: Colors.white,
                                ),
                              ),
                            ),

                      !loggedIn ?? false
                          ? Container()
                          : Visibility(
                            visible: exists ?? false,
                            child: TextButton(
                                onPressed: () {
                                  _showBD700PopupMenu();
                                },
                                child: Text(
                                  'BD700',
                                  style: TextStyle(
                                    fontSize: 14.5,
                                    fontFamily: Str.POPPINS,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: .4,
                                    wordSpacing: 2.5,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                          ),
                      // !loggedIn ?? false
                      //     ? Container()
                      //     : TextButton(
                      //         onPressed: () {
                      //           Navigator.of(context)
                      //               .pushNamed(PurchasesPage.route);
                      //         },
                      //         child: Text(
                      //           'MY SUBSCRIPTIONS',
                      //           style: TextStyle(
                      //             fontSize: 14.5,
                      //             fontFamily: Str.POPPINS,
                      //             fontWeight: FontWeight.w600,
                      //             letterSpacing: .4,
                      //             wordSpacing: 2.5,
                      //             color: Colors.white,
                      //           ),
                      //         ),
                      //       ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        centerTitle: false,
        actions: [
          Container(
            margin: EdgeInsets.only(
              top: 10,
            ),
            child: Stack(
              children: [
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      if (loggedIn) {
                        //locator<NavigationService>().navigateTo(CartRoute);
                        Navigator.of(context).pushNamed(CartPage.route);
                      } else {
                        // locator<NavigationService>().navigateTo(LoginRoute);
                        Navigator.of(context).pushNamed(LoginPage.route);
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.only(
                        top: 10,
                        right: 15,
                      ),
                      child: Icon(
                        Icons.shopping_cart_outlined,
                        size: 24.0,
                      ),
                    ),
                  ),
                ),
                loggedIn
                    ? StreamProvider<List<Cart>>.value(
                        initialData: [],
                        value: DatabaseServices().streamCart(user.uid),
                        child: CartBadge(),
                      )
                    : Container(),
              ],
            ),
          ),
          SizedBox(
            width: sizingInformation.deviceScreenType == DeviceScreenType.mobile
                ? 0
                : sizingInformation.deviceScreenType == DeviceScreenType.tablet
                    ? 10
                    : 20.0,
          ),
          loggedIn ? userAvatar(loggedIn, sizingInformation) : Container(),
          loggedIn
              ? Container()
              : Visibility(
                  visible: sizingInformation.deviceScreenType ==
                              DeviceScreenType.mobile ||
                          sizingInformation.deviceScreenType ==
                              DeviceScreenType.tablet
                      ? false
                      : true,
                  child: Container(
                    margin: EdgeInsets.only(
                      top: 13,
                      right: (MediaQuery.of(context).size.width < 1150)
                          ? 30
                          : MediaQuery.of(context).size.width * .11,
                    ),
                    child: GetStartedBtn(),
                  ),
                )
        ],
      ),
    );
  }

  Widget userAvatar(loggedIn, sizingInformation) => Visibility(
        visible: true,
        child: Container(
          margin: EdgeInsets.only(
            top: 10,
            right:
                sizingInformation.deviceScreenType == DeviceScreenType.mobile ||
                        sizingInformation.deviceScreenType ==
                            DeviceScreenType.tablet
                    ? 20
                    : MediaQuery.of(context).size.width * .11,
          ),
          height: 65,
          width: 65,
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: Colors.black.withOpacity(.2)),
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                if (loggedIn) {
                  _showPopupMenu();
                } else {
                  // locator<NavigationService>().navigateTo(LoginRoute);
                  Navigator.of(context).pushNamed(LoginPage.route);
                }
              },
              child: Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
          ),
        ),
      );

  _showPopupMenu() {
    showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(25.0, 25.0, 0.0,
          0.0), //position where you want to show the menu on screen
      items: [
        PopupMenuItem<String>(
            child: Text(
              "Profile",
              style: TextStyle(
                //fontSize: 17,
                fontFamily: Str.POPPINS,
                fontWeight: FontWeight.w500,
                letterSpacing: 1.2,
              ),
              textAlign: TextAlign.start,
            ),
            value: '1'),
        PopupMenuItem<String>(
            child: const Text(
              "Purchases",
              style: TextStyle(
                //fontSize: 17,
                fontFamily: Str.POPPINS,
                fontWeight: FontWeight.w500,
                letterSpacing: 1.2,
              ),
              textAlign: TextAlign.start,
            ),
            value: '2'),
        PopupMenuItem<String>(
            child: const Text(
              "Settings",
              style: TextStyle(
                //fontSize: 17,
                fontFamily: Str.POPPINS,
                fontWeight: FontWeight.w500,
                letterSpacing: 1.2,
              ),
              textAlign: TextAlign.start,
            ),
            value: '3'),
        PopupMenuItem<String>(
            child: const Text(
              "Log out",
              style: TextStyle(
                //fontSize: 17,
                fontFamily: Str.POPPINS,
                fontWeight: FontWeight.w500,
                letterSpacing: 1.2,
              ),
              textAlign: TextAlign.start,
            ),
            value: '4'),
      ],
      elevation: 8.0,
    ).then<void>((String itemSelected) {
      if (itemSelected == null) return;

      if (itemSelected == "1") {
        // locator<NavigationService>().navigateTo(MyDetailsRoute);
        Navigator.of(context).pushNamed(MyDetailsPage.route);
      } else if (itemSelected == "2") {
        Navigator.of(context).pushNamed(PurchasesPage.route);
      } else if (itemSelected == "3") {
        Navigator.of(context).pushNamed(SettingsPage.route);
      } else {
        _showSignOutAlertDialog();
      }
    });
  }

  void _showSignOutAlertDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return alert dialog object
        return AlertDialog(
          //backgroundColor: Colors.white,
          title: new Text(
            "Are you sure you want\n"
            "to logout? ",
            style: TextStyle(
                fontSize: 19,
                color: Colors.grey,
                fontFamily: Str.POPPINS,
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.start,
          ),
          //content: phoneTextField(),
          actions: <Widget>[
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: new Text(
                  "  CANCEL     \n",
                  style: TextStyle(
                      fontSize: 17,
                      // color: Colors.black.withOpacity(.5),
                      fontFamily: Str.POPPINS,
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Text(
              "   ",
              style: TextStyle(
                  fontSize: 14.5,
                  color: Color(0xFF007EC7),
                  fontFamily: Str.POPPINS,
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () async {
                  Navigator.of(context).pop();
                  // GoogleSignIn googleSignIn = GoogleSignIn();
                  //await googleSignIn.signOut();
                  await FirebaseAuth.instance.signOut();

                  Navigator.of(context).pushNamed(HomePage.route);
                },
                child: new Text(
                  "   LOG OUT         \n",
                  style: TextStyle(
                      fontSize: 17,
                      color: Color(0xFF007EC7),
                      fontFamily: Str.POPPINS,
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  _showBD700PopupMenu() {
    showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(MediaQuery.of(context).size.width * .45, 100.0, MediaQuery.of(context).size.width * .4,
          100.0), //position where you want to show the menu on screen
      items: [
        PopupMenuItem<String>(
            child: Text(
              "Airplane General",
              style: TextStyle(
                //fontSize: 17,
                fontFamily: Str.POPPINS,
                fontWeight: FontWeight.w500,
                letterSpacing: 1.2,
              ),
              textAlign: TextAlign.start,
            ),
            value: '1'),
        PopupMenuItem<String>(
            child: const Text(
              "Electronic Displays",
              style: TextStyle(
                //fontSize: 17,
                fontFamily: Str.POPPINS,
                fontWeight: FontWeight.w500,
                letterSpacing: 1.2,
              ),
              textAlign: TextAlign.start,
            ),
            value: '2'),
        PopupMenuItem<String>(
            child: const Text(
              "Fire Protection",
              style: TextStyle(
                //fontSize: 17,
                fontFamily: Str.POPPINS,
                fontWeight: FontWeight.w500,
                letterSpacing: 1.2,
              ),
              textAlign: TextAlign.start,
            ),
            value: '3'),
        
      ],
      elevation: 8.0,
    ).then<void>((String itemSelected) {
      if (itemSelected == null) return;

      if (itemSelected == "1") {
        // locator<NavigationService>().navigateTo(MyDetailsRoute);
        Navigator.pushNamed(
          context,
          QuestionRoute,
          arguments: Category(
            id: 'Airplane General',
            name: 'Airplane General',
            desc: '',
            icon: '',
          ),
        );
      } else if (itemSelected == "2") {
        Navigator.pushNamed(
          context,
          QuestionRoute,
          arguments: Category(
            id: 'Electronic Displays',
            name: 'Electronic Displays',
            desc: '',
            icon: '',
          ),
        );
      } else if (itemSelected == "3") {
        Navigator.pushNamed(
          context,
          QuestionRoute,
          arguments: Category(
            id: 'Fire Protection',
            name: 'Fire Protection',
            desc: '',
            icon: '',
          ),
        );
      }
    });
  }
}

class CartBadge extends StatefulWidget {
  @override
  _CartBadgeState createState() => _CartBadgeState();
}

class _CartBadgeState extends State<CartBadge> {
  var userId = '';
  @override
  void initState() {
    super.initState();
    initInfo();
  }

  initInfo() async {
    userId = await GetUserInfo().getCurrentUserID();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var carts = Provider.of<List<Cart>>(context);
    return StreamProvider<List<Cart>>.value(
      initialData: [],
      value: DatabaseServices().streamCart(userId),
      child: carts.length > 0
          ? Container(
              margin: EdgeInsets.only(
                left: 15,
                top: 3,
              ),
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Center(
                child: Text(
                  '${carts.length.toString()}',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: Str.POPPINS,
                    fontWeight: FontWeight.w500,
                    letterSpacing: .4,
                    wordSpacing: 2.5,
                    color: QuizJetsTheme.quizJetsBlue,
                  ),
                ),
              ),
            )
          : Container(),
    );
  }
}
