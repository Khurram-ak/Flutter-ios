import 'package:flutter/material.dart';
import 'package:quizjets/export_files.dart';
import 'package:quizjets/widgets/aircraft_tile.dart';
import 'package:quizjets/widgets/my_aircraft_tile.dart';

import 'package:responsive_builder/responsive_builder.dart';

class MyAircraftsView extends StatefulWidget {
  @override
  _OurPopularCourseViewState createState() => _OurPopularCourseViewState();
}

class _OurPopularCourseViewState extends State<MyAircraftsView> {
  final spinkit = SpinKitThreeBounce(
    color: Color(0xFF007EC7),
    size: 35.0,
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User>(context);
    bool loggedIn = user != null;

    return ResponsiveBuilder(
      builder: (context, sizingInformation) =>
          Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: (MediaQuery.of(context).size.width < 1150)
                        ? 30
                        : MediaQuery.of(context).size.width * .11,
                    vertical: 70.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      headingStr(),
                      horiDash(),
                      SizedBox(
                        height: 40,
                      ),

                      StreamProvider<List<Purchase>>.value(
                        initialData: [],
                        value: DatabaseServices().streamPurchases(user.uid),
                        child: Container(
                          height: 500,
                          child: sizingInformation.deviceScreenType ==
                                  DeviceScreenType.mobile
                              ? MyAircraftTile(
                                      index: 0,
                                    )
                              : Row(
                                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    MyAircraftTile(
                                      index: 0,
                                    ),
                                    Expanded(
                                      child: Container(),
                                    ),
                                    // SizedBox(
                                    //   width: 20.0,
                                    // ),
                                    // MyAircraftTile(

                                    // ),
                                    // SizedBox(
                                    //   width: 20.0,
                                    // ),
                                    // MyAircraftTile(

                                    // ),
                                  ],
                                ),
                        ),
                      ),
                      //viewAllCourses(),
                    ],
                  ),
                ),
    );
  }

  Widget headingStr() => Container(
        child: Text(
          'My Courseware',
          style: TextStyle(
            fontSize: 30.5,
            fontFamily: Str.POPPINS,
            fontWeight: FontWeight.w600,
            //letterSpacing: .4,
            wordSpacing: 2.5,
            color: Colors.black.withOpacity(.9),
          ),
        ),
      );

  Widget horiDash() => Container(
        margin: EdgeInsets.symmetric(
          vertical: 15,
        ),
        width: 90,
        height: 6,
        decoration: BoxDecoration(
          color: QuizJetsTheme.quizJetsBlue,
          borderRadius: BorderRadius.all(
            Radius.circular(24),
          ),
        ),
      );

  Widget viewAllCourses() => Container(
        margin: EdgeInsets.symmetric(
          vertical: 50.0,
        ),
        child: Center(
          child: Row(
            children: [
              TextButton(
                onPressed: () {},
                child: Text(
                  'View all QuizJets subjects',
                  style: TextStyle(
                    fontSize: 19.5,
                    fontFamily: Str.POPPINS,
                    fontWeight: FontWeight.w600,
                    //letterSpacing: .4,
                    wordSpacing: 2.5,
                    color: QuizJetsTheme.quizJetsBlue,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_right_outlined,
                  size: 18.0,
                  color: QuizJetsTheme.quizJetsBlue,
                ),
              ),
            ],
          ),
        ),
      );
}
