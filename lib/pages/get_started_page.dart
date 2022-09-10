import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:quizjets/export_files.dart';
import 'package:intl/intl.dart';
import 'package:responsive_builder/responsive_builder.dart';

class GetStartedPage extends StatefulWidget {
  static const String route = '/get_started';

  @override
  _GetStartedPageState createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var fNameController = TextEditingController();
  var lNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var conPasswordController = TextEditingController();
  var hearAboutUsController = TextEditingController();
  bool isPassword = true;
  bool showPassword = true;
  bool showLoader = false;
  bool showConfirmPassword = true;
  bool checkBoxValue = false;
  

  // new dropdown
  List _goalList = [
    {'no': 1, 'keyword': 'Friend or Colleague'},
    {'no': 2, 'keyword': 'Search Engine'},
    {'no': 1, 'keyword': 'Social Media'},
    {'no': 2, 'keyword': 'Other'},
  ];
  List<DropdownMenuItem> _dropdownGoalItems;
  var _goalSelected;

  String goalHint = 'How did you hear about us?';

  @override
  void initState() {
    // new dropdowns
    _dropdownGoalItems = buildDropdownTestItems(_goalList);
    super.initState();
  }

  List<DropdownMenuItem> buildDropdownTestItems(List _goalList) {
    List<DropdownMenuItem> items = List();
    for (var i in _goalList) {
      items.add(
        DropdownMenuItem(
          value: i,
          child: Text(i['keyword']),
        ),
      );
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainNavigationDrawer(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: HomeBar(),
      ),
      body: ListView(
        children: [
          headingStr(),
          signupLayout(),
          SizedBox(
            height: 40,
          ),
          FooterView(),
        ],
      ),
    );
  }

  Widget checkBoxx() => Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(0.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Checkbox(
              value: checkBoxValue,
              activeColor: QuizJetsTheme.quizJetsBlue,
              onChanged: (bool newValue) {
                setState(
                  () {
                    checkBoxValue = newValue;
                  },
                );
              },
            ),
            GestureDetector(
              onTap: () async {},
              child: RichText(
                textAlign: TextAlign.start,
                text: new TextSpan(
                  style: new TextStyle(
                    height: 1.8,
                  ),
                  children: <TextSpan>[
                    new TextSpan(
                      text:
                          'I agree to marketing communication from QuizJets.\n\n',
                      style: TextStyle(
                        fontFamily: Str.POPPINS,
                        fontWeight: FontWeight.w500,
                        color: Colors.black.withOpacity(.6),
                        fontSize: 14.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );

  Widget agreeTermsLinks() => Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(0.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: RichText(
                textAlign: TextAlign.start,
                text: new TextSpan(
                  style: new TextStyle(
                    height: 1.8,
                  ),
                  children: <TextSpan>[
                    new TextSpan(
                      text:
                          'By clicking "Create your new account" you agree to QuizJets ',
                      style: TextStyle(
                        fontFamily: Str.POPPINS,
                        fontWeight: FontWeight.w500,
                        color: Colors.black.withOpacity(.6),
                        fontSize: 13.0,
                      ),
                    ),
                    new TextSpan(
                      text: 'Terms of Use ',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context).pushNamed(LegalPage.route);
                        },
                      style: TextStyle(
                        fontFamily: Str.POPPINS,
                        fontWeight: FontWeight.w500,
                        color: QuizJetsTheme.quizJetsBlue,
                        fontSize: 13.0,
                      ),
                    ),
                    new TextSpan(
                      text: '& ',
                      style: TextStyle(
                        fontFamily: Str.POPPINS,
                        fontWeight: FontWeight.w500,
                        color: Colors.black.withOpacity(.6),
                        fontSize: 13.0,
                      ),
                    ),
                    new TextSpan(
                      text: 'Privacy Policy',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context).pushNamed(LegalPage.route);
                        },
                      style: TextStyle(
                        fontFamily: Str.POPPINS,
                        fontWeight: FontWeight.w500,
                        color: QuizJetsTheme.quizJetsBlue,
                        fontSize: 13.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );

  Widget newGoalsDropDownMenu() => Container(
        margin: EdgeInsets.symmetric(
          horizontal: 4.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            width: 1,
            color: Colors.black.withOpacity(.3),
          ),
        ),
        child: new Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
          child: new DropdownBelow(
            itemWidth: 200,
            itemTextstyle: _textStyle,
            boxTextstyle: _textStyle,
            boxPadding: EdgeInsets.fromLTRB(13, 12, 0, 12),
            boxHeight: 45,
            //boxWidth: 200,
            hint: Text(
              goalHint,
              style: _textStyle,
            ),
            value: _goalSelected,
            items: _dropdownGoalItems,
            onChanged: onChangeDropdownTests,
            icon: Icon(Icons.arrow_drop_down),
          ),
        ),
      );

  onChangeDropdownTests(selectedTest) {
    print(selectedTest);
    setState(() {
      _goalSelected = selectedTest;
    });
  }

  var _textStyle = TextStyle(
    fontFamily: Str.POPPINS,
    fontWeight: FontWeight.w500,
    color: Colors.black,
    fontSize: 14.0,
  );

  Widget signupLayout() => ResponsiveBuilder(
        builder: (context, sizingInformation) => Container(
          margin: EdgeInsets.symmetric(
            horizontal: sizingInformation.deviceScreenType ==
                    DeviceScreenType.mobile
                ? 30
                : sizingInformation.deviceScreenType == DeviceScreenType.tablet
                    ? MediaQuery.of(context).size.width * .15
                    : MediaQuery.of(context).size.width * .25,
            vertical: 30,
          ),
          child: Card(
            elevation: 2,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: sizingInformation.deviceScreenType ==
                        DeviceScreenType.mobile
                    ? 30
                    : MediaQuery.of(context).size.width * .05,
                vertical: MediaQuery.of(context).size.width * .02,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 40.0,
                  ),

                  newGoalsDropDownMenu(),
                  SizedBox(
                    height: 25.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: inputField(
                          fNameController,
                          'First name',
                          Icons.person,
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: inputField(
                          lNameController,
                          'Last name',
                          Icons.person,
                        ),
                      )
                    ],
                  ),

                  SizedBox(
                    height: 25.0,
                  ),
                  inputField(
                    emailController,
                    'Email Address',
                    Icons.email_outlined,
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  passInputField(
                    passwordController,
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  conPassInputField(
                    conPasswordController,
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  checkBoxx(),
                  agreeTermsLinks(),
                  SizedBox(
                    height: 15.0,
                  ),
                  loginBtn(),

                  //alreadyHveAccountStr(),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      );

  Widget headingStr() => Container(
        margin: EdgeInsets.only(
          top: 40.0,
        ),
        child: RichText(
          textAlign: TextAlign.center,
          text: new TextSpan(
            style: new TextStyle(
              height: 1.2,
              letterSpacing: .6,
            ),
            children: <TextSpan>[
              new TextSpan(
                text: 'Get started\n\n',
                style: TextStyle(
                  fontFamily: Str.POPPINS,
                  fontWeight: FontWeight.w500,
                  //wordSpacing: 2.5,
                  letterSpacing: .6,
                  color: Colors.black.withOpacity(.9),
                  fontSize: 36.0,
                ),
              ),
            ],
          ),
        ),
      );

  initSignIn() {
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
  }

  Widget loginBtn() => MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            initSignIn();
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
                'CREATE YOUR NEW ACCOUNT',
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
        margin: EdgeInsets.symmetric(
          horizontal: 4.0,
        ),
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
        margin: EdgeInsets.symmetric(
          horizontal: 4.0,
        ),
        child: TextField(
          onSubmitted: (value) {
            initSignIn();
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

  Widget inputField(var controler, String hintStr, var _iconn) => Container(
        margin: EdgeInsets.symmetric(
          horizontal: 4.0,
        ),
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
              color: Colors.transparent,
              fontFamily: Str.POPPINS,
            ),
            //fillColor: Color(0xFFDBEDFF),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(6.0)),
              borderSide: BorderSide(color: Colors.grey),
            ),
            prefixIcon: Icon(
              _iconn,
              color: Colors.grey,
              size: 21.0,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(6.0)),
              borderSide: BorderSide(color: Colors.transparent),
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

  startAcctCreation() async {
    showLoader = true;
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    )
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
          'agreedToMarketingComms': checkBoxValue,
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
            'fullName':
                '${fNameController.text.trim()} ${lNameController.text.trim()}',
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
            'userEmail': result.user.email.toUpperCase().trim(),
            'userPhone': result.user.phoneNumber,
          },
        }).catchError(onError);
        showLoader = false;
        addToConfidenceLevel();
        sendEmailLink();

        var accepteddate = DateFormat.yMd().add_jm().format(DateTime.now());
            await FirebaseFirestore.instance
                .collection('acceptedLegalAgreement')
                .doc(result.user.uid)
                .set({
              'accepted': true,
              'userId': result.user.uid,
              'agreedOn': '$accepteddate',
            });
        initCL();
        Navigator.of(context).pushNamed(HomePage.route);
      }).catchError(onError);
    }).catchError(onError);
  }

  initCL() {
    addToConfidenceLevel();
  }

  sendEmailLink() async {
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    User user = _firebaseAuth.currentUser;
    if (user == null) {
      return;
    }
    if (!user.emailVerified) {
      await user.sendEmailVerification();
    }
    //_showAlertDialog(context);
  }

  onError(e) {
    showLoader = false;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Color(0xFF007EC7),
        content: Text(
          "${e.toString().replaceAll('[firebase_auth/wrong-password]', '').replaceAll('[firebase_auth/weak-password]', '').replaceAll('[firebase_auth/too-many-requests]', '').replaceAll('[firebase_auth/user-not-found]', '').replaceAll('[firebase_auth/email-already-in-use]', '')}",
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
  }
}
