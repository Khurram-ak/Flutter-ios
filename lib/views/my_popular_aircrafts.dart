import 'package:flutter/material.dart';
import 'package:quizjets/export_files.dart';
import 'package:quizjets/widgets/aircraft_tile.dart';

import 'package:responsive_builder/responsive_builder.dart';

class MyPopularAircraftsView extends StatefulWidget {
  @override
  _OurPopularCourseViewState createState() => _OurPopularCourseViewState();
}

class _OurPopularCourseViewState extends State<MyPopularAircraftsView> {
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
    var planesList = Provider.of<List<Subject>>(context) ?? [];
    var user = Provider.of<User>(context);
    bool loggedIn = user != null;

    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Container(
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
            sizingInformation.deviceScreenType == DeviceScreenType.mobile
                ? Container(
                    height: 487,
                    width: 420.0,
                    child: Card(
                      elevation: 10,
                      child: GestureDetector(
                        onTap: () {},
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyImage(
                              imageUrl: "${planesList[1].icon}",
                            ),
                           
                            Container(
                              margin: EdgeInsets.only(
                                left: 25.0,
                                right: 25.0,
                                top: 10.0,
                              ),
                              child: Text(
                                "${planesList[1].name}",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: Str.POPPINS,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: .8,
                                  wordSpacing: 2.5,
                                  color: Colors.black.withOpacity(.9),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                left: 25.0,
                                right: 25.0,
                                top: 10.0,
                              ),
                              child: Row(
                                children: [
                                  // Icon(
                                  //   Icons.help_center_outlined,
                                  //   size: 19.0,
                                  //   color: Colors.black.withOpacity(.6),
                                  // ),
                                  // SizedBox(
                                  //   width: 10,
                                  // ),
                                  Text(
                                    'Cost: \$${planesList[1].cost}',
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontFamily: Str.POPPINS,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: .6,
                                      wordSpacing: 2.5,
                                      color: QuizJetsTheme.quizJetsBlue
                                          .withOpacity(.6),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                vertical: 5.0,
                                horizontal: 30.0,
                              ),
                              child: Text(
                                '${planesList[1].desc}',
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: Str.POPPINS,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: .6,
                                  wordSpacing: 2.5,
                                  color: Colors.black.withOpacity(.8),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                bottom: 23.0,
                                right: 30.0,
                                top: 13,
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(),
                                  ),
                                  addToCartBtn(),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // AircraftTile(
                      //   id: planesList[0].id,
                      //   icons: planesList[0].icon,
                      //   name: planesList[0].name,
                      //   desc: planesList[0].desc,
                      //   price: planesList[0].cost,
                      //   comingSoon: planesList[0].coming_soon,
                      //   loggedIn: loggedIn,
                      // ),
                      // SizedBox(
                      //   width: 20.0,
                      // ),
                      Container(
                        height: 487,
                        width: 420.0,
                        child: Card(
                          elevation: 10,
                          child: GestureDetector(
                            onTap: () {},
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyImage(
                                  imageUrl: "${planesList[1].icon}",
                                ),
                                // Container(
                                //   height: 200.0,
                                //   decoration: BoxDecoration(
                                //     image: DecorationImage(
                                //       image: NetworkImage("$_icons"),
                                //       fit: BoxFit.cover,
                                //     ),
                                //     color: Colors.black.withOpacity(.3),
                                //     borderRadius: BorderRadius.only(
                                //       topLeft: Radius.circular(6),
                                //       topRight: Radius.circular(6),
                                //     ),
                                //   ),
                                //   //child: Image.network("$_icons"),
                                // ),
                                Container(
                                  margin: EdgeInsets.only(
                                    left: 25.0,
                                    right: 25.0,
                                    top: 10.0,
                                  ),
                                  child: Text(
                                    "${planesList[1].name}",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: Str.POPPINS,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: .8,
                                      wordSpacing: 2.5,
                                      color: Colors.black.withOpacity(.9),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    left: 25.0,
                                    right: 25.0,
                                    top: 10.0,
                                  ),
                                  child: Row(
                                    children: [
                                      // Icon(
                                      //   Icons.help_center_outlined,
                                      //   size: 19.0,
                                      //   color: Colors.black.withOpacity(.6),
                                      // ),
                                      // SizedBox(
                                      //   width: 10,
                                      // ),
                                      // Text(
                                      //   'Cost: \$${planesList[1].cost}',
                                      //   maxLines: 3,
                                      //   overflow: TextOverflow.ellipsis,
                                      //   style: TextStyle(
                                      //     fontSize: 17,
                                      //     fontFamily: Str.POPPINS,
                                      //     fontWeight: FontWeight.w500,
                                      //     letterSpacing: .6,
                                      //     wordSpacing: 2.5,
                                      //     color: QuizJetsTheme.quizJetsBlue
                                      //         .withOpacity(.6),
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                    vertical: 5.0,
                                    horizontal: 30.0,
                                  ),
                                  child: Text(
                                    '${planesList[1].desc}',
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: Str.POPPINS,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: .6,
                                      wordSpacing: 2.5,
                                      color: Colors.black.withOpacity(.8),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    bottom: 23.0,
                                    right: 30.0,
                                    top: 13,
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Container(),
                                      ),
                                      addToCartBtn(),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      
                      Expanded(
                        child: Container(),
                      ),
                    ],
                  ),
            //viewAllCourses(),
          ],
        ),
      ),
    );
  }

  Widget addToCartBtn() => Container(
        height: 45.0,
        width: 140.0,
        margin: EdgeInsets.only(
          left: 0,
          top: 0.0,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 9.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(4.0),
          ),
          color: QuizJetsTheme.quizJetsBlue,
        ),
        child: Center(
          child: TextButton(
            onPressed: () async {},
            child: Text(
              'Coming Soon',
              style: TextStyle(
                fontSize: 14.5,
                fontFamily: Str.POPPINS,
                fontWeight: FontWeight.w600,
                //letterSpacing: .4,
                wordSpacing: 2.5,
                color: Colors.white,
              ),
            ),
          ),
        ),
      );

  Widget headingStr() => Container(
        child: Text(
          'Our Popular Aircraft',
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
