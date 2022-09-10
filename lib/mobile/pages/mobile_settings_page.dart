import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:quizjets/export_files.dart';


class MobileSettingsPage extends StatefulWidget {
  final userName;
  final userEmail;

  MobileSettingsPage({
    this.userEmail,
    this.userName,
  });
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<MobileSettingsPage> {
  bool themeOption = true;
  @override
  Widget build(BuildContext context) {
    return AnimatedTheme(
      duration: Duration(milliseconds: 300),
      data: Theme.of(context),
      child: Scaffold(
        appBar: actionBar(),
        body: Container(
          child: ListView(
            children:[
              //themeTile(),
              profileTile(),
            ]
          ),
        ),
      ),
    );
  }

  Widget actionBar() => AppBar(
        iconTheme: new IconThemeData(color: Colors.grey),
        title: Column(children: [
          Text(
            "Settings",
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey,
              fontFamily: Str.POPPINS,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
            ),
            textAlign: TextAlign.center,
          ),
        ],),
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

      
      Widget profileTile() => Container(
        child: ListTile(
          onTap: () {
            Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProfilePage(
                userName: widget.userName,
                userEmail: widget.userEmail,
              ),
            ),
          );
          },
          leading: Icon(
            FontAwesomeIcons.user,
            //color: Colors.black,
            size: 17,
          ),
          title: Text(
            'Profile',
            style: TextStyle(
                fontSize: 16,
                //color: Colors.black,
                fontFamily: Str.POPPINS,
                letterSpacing: .9,
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.start,
          ),
          // subtitle: Text(
          //   "",
          //   style: TextStyle(
          //       fontSize: 12,
          //       color: Colors.grey,
          //       fontFamily: Str.POPPINS,
          //       fontWeight: FontWeight.w600),
          //   textAlign: TextAlign.start,
          // ),
        ),
      );

      Widget themeTile() => Container(
        child: ListTile(
          onTap: () {
            _showThemeAlertDialog();
            //Navigator.of(context).pop();
          },
          leading: Icon(
            FontAwesomeIcons.lightbulb,
            //color: Colors.black,
            size: 17,
          ),
          title: Text(
            "Theme",
            style: TextStyle(
                fontSize: 16,
                //color: Colors.black,
                fontFamily: Str.POPPINS,
                letterSpacing: .9,
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.start,
          ),
          subtitle: Text(
            
            '${AdaptiveTheme.of(context).mode.name.toUpperCase()} MODE',
            style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
                fontFamily: Str.POPPINS,
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.start,
          ),
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
                fontSize: 15.5,
                color: Colors.grey,
                fontFamily: Str.POPPINS,
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          //content: phoneTextField(),
          actions: <Widget>[
            InkWell(
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
                    fontSize: 14.5,
                   color: Color(0xFF007EC7),
                    fontFamily: Str.POPPINS,
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ),
            
            InkWell(
              onTap: () async {
             AdaptiveTheme.of(context).setDark();
             Navigator.of(context).pop();
              },
              child: new Text(
                "  DARK MODE      \n",
                style: TextStyle(
                    fontSize: 14.5,
                    color: Color(0xFF007EC7),
                    fontFamily: Str.POPPINS,
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ),

            // InkWell(
            //   onTap: () async {
            //  AdaptiveTheme.of(context).setSystem();
            //  Navigator.of(context).pop();
            //   },
            //   child: new Text(
            //     " FOLLOW DEVICE THEME    \n",
            //     style: TextStyle(
            //         fontSize: 14.5,
            //         color: Color(0xFF007EC7),
            //         fontFamily: Str.POPPINS,
            //         fontWeight: FontWeight.w600),
            //     textAlign: TextAlign.center,
            //   ),
            // ),
          ],
        );
      },
    );
  }
}
