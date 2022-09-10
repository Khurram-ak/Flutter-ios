import 'package:flutter/material.dart';
import 'package:quizjets/export_files.dart';
import 'package:quizjets/styles/theme/quizjets_theme.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AppStorePage extends StatefulWidget {
  static const String route = '/app_store';

  @override
  _AppStorePageState createState() => _AppStorePageState();
}

class _AppStorePageState extends State<AppStorePage> {

  @override
  Widget build(BuildContext context) {
    var webInfo = Provider.of<WebInfo>(context);
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Scaffold(
        drawer: MainNavigationDrawer(),
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(70),
            child: HomeBar(),
          ),
        body: ListView(
          children: [
            SizedBox(
              height: 120,
            ),
            Text(
              'Download our app Today.\n',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: Str.POPPINS,
                fontWeight: FontWeight.w500,
                //wordSpacing: 2.5,
                letterSpacing: .8,
                color: Colors.black.withOpacity(.9),
                fontSize: 34.0,
              ),
            ),
            Container(
              // margin: EdgeInsets.symmetric(
              //     horizontal: MediaQuery.of(context).size.width * .12),
              child: headingStr(webInfo),
            ),
            SizedBox(
              height: 70.0,
            ),

              sizingInformation.deviceScreenType == DeviceScreenType.mobile 
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        googlePlay(),
                        SizedBox(
                          height: 25,
                        ),
                        appStore(),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        googlePlay(),
                        SizedBox(
                          width: 25,
                        ),
                        appStore(),
                      ],
                    ),
              SizedBox(
                height: 25.0,
              ),
            FooterView()
          ],
        ),
      ),
    );
  }

  Widget headingStr(webInfo) => Container(
        margin: EdgeInsets.only(
          top: 20.0,
          left: MediaQuery.of(context).size.width * .13,
          right: MediaQuery.of(context).size.width * .13,
        ),
        child: RichText(
          textAlign: TextAlign.center,
          text: new TextSpan(
            style: new TextStyle(
              height: 1.8,
              letterSpacing: .9,
            ),
            children: <TextSpan>[
              new TextSpan(
                text: '${webInfo.download_app.replaceAll("\\n", "\n")}',
                style: TextStyle(
                  fontFamily: Str.POPPINS,
                  fontWeight: FontWeight.w500,
                  //wordSpacing: 2.5,
                  letterSpacing: .8,
                  color: Colors.black.withOpacity(.6),

                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        ),
      );

      Widget googlePlay() => MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
           // _launchURL('https://play.google.com/store/apps');
          },
          child: Container(
            height: 70.0,
            width: 235,
            padding: EdgeInsets.symmetric(
              horizontal: 24,
            ),
            decoration: BoxDecoration(
              color: QuizJetsTheme.quizJetsBlue,
              borderRadius: BorderRadius.all(
                Radius.circular(6),
              ),
            ),
            child: Center(
              child: Row(
                children: [
                  Icon(
                    FontAwesomeIcons.googlePlay,
                    color: Colors.white,
                    size: 32.0,
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
                            color: Colors.white,
                            fontSize: 13.0,
                          ),
                        ),
                        new TextSpan(
                          text: 'Google Play',
                          style: TextStyle(
                            fontFamily: Str.POPPINS,
                            fontWeight: FontWeight.w600,
                            //wordSpacing: 2.5,
                            letterSpacing: .6,
                            color: Colors.white,
                            fontSize: 22.0,
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
           // _launchURL('https://www.apple.com/app-store/');
          },
          child: Container(
            height: 70.0,
            width: 235,
            padding: EdgeInsets.symmetric(
              horizontal: 30,
            ),
            decoration: BoxDecoration(
              color: QuizJetsTheme.quizJetsBlue,
              borderRadius: BorderRadius.all(
                Radius.circular(6),
              ),
            ),
            child: Center(
              child: Row(
                children: [
                  Icon(
                    FontAwesomeIcons.apple,
                    color: Colors.white,
                    size: 32.0,
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
                            color: Colors.white,
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
                            color: Colors.white,
                            fontSize: 22.0,
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

      _launchURL(_url) async {
    const url = 'https://flutter.io';
    if (await canLaunch(url)) {
      await launch(_url);
    } else {
      throw 'Could not launch $url';
    }
  }

}
