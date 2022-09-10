import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quizjets/export_files.dart';
import 'package:quizjets/models/category.dart';

class DrawerBody extends StatefulWidget {
  final userEmail;
  final userName;

  DrawerBody({
    this.userEmail,
    this.userName,
  });

  @override
  State<StatefulWidget> createState() => _DrawerBodyState();
}

class _DrawerBodyState extends State<DrawerBody> {
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

    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //listTile(),
            // settings(),
            //settingsTile(),
            !loggedIn?? false || !exists?? false ? coursewareTile() : exists?? false ?  myCoursewareTile() : coursewareTile(),
            pricingTile(),
            !loggedIn ?? true
                          ? Container() //exists?? false 
                          : Visibility(
                            visible: exists ?? false,
                            child: BD700Tile(),),
            // aboutUsTile(),
            // settingsTile(),
            //logOutTile(),
            SizedBox(height: 40.0),
          ],
        ),
      ],
    );
  }

  Widget listTile() => Container(
        child: ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SupportPage(),
              ),
            );
          },
          leading: Icon(
            FontAwesomeIcons.question,
            //color: Colors.black,
            size: 17,
          ),
          title: Text(
            "Support",
            style: TextStyle(
                fontSize: 15,
                //color: Colors.black,
                fontFamily: Str.POPPINS,
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.start,
          ),
        ),
      );

  Widget settingsTile() => Container(
        child: ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MobileSettingsPage(
                  userName: widget.userName,
                  userEmail: widget.userEmail,
                ),
              ),
            );
          },
          leading: Icon(
            FontAwesomeIcons.cog,
            //color: Colors.black,
            size: 17,
          ),
          title: Text(
            "Settings",
            style: TextStyle(
                fontSize: 15,
                //color: Colors.black,
                fontFamily: Str.POPPINS,
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.start,
          ),
        ),
      );

      Widget BD700Tile() => Container(
        child: ListTile(
          onTap: () {
            _showBD700PopupMenu();
          },
          leading: Icon(
            FontAwesomeIcons.cog,
            color: Colors.white,
            size: 17,
          ),
          title: Text(
            "BD700",
            style: TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontFamily: Str.POPPINS,
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.start,
          ),
        ),
      );

      _showBD700PopupMenu() {
    showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(25.0, 25.0, 0.0,
          0.0), //position where you want to show the menu on screen
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


  Widget coursewareTile() => Container(
        child: ListTile(
          onTap: () {
            Navigator.of(context).pushNamed(CoursewarePage.route);
          },
          leading: Icon(
            FontAwesomeIcons.cog,
            color: Colors.white,
            size: 17,
          ),
          title: Text(
            "Courseware",
            style: TextStyle(
                fontSize: 17,
                color: Colors.white,
                fontFamily: Str.POPPINS,
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.start,
          ),
        ),
      );

  Widget myCoursewareTile() => Container(
        child: ListTile(
          onTap: () {
            Navigator.of(context).pushNamed(MyCoursewarePage.route);
          },
          leading: Icon(
            FontAwesomeIcons.cog,
            color: Colors.white,
            size: 17,
          ),
          title: Text(
            "My Courseware",
            style: TextStyle(
                fontSize: 17,
                color: Colors.white,
                fontFamily: Str.POPPINS,
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.start,
          ),
        ),
      );

  Widget pricingTile() => Container(
        child: ListTile(
          onTap: () {
            Navigator.of(context).pushNamed(PricingPage.route);
          },
          leading: Icon(
            FontAwesomeIcons.cog,
            color: Colors.white,
            size: 17,
          ),
          title: Text(
            "Pricing",
            style: TextStyle(
                fontSize: 17,
                color: Colors.white,
                fontFamily: Str.POPPINS,
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.start,
          ),
        ),
      );

  Widget aboutUsTile() => Container(
        child: ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AboutUsPage(),
              ),
            );
          },
          leading: Icon(
            FontAwesomeIcons.infoCircle,
            // color: Colors.black,
            size: 17,
          ),
          title: Text(
            "About Us",
            style: TextStyle(
                fontSize: 15,
                //  color: Colors.black,
                fontFamily: Str.POPPINS,
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.start,
          ),
        ),
      );
}
