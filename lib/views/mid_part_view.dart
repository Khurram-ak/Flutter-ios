import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quizjets/export_files.dart';
import 'package:responsive_builder/responsive_builder.dart';

class MidPartVIew extends StatefulWidget {
  @override
  _MidPartVIewState createState() => _MidPartVIewState();
}

class _MidPartVIewState extends State<MidPartVIew> {
  @override
  Widget build(BuildContext context) {
    var webInfo = Provider.of<WebInfo>(context);
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(
          horizontal: (MediaQuery.of(context).size.width < 1150)
              ? 30
              : MediaQuery.of(context).size.width * .13,
        ),
        height: sizingInformation.deviceScreenType == DeviceScreenType.mobile
            ? 250
            : 310.0,
        child: sizingInformation.deviceScreenType == DeviceScreenType.tablet ||
                sizingInformation.deviceScreenType == DeviceScreenType.mobile
            ? ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  midTile('assets/svgs/aircraft_icon.svg',
                      '${webInfo.special_aircrafts}', 'Aircraft.'),
                  SizedBox(
                    width: 20,
                  ),
                  midTile('assets/svgs/pilot_two_icon.svg',
                      '${webInfo.enrolled_students}', 'Pilots.'),
                  SizedBox(
                    width: 20,
                  ),
                  midTile2(FontAwesomeIcons.bookReader,
                      '${webInfo.quizjets_subjects}', 'QuizJets Subjects.'),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  midTile('assets/svgs/aircraft_icon.svg',
                      '${webInfo.special_aircrafts}', 'Aircraft.'),
                  midTile('assets/svgs/pilot_two_icon.svg',
                      '${webInfo.enrolled_students}', 'Pilots.'),
                  midTile2(FontAwesomeIcons.bookReader,
                      '${webInfo.quizjets_subjects}', 'QuizJets Subjects.'),
                ],
              ),
      ),
    );
  }

  Widget midTile(var _icons, var title, var subStr) => Container(
        child: Row(
          children: [
            // Card(
            //   elevation: 5,
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(10),
            //   ),
            //   child: Center(
            //     child: Icon(
            //       _icons,
            //       size: 60.0,
            //       color: QuizJetsTheme.quizJetsBlue,
            //     ),
            //   ),
            // ),
            Container(
              height: 110.0,
              width: 110.0,
              decoration: BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.circle,
              ),
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60),
                ),
                child: Center(
                  child: SizedBox(
                    height: 60,
                    width: 60,
                    child: SvgPicture.asset(
                      _icons,
                      color: QuizJetsTheme.quizJetsBlue,
                    ),
                  )
                  // child: Icon(
                  //   _icons,
                  //   size: 38.0,
                  //   color: QuizJetsTheme.quizJetsBlue,
                  // ),
                ),
              ),
            ),
            SizedBox(
              width: 30.0,
            ),
            RichText(
              textAlign: TextAlign.start,
              text: new TextSpan(
                style: new TextStyle(
                  height: 1.4,
                  letterSpacing: .6,
                ),
                children: <TextSpan>[
                  new TextSpan(
                    text: '$title\n',
                    style: TextStyle(
                      fontFamily: Str.POPPINS,
                      fontWeight: FontWeight.w500,
                      //wordSpacing: 2.5,
                      letterSpacing: 1,
                      color: Colors.black.withOpacity(.8),
                      fontSize: 30.0,
                    ),
                  ),
                  new TextSpan(
                    text: '$subStr',
                    style: TextStyle(
                      fontFamily: Str.POPPINS,
                      fontWeight: FontWeight.w500,
                      //wordSpacing: 2.5,
                      color: Colors.black.withOpacity(.8),
                      fontSize: 17.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

      Widget midTile2(var _icons, var title, var subStr) => Container(
        child: Row(
          children: [
            // Card(
            //   elevation: 5,
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(10),
            //   ),
            //   child: Center(
            //     child: Icon(
            //       _icons,
            //       size: 60.0,
            //       color: QuizJetsTheme.quizJetsBlue,
            //     ),
            //   ),
            // ),
            Container(
              height: 110.0,
              width: 110.0,
              decoration: BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.circle,
              ),
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60),
                ),
                child: Center(
                  
                  child: Icon(
                    _icons,
                    size: 38.0,
                    color: QuizJetsTheme.quizJetsBlue,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 30.0,
            ),
            RichText(
              textAlign: TextAlign.start,
              text: new TextSpan(
                style: new TextStyle(
                  height: 1.4,
                  letterSpacing: .6,
                ),
                children: <TextSpan>[
                  new TextSpan(
                    text: '$title\n',
                    style: TextStyle(
                      fontFamily: Str.POPPINS,
                      fontWeight: FontWeight.w500,
                      //wordSpacing: 2.5,
                      letterSpacing: 1,
                      color: Colors.black.withOpacity(.8),
                      fontSize: 30.0,
                    ),
                  ),
                  new TextSpan(
                    text: '$subStr',
                    style: TextStyle(
                      fontFamily: Str.POPPINS,
                      fontWeight: FontWeight.w500,
                      //wordSpacing: 2.5,
                      color: Colors.black.withOpacity(.8),
                      fontSize: 15.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
