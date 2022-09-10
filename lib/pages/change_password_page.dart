import 'package:flutter/material.dart';
import 'package:quizjets/export_files.dart';

class ChangePasswordPage extends StatefulWidget {
  static const String route = '/change_password';

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePasswordPage> {
  var emailController = TextEditingController();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainNavigationDrawer(),
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: HomeBar(),
        ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 30.0),
        child: ListView(
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height * 0.16),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 20,
                horizontal: MediaQuery.of(context).size.width * .35,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  gettingStartedStr,
                  SizedBox(height: 3),
                  gettingStartedSUBStr,
                  SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                  emailBadgeStr,
                  emailTextField(),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            signUpBtn(),
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            SizedBox(height: MediaQuery.of(context).size.height * 0.07),
          ],
        ),
      ),
    );
  }

  Widget emailTextField() => new TextField(
        autocorrect: true,
        controller: emailController,
        decoration: InputDecoration(
          hintText: 'Type Email Address',
          hintStyle: TextStyle(
            fontSize: 13.0,
            fontFamily: Str.POPPINS,
          ),
          labelStyle: TextStyle(
            fontSize: 13.0,
            fontFamily: Str.POPPINS,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black38),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.purple),
          ),
          prefixIcon: const Icon(
            Icons.mail_outline,
            color: Colors.black,
            size: 21.0,
          ),
        ),
      );

  var gettingStartedStr = new Text(
    "Forgot Password",
    style: TextStyle(
        fontSize: 29.5,
        color: Colors.black.withOpacity(.8),
        fontFamily: Str.POPPINS,
        fontWeight: FontWeight.w600),
    textAlign: TextAlign.center,
  );

  var gettingStartedSUBStr = new Text(
    "Dont worry, we got your back!",
    style: TextStyle(
        fontSize: 13.5,
        color: Colors.black.withOpacity(.8),
        fontFamily: Str.POPPINS,
        fontWeight: FontWeight.w500),
    textAlign: TextAlign.center,
  );

  var emailBadgeStr = new Text(
    "Email",
    style: TextStyle(
        fontSize: 14.0,
        color: Colors.black38,
        fontFamily: Str.POPPINS,
        fontWeight: FontWeight.w500),
    textAlign: TextAlign.center,
  );

  Widget signUpBtn() => MouseRegion(
    cursor: SystemMouseCursors.click,
    child: GestureDetector(
          onTap: () {
            ResetPassword(context: context)
                .loginUser(emailController, scaffoldKey);
          },
          child: Container(
            margin: EdgeInsets.symmetric(
            //vertical: 20,
            horizontal: MediaQuery.of(context).size.width * .4,
          ),
            width: 190,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              color: QuizJetsTheme.quizJetsBlue,
            ),
            padding: EdgeInsets.symmetric(
              vertical: 15.0
            ),
            child: Center(
              child: Text(
                "VERIFY",
                style: TextStyle(
                    fontSize: 17.0,
                    color: Colors.white,
                    fontFamily: Str.POPPINS,
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
  );
}
