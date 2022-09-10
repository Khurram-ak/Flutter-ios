import 'package:flutter/material.dart';
import 'package:quizjets/export_files.dart';
import 'package:quizjets/widgets/login_bar.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LoginPage extends StatefulWidget {
  static const String route = '/login';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool showLoginLayout = false;
  bool showSettingsLayout = false;
  bool showLoader = false;

  static const your_client_id =
      '442089617059066'; //repalce 000000000000 with your fb Id
  static const your_redirect_url =
      'https://quizjets.firebaseapp.com/__/auth/handler';

  var scaffoldKey = GlobalKey<ScaffoldState>();
  bool showPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: LoginBar(),
      ),
      drawer: MainNavigationDrawer(),
      body: ListView(
        children: [
          loginLayout(),
          FooterView(),
        ],
      ),
    );
  }

  Widget inputField(var controler, String hintStr) => Container(
        // margin: EdgeInsets.symmetric(
        //   horizontal: 30.0,
        // ),
        child: TextField(
          controller: controler,
          keyboardType: TextInputType.emailAddress,
          // minLines: 10,
          //maxLength: 20,
          autocorrect: true,
          style: TextStyle(
            fontSize: 14.0,
            color: Colors.grey,
            fontFamily: Str.POPPINS,
          ),
          decoration: InputDecoration(
            hintText: hintStr,
            filled: true,
            labelText: hintStr,
            counterStyle: TextStyle(
              color: Colors.grey,
              fontFamily: Str.POPPINS,
            ),
            //fillColor: Color(0xFFDBEDFF),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(6.0)),
              borderSide: BorderSide(color: Colors.grey),
            ),
            prefixIcon: const Icon(
              Icons.email_outlined,
              color: Colors.grey,
              size: 21.0,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(6.0)),
              borderSide: BorderSide(color: Colors.grey),
            ),
            hintStyle: TextStyle(
              fontSize: 13.0,
              color: Colors.grey,
              fontFamily: Str.POPPINS,
            ),
            labelStyle: TextStyle(
              fontSize: 14.0,
              color: Colors.grey,
              fontFamily: Str.POPPINS,
            ),
          ),
        ),
      );

  Widget passInputField(var controler) => Container(
        // margin: EdgeInsets.symmetric(
        //   horizontal: 30.0,
        // ),
        child: TextField(
          textInputAction: TextInputAction.go,
          onSubmitted: (value) {
            if (emailController.text.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Color(0xFF007EC7),
                  content: Text(
                    "Please Enter Email Address!",
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

              return;
            }
            showLoader = true;
            FirebaseAuth.instance
                .signInWithEmailAndPassword(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim())
                .then((res) {
              showLoader = false;
              //locator<NavigationService>().navigateTo(HomeRoute);
              Navigator.of(context).pushNamed(HomePage.route);
            }).catchError(onError);
          },
          controller: controler,
          // minLines: 10,
          //maxLength: 20,
          obscureText: showPassword,
          autocorrect: false,
          style: TextStyle(
            fontSize: 14.0,
            color: Colors.grey,
            fontFamily: Str.POPPINS,
          ),
          decoration: InputDecoration(
            hintText: '********',
            filled: true,
            labelText: 'Password',
            counterStyle: TextStyle(
              color: Colors.grey,
              fontFamily: Str.POPPINS,
            ),
            //fillColor: Color(0xFFDBEDFF),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(6.0)),
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(6.0)),
              borderSide: BorderSide(color: Colors.grey),
            ),
            prefixIcon: const Icon(
              Icons.lock_outline,
              color: Colors.grey,
              size: 21.0,
            ),
            suffixIcon: IconButton(
                icon: Icon(
                  showPassword ? Icons.visibility_off : Icons.visibility,
                  color: Colors.grey,
                ),
                onPressed: onPassChanged),
            hintStyle: TextStyle(
              fontSize: 13.0,
              color: Colors.grey,
              fontFamily: Str.POPPINS,
            ),
            labelStyle: TextStyle(
              fontSize: 14.0,
              color: Colors.grey,
              fontFamily: Str.POPPINS,
            ),
          ),
        ),
      );

  Widget loginBtn() => MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            if (emailController.text.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Color(0xFF007EC7),
                  content: Text(
                    "Please Enter Email Address!",
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

              return;
            }
            showLoader = true;
            FirebaseAuth.instance
                .signInWithEmailAndPassword(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim())
                .then((res) {
              User user = FirebaseAuth.instance.currentUser;
              FirebaseFirestore.instance
                  .collection("userBase")
                  .doc(user.uid)
                  .get()
                  .then((doc) {
                if (doc.exists) {
                  FirebaseFirestore.instance
                      .collection('userBase')
                      .doc(user.uid)
                      .snapshots()
                      .listen((DocumentSnapshot ds) {
                    Map<String, dynamic> data =
                        ds.data() as Map<String, dynamic>;
                    if (data['blocked']) {
                      FirebaseAuth.instance.signOut();
                      _showBlockAlertDialog();
                    } else {
                      showLoader = false;
                      Navigator.of(context).pushNamed(HomePage.route);
                    }
                  });
                } else {
                  FirebaseAuth.instance.signOut();
                  user.delete();
                  _showAlertDialog();
                }
              });
            }).catchError(onError);
          },
          child: Container(
            height: 50.0,
            width: 250.0,
            padding: EdgeInsets.only(right: 20.0, left: 20.0),
            margin: EdgeInsets.symmetric(
              horizontal: 30.0,
              vertical: 10.0,
            ),
            decoration: new BoxDecoration(
              color: Color(0xFF007EC7),
              border: Border.all(
                width: 0.0,
                color: Color(0xFF007EC7),
              ),
              borderRadius: new BorderRadius.all(
                const Radius.circular(24.0),
              ),
            ),
            child: Center(
              child: Text(
                'LOGIN',
                style: TextStyle(
                  fontSize: 14.5,
                  color: Colors.white,
                  fontFamily: Str.POPPINS,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      );

  void _showAlertDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return alert dialog object
        return AlertDialog(
          //backgroundColor: Colors.white,
          title: new Text(
            "This account no longer exists\n"
            "it might have been deleted ",
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
                  Navigator.of(context).pushNamed(GetStartedPage.route);
                },
                child: new Text(
                  "  SIGN UP     \n",
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
                },
                child: new Text(
                  "   OKAY         \n",
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

  void _showBlockAlertDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return alert dialog object
        return AlertDialog(
          //backgroundColor: Colors.white,
          title: new Text(
            "You have been blocked from\n"
            "using QuizJets services. ",
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
                },
                child: new Text(
                  "   OKAY         \n",
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

  Widget alreadyHveAccountStr() => MouseRegion(
        cursor: SystemMouseCursors.click,
        child: new GestureDetector(
          onTap: () {
            //locator<NavigationService>().navigateTo(GetStartedRoute);
            Navigator.of(context).pushNamed(GetStartedPage.route);
          },
          child: RichText(
            textAlign: TextAlign.center,
            text: new TextSpan(
              style: new TextStyle(
                height: 1.0,
              ),
              children: <TextSpan>[
                new TextSpan(
                  text: 'Don\'t have an Account? ',
                  style: TextStyle(
                    fontFamily: Str.POPPINS,
                    fontWeight: FontWeight.w500,
                    wordSpacing: 1.5,
                    color: Colors.grey,
                    fontSize: 16.5,
                  ),
                ),
                new TextSpan(
                    text: 'Get Started',
                    style: TextStyle(
                      fontFamily: Str.POPPINS,
                      fontWeight: FontWeight.w600,
                      wordSpacing: 2.5,
                      color: Colors.grey,
                      fontSize: 16.5,
                    )),
              ],
            ),
          ),
        ),
      );

  Widget horDivider() => Container(
        margin: EdgeInsets.symmetric(
          vertical: 15.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Divider(
                thickness: 1,
                color: Colors.grey.withOpacity(.5),
              ),
            ),
            SizedBox(width: 10),
            Text(
              'or',
              style: TextStyle(
                color: Colors.grey,
                fontFamily: Str.POPPINS,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Divider(
                thickness: 1,
                color: Colors.grey.withOpacity(.5),
              ),
            ),
          ],
        ),
      );

  onPassChanged() {
    if (mounted)
      setState(() {
        showPassword = !showPassword;
      });
  }

  onError(e) {
    //  showProgress(false, "", context);
    showLoader = false;
    setState(() {});
    print('$e');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Color(0xFF007EC7),
        content: Text(
          "${e.toString().replaceAll('[firebase_auth/wrong-password]', '').replaceAll('[firebase_auth/weak-password]', '').replaceAll('[firebase_auth/too-many-requests]', '').replaceAll('[firebase_auth/user-not-found]', '')}",
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontFamily: Str.POPPINS,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.2,
          ),
        ),
      ),
    );
    return;
  }

  Widget loginLayout() => ResponsiveBuilder(
        builder: (context, sizingInformation) => Container(
          padding: EdgeInsets.symmetric(
            vertical: 120,
            horizontal: sizingInformation.deviceScreenType ==
                    DeviceScreenType.mobile
                ? 30
                : sizingInformation.deviceScreenType == DeviceScreenType.tablet
                    ? MediaQuery.of(context).size.width * .25
                    : MediaQuery.of(context).size.width * .35,
          ),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // fbBtn(),
              SizedBox(
                height: 20.0,
              ),
              //horDivider(),
              SizedBox(
                height: 20.0,
              ),
              inputField(emailController, 'Email Address'),
              SizedBox(
                height: 20.0,
              ),
              passInputField(
                passwordController,
              ),
              SizedBox(
                height: 10.0,
              ),
              loginBtn(),
              SizedBox(
                height: 25.0,
              ),

              alreadyHveAccountStr(),
              SizedBox(
                height: 15.0,
              ),
              forgotPassStr(),
              // SizedBox(height: 15),
              //orContinueUsingStr,

              // fbBtn(),
              // googleBtn(),
              // appleBtn(),
              SizedBox(
                height: 50.0,
              ),
            ],
          ),
        ),
      );

  Widget forgotPassStr() => MouseRegion(
        cursor: SystemMouseCursors.click,
        child: new GestureDetector(
          onTap: () =>
              Navigator.of(context).pushNamed(ChangePasswordPage.route),
          child: RichText(
            textAlign: TextAlign.center,
            text: new TextSpan(
              style: new TextStyle(
                height: 1.5,
              ),
              children: <TextSpan>[
                new TextSpan(
                    text: 'Forgot Password? ',
                    style: TextStyle(
                      fontFamily: Str.POPPINS,
                      fontWeight: FontWeight.w500,
                      wordSpacing: 1.5,
                      color: Colors.black.withOpacity(.8),
                      fontSize: 15.5,
                    )),
              ],
            ),
          ),
        ),
      );

  Widget fbBtn() => MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () async {},
          child: Container(
            height: 60.0,
            //width: 100.0,
            padding: EdgeInsets.only(right: 20.0, left: 20.0),
            margin: EdgeInsets.only(
              top: 15.0,
            ),
            decoration: new BoxDecoration(
              border: Border.all(
                width: 1.0,
                color: Colors.grey.withOpacity(.6),
              ),
              borderRadius: new BorderRadius.all(
                const Radius.circular(8.0),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  FontAwesomeIcons.facebook,
                  color: Colors.blueAccent,
                  size: 30.0,
                ),
                SizedBox(
                  width: 35.0,
                ),
                Text(
                  'Continue with Facebook',
                  style: TextStyle(
                      color: Colors.grey,
                      fontFamily: Str.POPPINS,
                      fontSize: 16.5,
                      fontWeight: FontWeight.w500,
                      letterSpacing: .8),
                ),
              ],
            ),
          ),
        ),
      );
}
