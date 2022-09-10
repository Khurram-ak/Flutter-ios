import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../export_files.dart';

class MainNavigationDrawer extends StatefulWidget {
  final userName;
  final userFName;
  final userEmail;

  MainNavigationDrawer({
    this.userName,
    this.userEmail,
    this.userFName,
  });
  @override
  _MainNavigationDrawerState createState() => _MainNavigationDrawerState();
}

class _MainNavigationDrawerState extends State<MainNavigationDrawer> {
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User>(context);
    bool loggedIn = user != null;
    return Drawer(
      
      child: Container(
        color: QuizJetsTheme.quizJetsBlue,
        child: Stack(
          children: [
            ListView(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                MainDrawerHeader(
                  userName: widget.userFName,
                ),
                DrawerBody(
                  userName: widget.userName,
                  userEmail: widget.userEmail,
                ),
              ],
            ),
            Visibility(
              visible: !loggedIn,
              child: Positioned(
                bottom: 0.0,
                child: Column(children: [
                  Container(
                    height: 1,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.grey,
                  ),
                  Container(
                    height: 60.0,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            //_showLogOutAlertDialog();
                            Navigator.of(context)
                                    .pushNamed(LoginPage.route);
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.login_outlined,
                                  color: Colors.white,
                                ),
                                onPressed: () {},
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Login",
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                    fontFamily: Str.POPPINS,
                                    fontWeight: FontWeight.w600),
                                textAlign: TextAlign.start,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ),
            Visibility(
              visible: loggedIn,
              child: Positioned(
                bottom: 0.0,
                child: Column(children: [
                  Container(
                    height: 1,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.grey,
                  ),
                  Container(
                    height: 60.0,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            _showSignOutAlertDialog();
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.login_outlined,
                                  color: Colors.white,
                                ),
                                onPressed: () {},
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Log Out",
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                    fontFamily: Str.POPPINS,
                                    fontWeight: FontWeight.w600),
                                textAlign: TextAlign.start,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ),
            Positioned(
              right: 10.0,
              top: 30.0,
              child: IconButton(
                icon: Icon(
                  Icons.clear,
                  color: Colors.white,
                  size: 22.0,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
      ),
    );
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

  
}
