import 'package:flutter/material.dart';
import 'package:quizjets/export_files.dart';

class SettingsPage extends StatefulWidget {
  static const String route = '/settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainNavigationDrawer(),
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: HomeBar(),
        ),
      body: Container(
        child: ListView(
          children: [
            SizedBox(
              height: 120.0,
            ),
            Container(
              margin: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * .2,
                left: MediaQuery.of(context).size.width * .11,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  headingStr(),
                  // _divider(),

                  _divider(),

                 
                  settings(),
                  _divider(),
                  deleteAcc(),
                  _divider(),
                  resetDataTile(),
 
                ],
              ),
            ),
            SizedBox(
              height: 80.0,
            ),
            FooterView(),
          ],
        ),
      ),
    );
  }

  Widget headingStr() => Container(
        margin: EdgeInsets.symmetric(
          vertical: 0.0,
        ),
        child: RichText(
          textAlign: TextAlign.start,
          text: new TextSpan(
            style: new TextStyle(
              height: 1.2,
              letterSpacing: .6,
            ),
            children: <TextSpan>[
              new TextSpan(
                text: 'Settings\n\n',
                style: TextStyle(
                  fontFamily: Str.POPPINS,
                  fontWeight: FontWeight.w500,
                  //wordSpacing: 2.5,
                  letterSpacing: .6,
                  color: Colors.black.withOpacity(.9),
                  fontSize: 35.0,
                ),
              ),
              // new TextSpan(
              //   text:
              //       'Your account details are listed below. For security reasons, some of this details are hidden.\n\n\n\n\n',
              //   style: TextStyle(
              //     fontFamily: Str.POPPINS,
              //     fontWeight: FontWeight.w500,
              //     //wordSpacing: 2.5,
              //     letterSpacing: .4,
              //     color: Colors.black.withOpacity(.7),
              //     fontSize: 16.0,
              //   ),
              // ),
            ],
          ),
        ),
      );

  Widget _divider() => Container(
        margin: EdgeInsets.symmetric(
          vertical: 35.0,
        ),
        child: Divider(
          height: 1,
          color: Colors.black.withOpacity(.1),
        ),
      );

  Widget resetDataTile() => Container(
        child: ListTile(
          hoverColor: Colors.transparent,
          onTap: () {
            _showOptionDialog();
          },
          leading: Icon(
            FontAwesomeIcons.eraser,
            //color: Colors.black,
            size: 24,
          ),
          title: Text(
            "Reset Data",
            style: TextStyle(
                fontSize: 18.0,
                //color: Colors.black,
                fontFamily: Str.POPPINS,
                letterSpacing: .9,
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.start,
          ),
          subtitle: Text(
            'Clear all data history & reset to default',
            style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
                fontFamily: Str.POPPINS,
                fontWeight: FontWeight.w500),
            textAlign: TextAlign.start,
          ),
        ),
      );

  Widget themeTile() => Container(
        child: ListTile(
          onTap: () {
            _showThemeAlertDialog();
          },
          leading: Icon(
            FontAwesomeIcons.lightbulb,
            //color: Colors.black,
            size: 24,
          ),
          title: Text(
            "Theme",
            style: TextStyle(
                fontSize: 18,
                //color: Colors.black,
                fontFamily: Str.POPPINS,
                letterSpacing: .9,
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.start,
          ),
          // subtitle: Text(
          //   '${AdaptiveTheme.of(context).mode.name.toUpperCase()} MODE',
          //   style: TextStyle(
          //       fontSize: 16,
          //       color: Colors.grey,
          //       fontFamily: Str.POPPINS,
          //       fontWeight: FontWeight.w500),
          //   textAlign: TextAlign.start,
          // ),
        ),
      );

  void _showThemeAlertDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return alert dialog object
        return AlertDialog(
          //backgroundColor: Colors.white,
          title: new Text(
            "Change Theme ",
            style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
                fontFamily: Str.POPPINS,
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          //content: phoneTextField(),
          actions: <Widget>[
            GestureDetector(
              onTap: () {
                AdaptiveTheme.of(context).setLight();
                Navigator.of(context).pop();
                // popUpWidgetScreenUntil(
                //     context,
                //     LandingPage(
                //       currentTab: 0,
                //     ));
              },
              child: new Text(
                "  LIGHT MODE \n",
                style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF007EC7),
                    fontFamily: Str.POPPINS,
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ),
            GestureDetector(
              onTap: () async {
                AdaptiveTheme.of(context).setDark();
                Navigator.of(context).pop();
              },
              child: new Text(
                "  DARK MODE      \n",
                style: TextStyle(
                    fontSize: 16,
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
                fontSize: 19.5,
                color: Colors.grey,
                fontFamily: Str.POPPINS,
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          
          actions: <Widget>[
            MouseRegion(
    cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
            
                  _showCLEVELAlertDialog();
                },
                child: new Text(
                  "  Reset Confidence Levels     \n",
                  style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF007EC7),
                      fontFamily: Str.POPPINS,
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            MouseRegion(
    cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () async {
                  Navigator.of(context).pop();
                  _showNNAAlertDialog();
                },
                child: new Text(
                  "   Reset Never Ask Again        \n",
                  style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF007EC7),
                      fontFamily: Str.POPPINS,
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            MouseRegion(
    cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () async {
                  Navigator.of(context).pop();
                },
                child: new Text(
                  "   Cancel       \n",
                  style: TextStyle(
                      fontSize: 16,
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
                fontSize: 19,
                color: Colors.grey,
                fontFamily: Str.POPPINS,
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          content: Text(
            "Confirm Resetting All Never Ask Again?  ",
            style: TextStyle(
                fontSize: 17,
                color: Colors.grey,
                fontFamily: Str.POPPINS,
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            MouseRegion(
    cursor: SystemMouseCursors.click,
              child: GestureDetector(
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
                      fontSize: 17,
                      //color: Colors.black.withOpacity(.5),
                      fontFamily: Str.POPPINS,
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
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
            MouseRegion(
    cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () async {
                  // Navigator.of(context).pop();
                  initResetNNA();
                },
                child: new Text(
                  "   YES          \n",
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
                fontSize: 19.5,
                color: Colors.grey,
                fontFamily: Str.POPPINS,
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            MouseRegion(
    cursor: SystemMouseCursors.click,
              child: GestureDetector(
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
                      fontSize: 17,
                      //color: Colors.black.withOpacity(.5),
                      fontFamily: Str.POPPINS,
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
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
            MouseRegion(
    cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () async {
                  // Navigator.of(context).pop();
                  initResetCLEVEL();
                },
                child: new Text(
                  "   YES          \n",
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
              fontSize: 17,
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

  addToConfidenceLevel() async {
    var quizJets = await getQuestions();
    for (var item in quizJets) {
      var userId = await GetUserInfo().getCurrentUserID();
      FirebaseFirestore.instance.collection('confidenceLevel').doc(userId).set({
          'dummyField': '',
        });
      await FirebaseFirestore.instance
          .collection('confidenceLevel')
          .doc("$userId")
          .collection('levelCollection')
          .doc("${item.id}")
          .set({
        'level': 'LOW',
        'question_id': item.id,
        'level_id': item.id,
        'subject': item.filter_id,
        'filter_id': item.filter_id,
        'question': item.question,
        'ans_1': item.ans_1,
        'ans_2': item.ans_2,
        'ans_3': item.ans_3,
        'ans_4': item.ans_4,
        'mediaType': item.mediaType,
        'mediaUrl': item.mediaUrl,
        'id': item.id,
        'active': true,
      });
    }
  }

  Future getQuestions() async {
    List<Question> questionList = [];
    await FirebaseFirestore.instance
        .collection('quizjetsQuestions')
        .doc('000')
        .collection('questionsCollection')
        .get()
        .then((value) {
      questionList.clear();
      //questionsList.clear();
      for (var item in value.docs) {
        Question questions = Question(
          item["question"],
          item["id"],
          item["ans_1"],
          item["ans_2"],
          item["ans_3"],
          item["ans_4"],
          item["mediaType"],
          item["mediaUrl"],
          item["active"],
          item["subject"],
          item["filter_id"],
        );

        questionList.add(questions);
        questionList.shuffle();
      }
      //initVideoUrl(questionsList);
    });

    return questionList.toSet().toList();
  }

  Widget settings() => Container(
        child: ListTile(
          hoverColor: Colors.transparent,
          onTap: () {
            
            Navigator.of(context).pushNamed(EditProfilePage.route);
          },
          leading: Icon(
            FontAwesomeIcons.cog,
            //color: Colors.black,
            size: 24,
          ),
          title: Text(
            "Edit Profile",
            style: TextStyle(
                fontSize: 18,
                //color: Colors.black,
                fontFamily: Str.POPPINS,
                letterSpacing: .9,
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.start,
          ),
          // subtitle: Text(
          //   '${AdaptiveTheme.of(context).mode.name.toUpperCase()} MODE',
          //   style: TextStyle(
          //       fontSize: 16,
          //       color: Colors.grey,
          //       fontFamily: Str.POPPINS,
          //       fontWeight: FontWeight.w500),
          //   textAlign: TextAlign.start,
          // ),
        ),
      );

  Widget deleteAcc() => Container(
        child: ListTile(
          hoverColor: Colors.transparent,
          onTap: () {
            _showLogOutAlertDialog();
          },
          leading: Icon(
            FontAwesomeIcons.trash,
            //color: Colors.black,
            size: 24,
          ),
          title: Text(
            "Delete account",
            style: TextStyle(
                fontSize: 18,
                //color: Colors.black,
                fontFamily: Str.POPPINS,
                letterSpacing: .9,
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.start,
          ),
          // subtitle: Text(
          //   '${AdaptiveTheme.of(context).mode.name.toUpperCase()} MODE',
          //   style: TextStyle(
          //       fontSize: 16,
          //       color: Colors.grey,
          //       fontFamily: Str.POPPINS,
          //       fontWeight: FontWeight.w500),
          //   textAlign: TextAlign.start,
          // ),
        ),
      );

  void _showLogOutAlertDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return alert dialog object
        return AlertDialog(
          //backgroundColor: Colors.white,
          title: new Text(
            "Are you sure you want to\n"
            "delete this account? ",
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
                  var userId = await GetUserInfo().getCurrentUserID();
                  FirebaseFirestore.instance
                      .collection("userBase")
                      .doc(userId)
                      .delete()
                      .then(
                    (value) async {
                      await FirebaseAuth.instance.currentUser.delete();
                      Navigator.of(context).pushNamed(HomePage.route);
                    },
                  );
                },
                child: new Text(
                  "   DELETE         \n",
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.red.withOpacity(.8),
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
}
