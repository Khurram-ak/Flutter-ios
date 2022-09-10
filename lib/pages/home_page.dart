import 'package:flutter/material.dart';
import 'package:quizjets/export_files.dart';
import 'package:quizjets/mobile/pages/login_page.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomePage extends StatefulWidget {
  static const String route = '/';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isAuth = false;
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User>(context);
    bool loggedIn = user != null;
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Scaffold(
        appBar:  PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: HomeBar(),
        ),
        drawer: MainNavigationDrawer(),
        body: body(),
         
      ),
    );
    // return ResponsiveBuilder(
    //   builder: (context, sizingInformation) => Scaffold(
    //     appBar:  PreferredSize(
    //       preferredSize:  sizingInformation.deviceScreenType == DeviceScreenType.mobile ||
    //                     sizingInformation.deviceScreenType ==
    //                         DeviceScreenType.tablet ? Size.fromHeight(0) : Size.fromHeight(70),//
    //       child: HomeBar(),
    //     ),
    //     body: sizingInformation.deviceScreenType == DeviceScreenType.mobile ||
    //                     sizingInformation.deviceScreenType ==
    //                         DeviceScreenType.tablet
    //                 ? (loggedIn
    //                         ? LandingPage()
    //                         : MobileLoginPage())
    //                 : body(),
         
    //   ),
    // );
  }

  Widget body() => Stack(
          children: [
            ListView(
              children: [
                TopPartView(),
                MidPartVIew(),
                OurPopularAircraftsView(),
                FooterView(),   
              ],
            ),
            feedBack(),
          ],
        );

  Widget feedBack() => Positioned(
        bottom: 135.0,
        right: 0.0,
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(ContactUsPage.route);
            },
            child: RotatedBox(
              quarterTurns: -1,
              child: Container(
                height: 42,
                width: 140,
                decoration: BoxDecoration(
                  color: QuizJetsTheme.quizJetsBlue,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(6),
                    topRight: Radius.circular(6),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Feedback',
                    style: TextStyle(
                      fontSize: 16.5,
                      fontFamily: Str.POPPINS,
                      fontWeight: FontWeight.w500,
                      letterSpacing: .7,
                      wordSpacing: 2.5,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
