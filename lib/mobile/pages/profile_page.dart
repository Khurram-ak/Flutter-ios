
import 'package:flutter/material.dart';
import 'package:quizjets/export_files.dart';


class ProfilePage extends StatefulWidget {
  final userName;
  final userEmail;

  ProfilePage({
    this.userEmail,
    this.userName,
  });
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool themeOption = true;
  @override
  Widget build(BuildContext context) {
    return AnimatedTheme(
      duration: Duration(milliseconds: 300),
      data: Theme.of(context),
      child: Scaffold(
        appBar: actionBar(),
        body: Container(
          child: ListView(children: [
            nameTile(),
            emailTile(),
            //passTile(),
            resetDataTile(),
           // resetDataTile2(),
          ]),
        ),
      ),
    );
  }


  Widget actionBar() => AppBar(
        iconTheme: new IconThemeData(color: Colors.grey),
        title: Column(
          children: [
            Text(
              "Profile",
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
                fontFamily: Str.POPPINS,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.2,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            //color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      );

  Widget nameTile() => Container(
        child: ListTile(
          onTap: () {
            //Navigator.of(context).pop();
          },
          leading: Icon(
            FontAwesomeIcons.user,
            //color: Colors.black,
            size: 17,
          ),
          title: Text(
            "${widget.userName}",
            style: TextStyle(
                fontSize: 16,
                //color: Colors.black,
                fontFamily: Str.POPPINS,
                letterSpacing: .9,
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.start,
          ),
          // subtitle: Text(
          //   'Change User Name?',
          //   style: TextStyle(
          //       fontSize: 12,
          //       color: Colors.grey,
          //       fontFamily: Str.POPPINS,
          //       fontWeight: FontWeight.w600),
          //   textAlign: TextAlign.start,
          // ),
        ),
      );

  Widget emailTile() => Container(
        child: ListTile(
          onTap: () {
            //Navigator.of(context).pop();
          },
          leading: Icon(
            FontAwesomeIcons.envelope,
            //color: Colors.black,
            size: 17,
          ),
          title: Text(
            "${widget.userEmail}",
            style: TextStyle(
                fontSize: 16,
                //color: Colors.black,
                fontFamily: Str.POPPINS,
                letterSpacing: .9,
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.start,
          ),
          // subtitle: Text(
          //   'Change Email Address?',
          //   style: TextStyle(
          //       fontSize: 12,
          //       color: Colors.grey,
          //       fontFamily: Str.POPPINS,
          //       fontWeight: FontWeight.w600),
          //   textAlign: TextAlign.start,
          // ),
        ),
      );

  Widget resetDataTile() => Container(
        child: ListTile(
          onTap: () {
            _showOptionDialog();
            //_showNNAAlertDialog();
            //Navigator.of(context).pop();
          },
          leading: Icon(
            FontAwesomeIcons.eraser,
            //color: Colors.black,
            size: 17,
          ),
          title: Text(
            "Reset Data",
            style: TextStyle(
                fontSize: 16,
                //color: Colors.black,
                fontFamily: Str.POPPINS,
                letterSpacing: .9,
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.start,
          ),
          subtitle: Text(
            'Clear all data history & reset to default',
            style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
                fontFamily: Str.POPPINS,
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.start,
          ),
        ),
      );

      Widget resetDataTile2() => Container(
        child: ListTile(
          onTap: () {
            _showCLEVELAlertDialog();
            //Navigator.of(context).pop();
          },
          leading: Icon(
            FontAwesomeIcons.eraser,
            //color: Colors.black,
            size: 17,
          ),
          title: Text(
            "Reset Confidence Level",
            style: TextStyle(
                fontSize: 16,
                //color: Colors.black,
                fontFamily: Str.POPPINS,
                letterSpacing: .9,
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.start,
          ),
          subtitle: Text(
            'Clear all data history & reset to default',
            style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
                fontFamily: Str.POPPINS,
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.start,
          ),
        ),
      );

  Widget passTile() => Container(
        child: ListTile(
          onTap: () {
            //Navigator.of(context).pop();
          },
          leading: Icon(
            FontAwesomeIcons.lock,
            //color: Colors.black,
            size: 17,
          ),
          title: Text(
            "PASSWORD",
            style: TextStyle(
                fontSize: 16,
                //color: Colors.black,
                fontFamily: Str.POPPINS,
                letterSpacing: .9,
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.start,
          ),
          subtitle: Text(
            'Change Password?',
            style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
                fontFamily: Str.POPPINS,
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.start,
          ),
        ),
      );

  void _showNNAAlertDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return alert dialog object
        return AlertDialog(
          //backgroundColor: Colors.white,
          title: new Text(
            "Reset Never Ask Again ",
            style: TextStyle(
                fontSize: 15.5,
                color: Colors.grey,
                fontFamily: Str.POPPINS,
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          content: Text(
            "Confirm Resetting All Never Ask Again?  ",
            style: TextStyle(
                fontSize: 14.5,
                color: Colors.grey,
                fontFamily: Str.POPPINS,
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
                // popUpWidgetScreenUntil(
                //     context,
                //     LandingPage(
                //       currentTab: 0,
                //     ));
              },
              child: new Text(
                "  NO     \n",
                style: TextStyle(
                    fontSize: 14.5,
                    //color: Colors.black.withOpacity(.5),
                    fontFamily: Str.POPPINS,
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ),

            Text(
                "               ",
                style: TextStyle(
                    fontSize: 14.5,
                    color: Color(0xFF007EC7),
                    fontFamily: Str.POPPINS,
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            InkWell(
              onTap: () async {
                // Navigator.of(context).pop();
                initResetNNA();
              },
              child: new Text(
                "   YES          \n",
                style: TextStyle(
                    fontSize: 14.5,
                    color: Color(0xFF007EC7),
                    fontFamily: Str.POPPINS,
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        );
      },
    );
  }

  void _showCLEVELAlertDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return alert dialog object
        return AlertDialog(
          //backgroundColor: Colors.white,
          title: new Text(
            "Reset Confidence Levels ",
            style: TextStyle(
                fontSize: 15.5,
                color: Colors.grey,
                fontFamily: Str.POPPINS,
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          content: Text(
            "Confirm Resetting All Confidence Levels?  ",
            style: TextStyle(
                fontSize: 14.5,
                color: Colors.grey,
                fontFamily: Str.POPPINS,
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
                // popUpWidgetScreenUntil(
                //     context,
                //     LandingPage(
                //       currentTab: 0,
                //     ));
              },
              child: new Text(
                "  NO     \n",
                style: TextStyle(
                    fontSize: 14.5,
                    //color: Colors.black.withOpacity(.5),
                    fontFamily: Str.POPPINS,
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ),

            Text(
                "               ",
                style: TextStyle(
                    fontSize: 14.5,
                    color: Color(0xFF007EC7),
                    fontFamily: Str.POPPINS,
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            InkWell(
              onTap: () async {
                // Navigator.of(context).pop();
                initResetCLEVEL();
              },
              child: new Text(
                "   YES          \n",
                style: TextStyle(
                    fontSize: 14.5,
                    color: Color(0xFF007EC7),
                    fontFamily: Str.POPPINS,
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        );
      },
    );
  }

  initResetNNA() async {
    var uid = await GetUserInfo().getCurrentUserID();
    FirebaseFirestore.instance
        .collection("neverAskAgain")
        .doc("$uid")
        .collection("levelCollection")
        .get()
        .then((value) {
      for (DocumentSnapshot ds in value.docs) {
        ds.reference.delete();
      }
      Navigator.of(context).pop();
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
    });
   
  }

  initResetCLEVEL() async {
    var uid = await GetUserInfo().getCurrentUserID();
    FirebaseFirestore.instance
        .collection("confidenceLevel")
        .doc("$uid")
        .collection("levelCollection")
        .get()
        .then((value) {
      for (DocumentSnapshot ds in value.docs) {
        ds.reference.delete();
      }
      addToConfidenceLevel();
      Navigator.of(context).pop();
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
    });
  }

  void _showOptionDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return alert dialog object
        return AlertDialog(
          //backgroundColor: Colors.white,
          title: new Text(
            "Reset Data ",
            style: TextStyle(
                fontSize: 15.5,
                color: Colors.grey,
                fontFamily: Str.POPPINS,
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          
          actions: <Widget>[
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
                // popUpWidgetScreenUntil(
                //     context,
                //     LandingPage(
                //       currentTab: 0,
                //     ));
                _showCLEVELAlertDialog();
              },
              child: new Text(
                "  Reset Confidence Levels     \n",
                style: TextStyle(
                    fontSize: 14.5,
                    color: Color(0xFF007EC7),
                    fontFamily: Str.POPPINS,
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ),

            InkWell(
              onTap: () async {
                 Navigator.of(context).pop();
                _showNNAAlertDialog();
              },
              child: new Text(
                "   Reset Never Ask Again        \n",
                style: TextStyle(
                    fontSize: 14.5,
                    color: Color(0xFF007EC7),
                    fontFamily: Str.POPPINS,
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ),

            InkWell(
              onTap: () async {
                 Navigator.of(context).pop();
              },
              child: new Text(
                "   Cancel       \n",
                style: TextStyle(
                    fontSize: 14.5,
                    color: Color(0xFF007EC7),
                    fontFamily: Str.POPPINS,
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        );
      },
    );
  }
}
