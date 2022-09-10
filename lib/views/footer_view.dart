import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quizjets/export_files.dart';
import 'package:quizjets/pages/app_store_page.dart';
import 'package:quizjets/pages/google_play_page.dart';
import 'package:responsive_builder/responsive_builder.dart';

class FooterView extends StatefulWidget {
  @override
  _FooterViewState createState() => _FooterViewState();
}

class _FooterViewState extends State<FooterView> {
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User>(context);
    bool loggedIn = user != null;
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Container(
        padding: EdgeInsets.symmetric(
          horizontal: (MediaQuery.of(context).size.width < 1150)
              ? 30
              : MediaQuery.of(context).size.width * .11,
          vertical: 45.0,
        ),
        margin: EdgeInsets.only(
          top: 50,
        ),
        color: QuizJetsTheme.quizJetsBlue,
        height: 480,
        child: footerRow(loggedIn, sizingInformation),
      ),
    );
  }

  Widget footerRow(loggedIn, sizingInformation) => Container(
        child: sizingInformation.deviceScreenType == DeviceScreenType.mobile
            ? Column(children: [
                SizedBox(
                  height: 50.0,
                  width: 180.0,
                  child: SvgPicture.asset(
                    'assets/svgs/logo.svg',
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10),
                          Text(
                            'Company',
                            style: TextStyle(
                              fontSize: 19,
                              fontFamily: Str.POPPINS,
                              fontWeight: FontWeight.w600,
                              letterSpacing: .7,
                              wordSpacing: 2.5,
                              color: Colors.white.withOpacity(.9),
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: () {
                                //locator<NavigationService>().navigateTo(ContactUsRoute);
                                Navigator.of(context)
                                    .pushNamed(ContactUsPage.route);
                              },
                              child: Text(
                                'Contact Us',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: Str.POPPINS,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: .7,
                                  wordSpacing: 2.5,
                                  color: Colors.white.withOpacity(.9),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),

                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                            onTap: () {
                              //locator<NavigationService>().navigateTo(LegalRoute);
                              Navigator.of(context).pushNamed(LegalPage.route);
                            },
                            child: Text(
                              'Legal',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: Str.POPPINS,
                                fontWeight: FontWeight.w500,
                                letterSpacing: .7,
                                wordSpacing: 2.5,
                                color: Colors.white.withOpacity(.9),
                              ),
                            ),
                          )),
                          SizedBox(
                            height: 5.0,
                          ),
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                            onTap: () {
                              //locator<NavigationService>().navigateTo(PricingRoute);
                              Navigator.of(context)
                                  .pushNamed(PricingPage.route);
                            },
                            child: Text(
                              'Pricing',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: Str.POPPINS,
                                fontWeight: FontWeight.w500,
                                letterSpacing: .7,
                                wordSpacing: 2.5,
                                color: Colors.white.withOpacity(.9),
                              ),
                            ),
                          )),
                          SizedBox(
                            height: 5.0,
                          ),
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                            onTap: () {
                              //locator<NavigationService>().navigateTo(FaqsRoute);
                              Navigator.of(context).pushNamed(FAQsPage.route);
                            },
                            child: Text(
                              'FAQs',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: Str.POPPINS,
                                fontWeight: FontWeight.w500,
                                letterSpacing: .7,
                                wordSpacing: 2.5,
                                color: Colors.white.withOpacity(.9),
                              ),
                            ),
                          )),
                        ],
                      ),
                      Expanded(child: Container()),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          googlePlay(),
                          SizedBox(
                            height: 15,
                          ),
                          appStore(),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                supportBtn(),
                Expanded(
                  child: Container(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    socialBtn(FontAwesomeIcons.facebookF,
                        'https://www.facebook.com/QuizJets'),
                    SizedBox(
                      width: 13,
                    ),
                    socialBtn(FontAwesomeIcons.twitter,
                        'https://www.twitter.com/QuizJets'),
                    SizedBox(
                      width: 13,
                    ),
                    socialBtn(FontAwesomeIcons.instagram,
                        'https://www.instagram.com/QuizJets'),
                    SizedBox(
                      width: 13,
                    ),
                    socialBtn(FontAwesomeIcons.linkedinIn,
                        'https://www.linkedin.com/company/QuizJets'),
                    SizedBox(
                      width: 13,
                    ),
                    socialBtn(FontAwesomeIcons.youtube,
                        'https://www.youtube.com/channel/UC7a38ntmCFNgdkjMPSqQEZw'),
                  ],
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  '© QuizJets',
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: Str.POPPINS,
                    fontWeight: FontWeight.w500,
                    letterSpacing: .7,
                    wordSpacing: 2.5,
                    color: Colors.white.withOpacity(.7),
                  ),
                ),
              ])
            : Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  firstColumn(),
                  secondColumn(loggedIn, sizingInformation),
                  // courseWareColumn(),
                ],
              ),
      );

  Widget firstColumn() => Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50.0,
              width: 180.0,
              child: SvgPicture.asset(
                'assets/svgs/logo.svg',
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            supportBtn(),
            Expanded(
              child: Container(),
            ),
            Row(
              children: [
                socialBtn(FontAwesomeIcons.facebookF,
                    'https://www.facebook.com/QuizJets'),
                SizedBox(
                  width: 13,
                ),
                socialBtn(FontAwesomeIcons.twitter,
                    'https://www.twitter.com/QuizJets'),
                SizedBox(
                  width: 13,
                ),
                socialBtn(FontAwesomeIcons.instagram,
                    'https://www.instagram.com/QuizJets'),
                SizedBox(
                  width: 13,
                ),
                socialBtn(FontAwesomeIcons.linkedinIn,
                    'https://www.linkedin.com/company/QuizJets'),
                SizedBox(
                  width: 13,
                ),
                socialBtn(FontAwesomeIcons.youtube,
                    'https://www.youtube.com/channel/UC7a38ntmCFNgdkjMPSqQEZw'),
              ],
            ),
            SizedBox(
              height: 15.0,
            ),
            Text(
              '© QuizJets',
              style: TextStyle(
                fontSize: 15,
                fontFamily: Str.POPPINS,
                fontWeight: FontWeight.w500,
                letterSpacing: .7,
                wordSpacing: 2.5,
                color: Colors.white.withOpacity(.7),
              ),
            )
          ],
        ),
      );

  Widget googlePlay() => MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(GooglePlayPage.route);
            //_launchURL('https://play.google.com/store/apps');
          },
          child: Container(
            height: 60.0,
            //width: 190,
            padding: EdgeInsets.symmetric(
              horizontal: 15,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(6),
              ),
            ),
            child: Center(
              child: Row(
                children: [
                  Icon(
                    FontAwesomeIcons.googlePlay,
                    color: QuizJetsTheme.quizJetsBlue,
                    size: 27.0,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  RichText(
                    textAlign: TextAlign.start,
                    text: new TextSpan(
                      style: new TextStyle(
                        height: 1.2,
                        letterSpacing: .6,
                      ),
                      children: <TextSpan>[
                        new TextSpan(
                          text: 'Get it on\n',
                          style: TextStyle(
                            fontFamily: Str.POPPINS,
                            fontWeight: FontWeight.w500,
                            //wordSpacing: 2.5,
                            letterSpacing: .6,
                            color: QuizJetsTheme.quizJetsBlue,
                            fontSize: 11.0,
                          ),
                        ),
                        new TextSpan(
                          text: 'Google Play',
                          style: TextStyle(
                            fontFamily: Str.POPPINS,
                            fontWeight: FontWeight.w600,
                            //wordSpacing: 2.5,
                            letterSpacing: .6,
                            color: QuizJetsTheme.quizJetsBlue,
                            fontSize: 17.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  Widget appStore() => MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(AppStorePage.route);
            //_launchURL('https://www.apple.com/app-store/');
          },
          child: Container(
            height: 60.0,
            //width: 190,
            padding: EdgeInsets.symmetric(
              horizontal: 15,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(6),
              ),
            ),
            child: Center(
              child: Row(
                children: [
                  Icon(
                    FontAwesomeIcons.apple,
                    color: QuizJetsTheme.quizJetsBlue,
                    size: 27.0,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  RichText(
                    textAlign: TextAlign.start,
                    text: new TextSpan(
                      style: new TextStyle(
                        height: 1.2,
                        letterSpacing: .6,
                      ),
                      children: <TextSpan>[
                        new TextSpan(
                          text: 'Download on the\n',
                          style: TextStyle(
                            fontFamily: Str.POPPINS,
                            fontWeight: FontWeight.w500,
                            //wordSpacing: 2.5,
                            letterSpacing: .6,
                            color: QuizJetsTheme.quizJetsBlue,
                            fontSize: 11.0,
                          ),
                        ),
                        new TextSpan(
                          text: 'App Store',
                          style: TextStyle(
                            fontFamily: Str.POPPINS,
                            fontWeight: FontWeight.w600,
                            //wordSpacing: 2.5,
                            letterSpacing: .6,
                            color: QuizJetsTheme.quizJetsBlue,
                            fontSize: 17.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  Widget secondColumn(loggedIn, sizingInformation) => Container(
        margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * .08),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Company',
              style: TextStyle(
                fontSize: 19,
                fontFamily: Str.POPPINS,
                fontWeight: FontWeight.w600,
                letterSpacing: .7,
                wordSpacing: 2.5,
                color: Colors.white.withOpacity(.9),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            // Text(
            //   'Our Story',
            //   style: TextStyle(
            //     fontSize: 18,
            //     fontFamily: Str.POPPINS,
            //     fontWeight: FontWeight.w500,
            //     letterSpacing: .7,
            //     wordSpacing: 2.5,
            //     color: Colors.white.withOpacity(.9),
            //   ),
            // ),
            // SizedBox(
            //   height: 15.0,
            // ),
           MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                onTap: () {
                  //locator<NavigationService>().navigateTo(ContactUsRoute);
                  Navigator.of(context).pushNamed(ContactUsPage.route);
                },
                child: Text(
                  'Contact Us',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: Str.POPPINS,
                    fontWeight: FontWeight.w500,
                    letterSpacing: .7,
                    wordSpacing: 2.5,
                    color: Colors.white.withOpacity(.9),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                onTap: () {
                  //locator<NavigationService>().navigateTo(LegalRoute);
                  Navigator.of(context).pushNamed(LegalPage.route);
                },
                child: Text(
                  'Legal',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: Str.POPPINS,
                    fontWeight: FontWeight.w500,
                    letterSpacing: .7,
                    wordSpacing: 2.5,
                    color: Colors.white.withOpacity(.9),
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 15.0,
            ),
            MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                onTap: () {
                  //locator<NavigationService>().navigateTo(PricingRoute);
                  Navigator.of(context).pushNamed(PricingPage.route);
                },
                child: Text(
                  'Pricing',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: Str.POPPINS,
                    fontWeight: FontWeight.w500,
                    letterSpacing: .7,
                    wordSpacing: 2.5,
                    color: Colors.white.withOpacity(.9),
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 15.0,
            ),
            MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                onTap: () {
                  //locator<NavigationService>().navigateTo(FaqsRoute);
                  Navigator.of(context).pushNamed(FAQsPage.route);
                },
                child: Text(
                  'FAQs',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: Str.POPPINS,
                    fontWeight: FontWeight.w500,
                    letterSpacing: .7,
                    wordSpacing: 2.5,
                    color: Colors.white.withOpacity(.9),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(),
            ),
            sizingInformation.deviceScreenType == DeviceScreenType.mobile ||
                    sizingInformation.deviceScreenType ==
                        DeviceScreenType.tablet
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      googlePlay(),
                      SizedBox(
                        height: 15,
                      ),
                      appStore(),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      googlePlay(),
                      SizedBox(
                        width: 15,
                      ),
                      appStore(),
                    ],
                  ),
            SizedBox(
              height: 25.0,
            ),
            // loggedIn ?? true
            //             ? TextButton(
            //   onPressed: () {
            //     _showSignOutAlertDialog();
            //   },
            //   child: Text(
            //     'Log Out',
            //     style: TextStyle(
            //       fontSize: 16,
            //       fontFamily: Str.POPPINS,
            //       fontWeight: FontWeight.w500,
            //       letterSpacing: .7,
            //       wordSpacing: 2.5,
            //       color: Colors.white.withOpacity(.9),
            //     ),
            //   ),
            // )
            //             : TextButton(
            //                 onPressed: () {
            //                   Navigator.of(context).pushNamed(LoginPage.route);
            //                 },
            //                 child: Text(
            //                   'Login',
            //                   style: TextStyle(
            //                     fontSize: 16,
            //                     fontFamily: Str.POPPINS,
            //                     fontWeight: FontWeight.w500,
            //                     letterSpacing: .7,
            //                     wordSpacing: 2.5,
            //                     color: Colors.white,
            //                   ),
            //                 ),
            //               ),
          ],
        ),
      );

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

  Widget courseWareColumn() => Container(
        // margin: EdgeInsets.symmetric(
        //     horizontal: MediaQuery.of(context).size.width * .1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Courseware',
              style: TextStyle(
                fontSize: 19,
                fontFamily: Str.POPPINS,
                fontWeight: FontWeight.w600,
                letterSpacing: .7,
                wordSpacing: 2.5,
                color: Colors.white.withOpacity(.9),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            TextButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(CoursewarePage.route),
              child: Text(
                'General Subjects',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: Str.POPPINS,
                  fontWeight: FontWeight.w500,
                  letterSpacing: .7,
                  wordSpacing: 2.5,
                  color: Colors.white.withOpacity(.9),
                ),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            TextButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(PricingPage.route),
              child: Text(
                'Pricing',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: Str.POPPINS,
                  fontWeight: FontWeight.w500,
                  letterSpacing: .7,
                  wordSpacing: 2.5,
                  color: Colors.white.withOpacity(.9),
                ),
              ),
            ),
          ],
        ),
      );

  // Widget helpColumn() => Container(
  //   // margin: EdgeInsets.symmetric(
  //   //     horizontal: MediaQuery.of(context).size.width * .1),
  //   child: Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Text(
  //         'Help & Resourses',
  //         style: TextStyle(
  //           fontSize: 21,
  //           fontFamily: Str.POPPINS,
  //           fontWeight: FontWeight.w600,
  //           letterSpacing: .7,
  //           wordSpacing: 2.5,
  //           color: Colors.white.withOpacity(.9),
  //         ),
  //       ),
  //       SizedBox(
  //         height: 30.0,
  //       ),
  //       Text(
  //         'FAQs',
  //         style: TextStyle(
  //           fontSize: 18,
  //           fontFamily: Str.POPPINS,
  //           fontWeight: FontWeight.w500,
  //           letterSpacing: .7,
  //           wordSpacing: 2.5,
  //           color: Colors.white.withOpacity(.9),
  //         ),
  //       ),
  //       SizedBox(
  //         height: 15.0,
  //       ),
  //       Text(
  //         'Categories',
  //         style: TextStyle(
  //           fontSize: 18,
  //           fontFamily: Str.POPPINS,
  //           fontWeight: FontWeight.w500,
  //           letterSpacing: .7,
  //           wordSpacing: 2.5,
  //           color: Colors.white.withOpacity(.9),
  //         ),
  //       ),

  //     ],
  //   ),
  // );

  Widget supportBtn() => Container(
        height: 50,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(6),
          ),
          border: Border.all(
            width: 2.0,
            color: Colors.white,
          ),
        ),
        child: TextButton(
          onPressed: () {
            Navigator.of(context).pushNamed(ContactUsPage.route);
          },
          child: Text(
            'Talk to support',
            style: TextStyle(
              fontSize: 16,
              fontFamily: Str.POPPINS,
              fontWeight: FontWeight.w600,
              //letterSpacing: .4,
              wordSpacing: 2.5,
              color: Colors.white,
            ),
          ),
        ),
      );

  Widget socialBtn(_iconz, url) => Container(
        padding: EdgeInsets.all(
          8.0,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {
              _launchURL(url);
            },
            child: Center(
              child: Icon(
                _iconz,
                color: QuizJetsTheme.quizJetsBlue,
                size: 22.0,
              ),
            ),
          ),
        ),
      );

  //   void _launchURL(_url) async =>
  // await canLaunch(_url);

  _launchURL(_url) async {
    const url = 'https://flutter.io';
    if (await canLaunch(url)) {
      await launch(_url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
