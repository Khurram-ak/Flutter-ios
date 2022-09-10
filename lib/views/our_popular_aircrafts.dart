import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quizjets/export_files.dart';
import 'package:quizjets/widgets/aircraft_tile.dart';
import 'package:quizjets/widgets/card_tile.dart';

import 'package:responsive_builder/responsive_builder.dart';

class OurPopularAircraftsView extends StatefulWidget {
  @override
  _OurPopularCourseViewState createState() => _OurPopularCourseViewState();
}

class _OurPopularCourseViewState extends State<OurPopularAircraftsView> {
  bool exist;
  bool loading = true;
  StreamSubscription<DocumentSnapshot> subscription;
  final spinkit = SpinKitThreeBounce(
    color: Color(0xFF007EC7),
    size: 35.0,
  );

  @override
  void dispose() {
    // TODO: implement dispose
    subscription.cancel();
    super.dispose();
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
          vertical:
              sizingInformation.deviceScreenType == DeviceScreenType.mobile
                  ? 30
                  : 70.0,
        ),
        child: sizingInformation.deviceScreenType == DeviceScreenType.mobile
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  headingStr(),
                  horiDash(),
                  SizedBox(
                    height: 40,
                  ),
                  CardTile(
                    id: planesList[0].id,
                    icons: planesList[0].icon,
                    name: planesList[0].name,
                    desc: planesList[0].desc,
                    price: planesList[0].cost,
                    comingSoon: planesList[0].active,
                    loggedIn: loggedIn,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  CardTile(
                    id: planesList[1].id,
                    icons: planesList[1].icon,
                    name: planesList[1].name,
                    desc: planesList[1].desc,
                    price: planesList[1].cost,
                    comingSoon: planesList[1].active,
                    loggedIn: loggedIn,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  CardTile(
                    id: planesList[0].id,
                    icons: planesList[0].icon,
                    name: planesList[0].name,
                    desc: planesList[0].desc,
                    price: planesList[0].cost,
                    comingSoon: planesList[0].active,
                    loggedIn: loggedIn,
                  ),
                  //viewAllCourses(),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  headingStr(),
                  horiDash(),
                  SizedBox(
                    height: 40,
                  ),
                  planesList == null
                      ? Center(
                          child: spinkit,
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AircraftTile(
                              id: planesList[0].id,
                              icons: planesList[0].icon,
                              name: planesList[0].name,
                              desc: planesList[0].desc,
                              price: planesList[0].cost,
                              comingSoon: planesList[0].active,
                              loggedIn: loggedIn,
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            AircraftTile(
                              id: planesList[1].id,
                              icons: planesList[1].icon,
                              name: planesList[1].name,
                              desc: planesList[1].desc,
                              price: planesList[1].cost,
                              comingSoon: planesList[1].active,
                              loggedIn: loggedIn,
                            ),
                            sizingInformation.deviceScreenType ==
                                    DeviceScreenType.tablet
                                ? Container()
                                : SizedBox(
                                    width: 20.0,
                                  ),
                            sizingInformation.deviceScreenType ==
                                    DeviceScreenType.tablet
                                ? Container()
                                : AircraftTile(
                                    id: planesList[0].id,
                                    icons: planesList[0].icon,
                                    name: planesList[0].name,
                                    desc: planesList[0].desc,
                                    price: planesList[0].cost,
                                    comingSoon: planesList[0].active,
                                    loggedIn: loggedIn,
                                  ),
                          ],
                        ),
                  //viewAllCourses(),
                ],
              ),
      ),
    );
  }

  Widget _cardTile(
    planesList,
    deviceScreenType,
    index,
  ) =>
      Container(
        height: 370,
        child: Card(
          elevation: 10,
          child: GestureDetector(
            onTap: () {},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyImage(
                  imageUrl: "${planesList[index].icon}",
                  deviceScreenType: deviceScreenType,
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 25.0,
                    right: 25.0,
                    top: 10.0,
                  ),
                  child: Text(
                    '${planesList[index].name}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 18,
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
                      //   'Cost: \$${planesList[index].cost}',
                      //   maxLines: 3,
                      //   overflow: TextOverflow.ellipsis,
                      //   style: TextStyle(
                      //     fontSize: 17,
                      //     fontFamily: Str.POPPINS,
                      //     fontWeight: FontWeight.w500,
                      //     letterSpacing: .6,
                      //     wordSpacing: 2.5,
                      //     color: QuizJetsTheme.quizJetsBlue.withOpacity(.6),
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
                    '${planesList[index].desc}',
                    maxLines: 2,
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
                      //addToCartBtn(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );

  Widget headingStr() => Container(
        child: Text(
          'Our Popular Aircraft',
          style: TextStyle(
            fontSize: 28.0,
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
        width: 80,
        height: 5,
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
