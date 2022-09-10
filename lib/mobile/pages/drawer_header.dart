import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizjets/export_files.dart';

class MainDrawerHeader extends StatefulWidget {
  final userName;

  MainDrawerHeader({
    this.userName,
  });
  @override
  State<StatefulWidget> createState() => _DrawerHeader();
}

class _DrawerHeader extends State<MainDrawerHeader> {
  String userNameStr = "";
  String userAvatar = "";

  @override
  void initState() {
    initUserInfo();
    super.initState();
  }

  initUserInfo() async {
    userNameStr = await GetUserInfo().getCurrentUserName();
    userAvatar = await GetUserInfo().getCurrentUserAvatar();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User>(context);
    bool loggedIn = user != null;

    return Container(
      margin: EdgeInsets.only(
        left: 35.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 60.0),
          // _userAvatar(
          //   loggedIn,
          // ),
          // SizedBox(height: 35.0),
          // userName(),
          SizedBox(height: 30.0),
        ],
      ),
    );
  }

  Widget _userAvatar(
    loggedIn,
  ) =>
      Visibility(
        visible: loggedIn,
        child: Container(
          margin: EdgeInsets.only(
            top: 10,
            right: MediaQuery.of(context).size.width * .11,
          ),
          height: 85,
          width: 85,
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
                size: 32,
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
        _showLogOutAlertDialog();
      }
    });
  }

  Widget avatar() => new GestureDetector(
        onTap: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => ProfileScreen(),
          //   ),
          // );
        },
        child: SizedBox(
          height: 90.0,
          width: 90.0,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage("$userAvatar"), fit: BoxFit.cover),
              color: Colors.white.withOpacity(.3),
              shape: BoxShape.circle,
            ),
          ),
        ),
      );

  Widget userName() => new Container(
        child: Text(
          "Hello,\nCaptain ${widget.userName}",
          maxLines: 2,
          style: TextStyle(
            fontSize: 17.5,
            //color: Colors.black,
            fontFamily: Str.POPPINS,
            letterSpacing: .7,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.start,
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
            "Are you sure you want\n"
            "to logout? ",
            style: TextStyle(
                fontSize: 15.5,
                color: Colors.grey,
                fontFamily: Str.POPPINS,
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.start,
          ),
          //content: phoneTextField(),
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
                "  CANCEL     \n",
                style: TextStyle(
                    fontSize: 14.5,
                    // color: Colors.black.withOpacity(.5),
                    fontFamily: Str.POPPINS,
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
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
            InkWell(
              onTap: () async {
                //Navigator.of(context).pop();
                // GoogleSignIn googleSignIn = GoogleSignIn();
                //await googleSignIn.signOut();
                await FirebaseAuth.instance.signOut();
                popUpWidgetScreenUntil(
                  context,
                  LoginPage(),
                );
                setState(() {});
              },
              child: new Text(
                "   LOG OUT         \n",
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
