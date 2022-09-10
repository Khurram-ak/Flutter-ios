

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:quizjets/export_files.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var fNameController = TextEditingController();
  var lNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var conPasswordController = TextEditingController();
  bool isPassword = true;
  bool showPassword = true;
  bool showLoader = false;
  bool showConfirmPassword = true;

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
          signupLayout(sizingInformation.deviceScreenType == DeviceScreenType.tablet),
          Visibility(
            visible: showLoader,
            child: spinkit,
          ),
        ]
      )
    ),);
  }

  Widget signupLayout(isTablet) => Center(
    child: Container(
      width: isTablet ? 400.0 : MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          child: ListView(
            children: [
              SizedBox(
                height: 20.0,
              ),
              gettingStartedStr,
              gettingStartedSUBStr,
              SizedBox(
                height: 40.0,
              ),
              inputField(
                fNameController,
                'First name',
                Icons.person,
              ),
              SizedBox(
                height: 20.0,
              ),
              inputField(
                lNameController,
                'Last name',
                Icons.person,
              ),
              
              SizedBox(
                height: 20.0,
              ),
              inputField(
                emailController,
                'Email Address',
                Icons.person,
              ),
              SizedBox(
                height: 20.0,
              ),
              passInputField(
                passwordController,
              ),
              SizedBox(
                height: 20.0,
              ),
              conPassInputField(
                conPasswordController,
              ),
              SizedBox(
                height: 10.0,
              ),
              loginBtn(),
              SizedBox(
                height: 15.0,
              ),
              alreadyHveAccountStr(),
              SizedBox(height: 50),
            ],
          ),
        ),
  );

  Widget actionBar() => AppBar(
        iconTheme: new IconThemeData(color: Colors.grey),
        title: Container(),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            }),
      );

  Widget loginBtn() => InkWell(
        onTap: () {
         
          if (fNameController.text.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Color(0xFF007EC7),
                content: Text(
                  "Please enter first name",
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

          if (lNameController.text.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Color(0xFF007EC7),
                content: Text(
                  "Please enter last name",
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

           if (emailController.text.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Color(0xFF007EC7),
                content: Text(
                  "Please enter email",
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

          if (passwordController.text.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Color(0xFF007EC7),
                content: Text(
                  "Please enter password",
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

          if (conPasswordController.text.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Color(0xFF007EC7),
                content: Text(
                  "Please re-enter password",
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

          if (passwordController.text != conPasswordController.text) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Color(0xFF007EC7),
                content: Text(
                  "Passwords don't match",
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

          startAcctCreation();
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
              'SIGN UP',
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
        Navigator.of(context).pop();
      },
      child: RichText(
        textAlign: TextAlign.center,
        text: new TextSpan(
          style: new TextStyle(
            height: 1.0,
          ),
          children: <TextSpan>[
            new TextSpan(
              text: 'Already have an Account? ',
              style: TextStyle(
                fontFamily: Str.POPPINS,
                fontWeight: FontWeight.w500,
                wordSpacing: 1.5,
                color: Colors.grey,
                fontSize: 13.5,
              ),
            ),
            new TextSpan(
                text: 'Log In',
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

  Widget conPassInputField(var controler) => Container(
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
            labelText: 'Confirm Password',
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

  Widget inputField(var controler, String hintStr, var iconn) => Container(
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

  var gettingStartedStr = new Text(
    "Getting Started",
    style: TextStyle(
        fontSize: 19.5,
        color: Colors.grey,
        fontFamily: Str.POPPINS,
        fontWeight: FontWeight.w700),
    textAlign: TextAlign.start,
  );

  var gettingStartedSUBStr = new Text(
    "Create an account to continue!",
    style: TextStyle(
        fontSize: 13.5,
        color: Colors.grey,
        fontFamily: Str.POPPINS,
        fontWeight: FontWeight.w500),
    textAlign: TextAlign.start,
  );

  onPassChanged() {
    if (mounted)
      setState(() {
        showPassword = !showPassword;
      });
  }

  onError(e) {
    showLoader = false;
    ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Color(0xFF007EC7),
                content: Text(
                  "${e.message.toString()}",
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
  }

  startAcctCreation() async {
    showLoader = true;
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: emailController.text.trim(), password: passwordController.text.trim(),)
        .then((result) {
      FirebaseFirestore.instance
          .collection('userBase')
          .doc(result.user.uid)
          .get()
          .then((doc) async {
        if (doc.exists) {
          // showProgress(false, "", context);
          // showMessage(
          //     context,
          //     Icons.error,
          //     Colors.red,
          //     "Account Error",
          //     "Sorry you cannot proceed at this point, "
          //         "reason being that you already have "
          //         "an account with us.", onClicked: (_) {
          //   if (_) Navigator.pop(context);
          // }, clickYesText: "login");
          // return;
        }

        var date = DateFormat('MMMM yyyy').format(DateTime.now());
        var sKey = '${fNameController.text.toUpperCase()}${lNameController.text.toUpperCase()}';

        await FirebaseFirestore.instance
            .collection('userBase')
            .doc(result.user.uid)
            .set({
              'tester': false,
          'agreedToMarketingComms': false,
          'blocked': false,
          'searchKey': sKey.trim().replaceAll(' ', ''),
          'userAbout': {
            'work': '',
            'about': '',
          },
          'userLocation': {
            'address': '',
          },
          'userInfo': {
            'firstName': "${fNameController.text.trim()}",
            'lastName': "${lNameController.text.trim()}",
            'fullName': '${fNameController.text.trim()} ${lNameController.text.trim()}',
            'userId': result.user.uid,
            'joinedDate': date,
          },
          'userPhoto': {
            'url': FieldValue.arrayUnion([
              result.user.photoURL ??
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxUC64VZctJ0un9UBnbUKtj-blhw02PeDEQIMOqovc215LWYKu&s'
            ]),
            'verified': true,
          },
          'userContacts': {
            'userEmail': result.user.email,
            'userPhone': result.user.phoneNumber,
          },
        }).catchError(onError);
        showLoader = false;
        addToConfidenceLevel();
        popUpWidgetScreenUntil(
          context,
          LandingPage(),
        );
      }).catchError(onError);
    });
  }
}
