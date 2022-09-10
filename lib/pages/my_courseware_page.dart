import 'package:flutter/material.dart';
import 'package:quizjets/export_files.dart';
import 'package:quizjets/widgets/courseware_bar.dart';

class MyCoursewarePage extends StatefulWidget {
  static const String route = '/my_courseware';

  @override
  _MyCoursewarePageState createState() => _MyCoursewarePageState();
}

class _MyCoursewarePageState extends State<MyCoursewarePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainNavigationDrawer(),
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: CourseBar(),
        ),
      body: ListView(children: [
        //headingStr(),
        SizedBox(
          height: 20,
        ),
        MyAircraftsView(),
        SizedBox(
          height: 10,
        ),
        MyPopularAircraftsView(),
        SizedBox(
          height: 20,
        ),
        FooterView(),
      ]),
    );
  }

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
                text: 'Super simple pricing\n\n',
                style: TextStyle(
                  fontFamily: Str.POPPINS,
                  fontWeight: FontWeight.w500,
                  //wordSpacing: 2.5,
                  letterSpacing: .6,
                  color: Colors.black.withOpacity(.9),
                  fontSize: 45.0,
                ),
              ),
              new TextSpan(
                text: 'These are a selection of my recent\nworks.',
                style: TextStyle(
                  fontFamily: Str.POPPINS,
                  fontWeight: FontWeight.w500,
                  //wordSpacing: 2.5,
                  letterSpacing: .8,
                  color: Colors.black.withOpacity(.6),
                  fontSize: 21.0,
                ),
              ),
            ],
          ),
        ),
      );
}
