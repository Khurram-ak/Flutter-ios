import 'dart:io';

import 'package:flutter/material.dart';

import 'package:quizjets/export_files.dart';
import 'package:responsive_builder/responsive_builder.dart';

class EditProfilePage extends StatefulWidget {
  static const String route = '/edit_profile';

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var fNameController = TextEditingController();
  var lNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var conPasswordController = TextEditingController();
  var phoneController = TextEditingController();
  var messageController = TextEditingController();
  var hearAboutUsController = TextEditingController();
  bool isPassword = true;
  bool showPassword = true;
  bool showLoader = false;
  bool showConfirmPassword = true;
  File _image;
  var uploadedImg = '';

  @override
  void initState() {
    super.initState();
    initInfo();
  }

  initInfo() async {
    var fName = await GetUserInfo().getCurrentUserFName();
    fNameController.text = await GetUserInfo().getCurrentUserFName();
    lNameController.text = await GetUserInfo().getCurrentUserLName();
    emailController.text = await GetUserInfo().getCurrentUserEmail();
    setState(() {});
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
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * .12),
            child: headingStr(),
          ),
          signupLayout(),
          SizedBox(
            height: 80.0,
          ),
          FooterView(),
        ],
      ),
    );
  }

  Widget signupLayout() => ResponsiveBuilder(
        builder: (context, sizingInformation) => Container(
          margin: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * .11,
            right: sizingInformation.deviceScreenType == DeviceScreenType.mobile
                ? MediaQuery.of(context).size.width * .11
                : sizingInformation.deviceScreenType == DeviceScreenType.tablet
                    ? MediaQuery.of(context).size.width * .2
                    : MediaQuery.of(context).size.width * .38,
            top: 30,
            bottom: 30,
          ),
          child: Card(
            elevation: 2,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * .03,
                vertical: MediaQuery.of(context).size.width * .02,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 40.0,
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

                  passInputField(passwordController),
                  SizedBox(
                    height: 25.0,
                  ),
                  conPassInputField(conPasswordController),
                  SizedBox(
                    height: 25.0,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      loginBtn(),
                    ],
                  ),

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
          top: 120.0,
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
                text: 'Edit Info.\n\n',
                style: TextStyle(
                  fontFamily: Str.POPPINS,
                  fontWeight: FontWeight.w500,
                  //wordSpacing: 2.5,
                  letterSpacing: .6,
                  color: Colors.black.withOpacity(.9),
                  fontSize: 35.0,
                ),
              ),
              new TextSpan(
                text: 'Edit your info by filling the form below.',
                style: TextStyle(
                  fontFamily: Str.POPPINS,
                  fontWeight: FontWeight.w500,
                  //wordSpacing: 2.5,
                  letterSpacing: .8,
                  color: Colors.black.withOpacity(.6),
                  fontSize: 16.0,
                ),
              ),
            ],
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
            prefixIcon: Icon(
              iconn,
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

  Widget loginBtn() => MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            if (fNameController.text.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Color(0xFF007EC7),
                  content: Text(
                    "Please Enter First name!",
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
                    "Please Enter Last name!",
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

            if (passwordController.text.isEmpty) {
              updateUserInfo();
            }

            if (passwordController.text.isNotEmpty) {
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

              updateUserInfo();
              initPasswordReset();
            }

            // sendFeedback();
          },
          child: Container(
            height: 50.0,
            width: 120.0,
            //padding: EdgeInsets.only(right: 20.0, left: 20.0),
            margin: EdgeInsets.symmetric(
              horizontal: 0.0,
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
                'UPDATE',
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
            labelText: 'Old Password',
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
            labelText: 'New Password',
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

  onPassChanged() {
    if (mounted)
      setState(() {
        showPassword = !showPassword;
      });
  }

  initPasswordReset() {
    User user;
    user = FirebaseAuth.instance.currentUser;
    String userEmail = user.email;

    AuthCredential credential = EmailAuthProvider.credential(
        email: userEmail, password: '${passwordController.text.trim()}');

    user.reauthenticateWithCredential(credential).then((value) {
      print('${value.toString()}');
      user.updatePassword('${conPasswordController.text}').then((value) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Color(0xFF007EC7),
            content: Text(
              "Success",
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
      }).catchError(onError);
    }).catchError(onError);
  }

  onError(e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Color(0xFF007EC7),
        content: Text(
          "${e.toString().replaceAll('[firebase_auth/wrong-password]', '').replaceAll('[firebase_auth/weak-password]', '')}",
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

  updateUserInfo() async {
    var userId = await GetUserInfo().getCurrentUserID();
    var userEMail = await GetUserInfo().getCurrentUserEmail();
    FirebaseFirestore.instance.collection('userBase').doc('$userId').update({
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
        'userId': userId,
      },
      'userPhoto': {
        //'url': '',
        'verified': true,
      },
      'userContacts': {
        'userEmail': userEMail,
      },
    }).then((value) {
      if (passwordController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Color(0xFF007EC7),
            content: Text(
              "Success",
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
    }).catchError(onError);
  }

  imagePicker() async {
    // var picked = await FilePicker.platform.pickFiles();

    // if (picked != null) {
    //   print(' HELL YAH ${picked.files.first.name}');
    //   _image = File(picked.files.first.name);
    //   uploadedImg = await UploadFile().uploadImage(_image);
    //   print(" imagee:: $uploadedImg");
    // }
  }
}
