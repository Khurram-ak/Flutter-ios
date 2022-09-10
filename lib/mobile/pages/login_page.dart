import 'package:flutter/material.dart';
import 'package:quizjets/export_files.dart';
import 'package:responsive_builder/responsive_builder.dart';

class MobileLoginPage extends StatefulWidget {
  @override
  _MobileLoginPageState createState() => _MobileLoginPageState();
}

class _MobileLoginPageState extends State<MobileLoginPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool showLoginLayout = false;
  bool showSettingsLayout = false;
  bool showLoader = false;

  static const your_client_id =
      '442089617059066'; //repalce 000000000000 with your fb Id
  final FirebaseAuth _auth = FirebaseAuth.instance;
  static const your_redirect_url =
      'https://quizjets.firebaseapp.com/__/auth/handler';

  var scaffoldKey = GlobalKey<ScaffoldState>();
  bool showPassword = true;

  final spinkit = SpinKitFadingCircle(
    color: Colors.grey,
    size: 30.0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: actionBar(),
      body: ResponsiveBuilder(
        builder: (context, sizingInformation) => Stack(
          children: [
            loginLayout(
                sizingInformation.deviceScreenType == DeviceScreenType.tablet),
            Visibility(
              visible: showLoader,
              child: spinkit,
            ),
            // bottomBar(),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    // initAuthListener();
  }

  Widget loginLayout(isTablet) => Center(
        child: Container(
          width: isTablet ? 400.0 : MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          child: ListView(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 10.0,
              ),

              SizedBox(
                height: 85,
                child: SvgPicture.asset(
                  'assets/svgs/n_logo.svg',
                ),
              ),
              SizedBox(
                height: 40.0,
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
                height: 15.0,
              ),
              alreadyHveAccountStr(),
              SizedBox(height: 15),
              //orContinueUsingStr,
              horDivider(),
              fbBtn(),
              googleBtn(),
              appleBtn(),
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      );

  //         initAuthListener({Source source = Source.serverAndCache}) async {
  //   User user = FirebaseAuth.instance.currentUser;
  //   bool noUser = user == null;
  //   Future.delayed(Duration(seconds: 1), () async {
  //     showLoader = false;
  //     if (noUser) {
  //       showLoginLayout = true;
  //       setState(() {});
  //     } else {
  //       FirebaseFirestore.instance
  //           .collection("userBase")
  //           .doc(user.uid)
  //           .get()
  //           .then((doc) {
  //         bool noUser = !doc.exists;
  //         if (doc.exists) {
  //           popUpWidgetScreenUntil(
  //               context,
  //               LandingPage());
  //           setState(() {});
  //         } else {
  //           showLoginLayout = true;
  //           setState(() {});
  //         }
  //       }).catchError((e) {
  //         if (source == Source.cache) {
  //           initAuthListener(source: Source.server);
  //         } else {
  //           showLoginLayout = true;
  //           setState(() {});
  //         }
  //       });
  //     }
  //   });
  // }

  Widget actionBar() => AppBar(
        iconTheme: new IconThemeData(color: Colors.grey),
        title: Container(),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        automaticallyImplyLeading: false,
      );

  Widget socialRow() => Container(
        margin: EdgeInsets.symmetric(horizontal: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[facebookBtn(), googleBtn()], //
        ),
      );

  var orContinueUsingStr = new Text(
    "Or continue using",
    style: TextStyle(
        fontSize: 11.5,
        fontFamily: Str.POPPINS,
        wordSpacing: 1.5,
        color: Colors.black38,
        fontWeight: FontWeight.w500),
    textAlign: TextAlign.center,
  );

  Widget inputField(var controler, String hintStr) => Container(
        // margin: EdgeInsets.symmetric(
        //   horizontal: 30.0,
        // ),
        child: TextField(
          controller: controler,
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

  Widget loginBtn() => InkWell(
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
            showLoader = false;
            //checkExist();
            popUpWidgetScreenUntil(context, LandingPage());
          }).catchError(onError);
        },
        child: Container(
          height: 50.0,
          //width: 100.0,
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
      );

  Widget alreadyHveAccountStr() => new GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SignUpPage(),
          ),
        );
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
                fontSize: 13.5,
              ),
            ),
            new TextSpan(
                text: 'Sign Up',
                style: TextStyle(
                  fontFamily: Str.POPPINS,
                  fontWeight: FontWeight.w600,
                  wordSpacing: 2.5,
                  color: Colors.grey,
                  fontSize: 13.5,
                )),
          ],
        ),
      ));

  Widget facebookBtn() => InkWell(
        onTap: () async {
          // await FireBaseAuthProvider().loginWithFacebook();
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3.0),
            // color: Colors.white,
          ),
          padding: EdgeInsets.symmetric(
              // horizontal: MediaQuery.of(context).size.width * 0.24,
              vertical: 7.0),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(
                  FontAwesomeIcons.facebook,
                  color: Colors.blue,
                  size: 17.0,
                ),
                SizedBox(width: 5.0),
                Text(
                  "Facebook",
                  style: TextStyle(
                      fontSize: 14.5,
                      color: Colors.grey,
                      fontFamily: Str.POPPINS,
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                )
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

  Widget googleBtn() => InkWell(
        onTap: () async {
          // bool userAuth = await FireBaseAuthProvider().signInWithGoogle();
          // if (userAuth) {
          //   //USER IS LOGGED IN
          //   popUpWidgetScreenUntil(
          //       context,
          //       LandingPage(
          //           // currentTab: 4,
          //           ));
          // }
        },
        child: Container(
          height: 60.0,
          width: 100.0,
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
          child: Row(children: [
            Icon(
              FontAwesomeIcons.google,
              color: Color(0xFF007EC7),
              size: 20.0,
            ),
            SizedBox(
              width: 15.0,
            ),
            PopppinFont2(
              text: 'Continue with Google',
              textSize: 14.5,
              textColor: Colors.grey,
              fontWeight: FontWeight.w500,
            )
          ]),
        ),
      );

  Widget appleBtn() => InkWell(
        onTap: () {
          // Navigator.push(
          //       context,
          //       SlideUpRoute(
          //         page: SignUpScreen(),
          //       ),
          //     );
        },
        child: Container(
          height: 60.0,
          width: 100.0,
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
          child: Row(children: [
            Icon(
              FontAwesomeIcons.apple,
              color: Colors.grey,
              size: 20.0,
            ),
            SizedBox(
              width: 15.0,
            ),
            PopppinFont2(
              text: 'Continue with Apple',
              textSize: 14.5,
              textColor: Colors.grey,
              fontWeight: FontWeight.w500,
            )
          ]),
        ),
      );

  Widget fbBtn() => InkWell(
        onTap: () async {
          await handleFacebookLogin(context).then((user) {
            navigationCheck(user, context);
          }).then((_) {
            Navigator.pop(context);
          }).catchError((onError(e)) {
            //Navigator.pop(context);
          });
        },
        child: Container(
          height: 60.0,
          width: 100.0,
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
          child: Row(children: [
            Icon(
              FontAwesomeIcons.facebook,
              color: Colors.blueAccent,
              size: 20.0,
            ),
            SizedBox(
              width: 15.0,
            ),
            PopppinFont2(
              text: 'Continue with Facebook',
              textSize: 14.5,
              textColor: Colors.grey,
              fontWeight: FontWeight.w500,
            )
          ]),
        ),
      );

  onError(e) {
    //  showProgress(false, "", context);
    showLoader = false;
    setState(() {});
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return alert dialog object
        return AlertDialog(
          //backgroundColor: Colors.white,
          title: new Text(
            "${e.message}",
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
                    color: Colors.grey,
                    fontFamily: Str.POPPINS,
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              "     ",
              style: TextStyle(
                  fontSize: 14.5,
                  //color: Colors.black.withOpacity(.5),
                  fontFamily: Str.POPPINS,
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            InkWell(
              onTap: () async {
                Navigator.of(context).pop();
              },
              child: new Text(
                "   OKAY         \n",
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
    return;
  }

  Future<User> handleFacebookLogin(context) async {
    User user;
    // String result = await Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //       builder: (context) => CustomWebView(
    //             selectedUrl:
    //                 'https://www.facebook.com/dialog/oauth?client_id=$your_client_id&redirect_uri=$your_redirect_url&response_type=token&scope=email,public_profile,',
    //           ),
    //       maintainState: true),
    // );
    // if (result != null) {
    //   try {
    //     final facebookAuthCred = FacebookAuthProvider.credential(result);
    //     user =
    //         (await FirebaseAuth.instance.signInWithCredential(facebookAuthCred))
    //             .user;

    //     print('user $user');
    //   } catch (e) {
    //     print('Error $e');
    //     onError(e);
    //   }
    // }
    return user;
  }

  Future navigationCheck(User currentUser, context) async {
    await FirebaseFirestore.instance
        .collection('userBase')
        .where('userInfo.' + "userId", isEqualTo: currentUser.uid)
        .get()
        .then((QuerySnapshot snapshot) async {
      if (snapshot.docs.length > 0) {
        popUpWidgetScreenUntil(
          context,
          LandingPage(),
        );
      } else {
        await _setDataUser(currentUser);
        popUpWidgetScreenUntil(
          context,
          LandingPage(),
        );
      }
    });
  }

  Future _setDataUser(User user) async {
    //var date = DateFormat('MMMM yyyy').format(DateTime.now());

    await FirebaseFirestore.instance.collection('userBase').doc(user.uid).set({
      'userAbout': {
        'work': '',
        'about': '',
      },
      'userLocation': {
        'address': '',
      },
      'userInfo': {
        'firstName': "",
        'lastName': "",
        'fullName': user.displayName,
        'userId': user.uid,
        'joinedDate': '',
      },
      'userPhoto': {
        'url': FieldValue.arrayUnion([
          user.photoURL ??
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxUC64VZctJ0un9UBnbUKtj-blhw02PeDEQIMOqovc215LWYKu&s'
        ]),
        'verified': true,
      },
      'userContacts': {
        'userEmail': user.email,
        'userPhone': user.phoneNumber,
      },
    });
  }

  onPassChanged() {
    if (mounted)
      setState(() {
        showPassword = !showPassword;
      });
  }

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
}
