

import 'package:flutter/material.dart';

import '../../export_files.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  bool accepted = false;
  bool _loading = false;
  String userNameStr = '';
  String userFNameStr = '';
  String userEmailStr = '';
  
  @override
  void initState() {
    super.initState();
    initUserInfo();
    initLegalAgreement();
  }

  initUserInfo() async {
    userNameStr = await GetUserInfo().getCurrentUserName();
    userEmailStr = await GetUserInfo().getCurrentUserEmail();
    userFNameStr = await GetUserInfo().getCurrentUserFName().whenComplete(() {
      _loading = true;
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedTheme(
      duration: Duration(milliseconds: 300),
      data: Theme.of(context),
      child: Scaffold(
        appBar: actionBar(),
        drawer: MainNavigationDrawer(
          userName: userNameStr,
          userFName: userFNameStr,
          userEmail: userEmailStr,
        ),
        body: accepted
            ? ListView(
                children: [
                  SelectYourAirplaneView(),
                  OtherAirplaneView(),
                ],
              )
            : Center(
                //child: CircularProgressIndicator(),
                ),
      ),
    );
  }

  Widget actionBar() => AppBar(
        iconTheme: new IconThemeData(color: Colors.grey),
        title: Text(
          "QuizJets",
          style: TextStyle(
            fontSize: 19,
            color: Colors.grey,
            fontFamily: Str.POPPINS,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.2,
          ),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        // leading: IconButton(
        //   icon: Icon(
        //     Icons.menu,
        //     //color: Colors.a,
        //   ),
        //   onPressed: () {
        //     // Navigator.of(context).pop();
        //   },
        // ),
      );

  Future initLegalAgreement() async {
    var uid = await GetUserInfo().getCurrentUserID();
    await FirebaseFirestore.instance
        .doc("acceptedLegalAgreement/$uid")
        .get()
        .then((doc) {
      if (doc.exists) {
        accepted = true;
        setState(() {});
        // Navigator.of(context).pushAndRemoveUntil(
        //   MaterialPageRoute(
        //     builder: (context) => LandingPage(),
        //   ),
        //   (route) => false,
        // );
      } else {
        accepted = false;
        setState(() {});
        popUpWidgetScreenUntil(
          context,
          LegalPage(),
        );
      }
    });
  }
}
