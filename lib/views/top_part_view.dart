import 'package:flutter/material.dart';
import 'package:quizjets/export_files.dart';
import 'package:responsive_builder/responsive_builder.dart';

class TopPartView extends StatefulWidget {
  @override
  _TopPartViewState createState() => _TopPartViewState();
}

class _TopPartViewState extends State<TopPartView> {
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User>(context);
    var webInfo = Provider.of<WebInfo>(context);
    bool loggedIn = user != null;
    return ResponsiveBuilder(
      builder: (context, sizingInformation) =>
          sizingInformation.deviceScreenType == DeviceScreenType.mobile
              ? Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/home_image.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      height: 380,
                      width: MediaQuery.of(context).size.width,
                    ),
                    // SizedBox(
                    //   height: 670.0,
                    //   width: MediaQuery.of(context).size.width,
                    //   child: SvgPicture.asset(
                    //     'assets/images/home_image.svg',
                    //   ),
                    // ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft,
                          colors: [
                            Colors.transparent,
                            QuizJetsTheme.quizJetsBlue.withOpacity(.2),
                          ],
                        ),
                      ),
                      height: 380,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              top: 90,
                              left: 30,
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
                                    text: '${webInfo.main_heading.replaceAll("\\n", "\n")}',
                                    style: TextStyle(
                                      fontFamily: Str.POPPINS,
                                      fontWeight: FontWeight.w600,
                                      //wordSpacing: 2.5,
                                      color: Colors.white,
                                      fontSize: 35.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              top: 30.0,
                              left: (MediaQuery.of(context).size.width < 1150)
                                  ? 30
                                  : MediaQuery.of(context).size.width * .13,
                            ),
                            child: RichText(
                              textAlign: TextAlign.start,
                              text: new TextSpan(
                                style: new TextStyle(
                                  height: 1.5,
                                  letterSpacing: .8,
                                ),
                                children: <TextSpan>[
                                  new TextSpan(
                                    text:
                                        '${webInfo.sub_heading.replaceAll("\\n", "\n")}',
                                    style: TextStyle(
                                      fontFamily: Str.POPPINS,
                                      fontWeight: FontWeight.w500,
                                      //wordSpacing: 2.5,
                                      color: Colors.white,
                                      fontSize: 17.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          loggedIn ? Container() : getStarted(),
                        ],
                      ),
                    ),
                  ],
                )
              : Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/home_image.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      height: sizingInformation.deviceScreenType ==
                              DeviceScreenType.tablet
                          ? 500
                          : 690.0,
                      width: MediaQuery.of(context).size.width,
                    ),
                    // SizedBox(
                    //   height: 670.0,
                    //   width: MediaQuery.of(context).size.width,
                    //   child: SvgPicture.asset(
                    //     'assets/images/home_image.svg',
                    //   ),
                    // ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft,
                          colors: [
                            Colors.transparent,
                            QuizJetsTheme.quizJetsBlue.withOpacity(.2),
                          ],
                        ),
                      ),
                      height: sizingInformation.deviceScreenType ==
                              DeviceScreenType.tablet
                          ? 500
                          : 690.0,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          headingStr(sizingInformation.deviceScreenType, webInfo),
                          subStr(webInfo),
                          loggedIn ? Container() : getStarted(),
                        ],
                      ),
                    ),
                  ],
                ),
    );
  }

  Widget headingStr(deviceScreenType, webInfo) => Container(
        margin: EdgeInsets.only(
          top: deviceScreenType == DeviceScreenType.tablet ? 100 : 190.0,
          left: (MediaQuery.of(context).size.width < 1150)
              ? 30
              : MediaQuery.of(context).size.width * .13,
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
                text: '${webInfo.main_heading.replaceAll("\\n", "\n")}',
                style: TextStyle(
                  fontFamily: Str.POPPINS,
                  fontWeight: FontWeight.w600,
                  //wordSpacing: 2.5,
                  color: Colors.white,
                  fontSize: 45.0,
                ),
              ),
              // new TextSpan(
              //   text: 'These are a selection of my recent works.',
              //   style: TextStyle(
              //     fontFamily: Str.POPPINS,
              //     fontWeight: FontWeight.w600,
              //     //wordSpacing: 2.5,
              //     color: Colors.white,
              //     fontSize: 15.0,
              //   ),
              // ),
            ],
          ),
        ),
      );

  Widget subStr(webInfo) => Container(
        margin: EdgeInsets.only(
          top: 30.0,
          left: (MediaQuery.of(context).size.width < 1150)
              ? 30
              : MediaQuery.of(context).size.width * .13,
        ),
        child: RichText(
          textAlign: TextAlign.start,
          text: new TextSpan(
            style: new TextStyle(
              height: 1.5,
              letterSpacing: .8,
            ),
            children: <TextSpan>[
              new TextSpan(
                text:
                    '${webInfo.sub_heading.replaceAll("\\n", "\n")}',
                style: TextStyle(
                  fontFamily: Str.POPPINS,
                  fontWeight: FontWeight.w500,
                  //wordSpacing: 2.5,
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ],
          ),
        ),
      );

  Widget getStarted() => Container(
        height: 60.0,
        width: 190.0,
        margin: EdgeInsets.only(
          left: (MediaQuery.of(context).size.width < 1150)
              ? 30
              : MediaQuery.of(context).size.width * .13,
          top: 30.0,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(4.0),
          ),
          color: Colors.white,
        ),
        child: Center(
          child: Row(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(GetStartedPage.route);
                },
                child: Text(
                  'GET STARTED',
                  style: TextStyle(
                    fontSize: 16.5,
                    fontFamily: Str.POPPINS,
                    fontWeight: FontWeight.w600,
                    //letterSpacing: .4,
                    wordSpacing: 2.5,
                    color: QuizJetsTheme.quizJetsBlue,
                  ),
                ),
              ),
              Expanded(
                child: Container(),
              ),
              Image(
                height: 30.0,
                width: 30.0,
                image: AssetImage(
                  'assets/images/icon.png',
                ),
              ),
              // SizedBox(
              //   width: 20.0,
              // ),
            ],
          ),
        ),
      );
}
