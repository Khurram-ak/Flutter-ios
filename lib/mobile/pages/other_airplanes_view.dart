

import 'package:flutter/material.dart';
import 'package:quizjets/export_files.dart';

class OtherAirplaneView extends StatefulWidget {
  @override
  _OtherAirplaneViewState createState() => _OtherAirplaneViewState();
}

class _OtherAirplaneViewState extends State<OtherAirplaneView> {
  final spinkit = SpinKitThreeBounce(
    color: Color(0xFF007EC7),
    size: 35.0,
  );
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var screenOrientation = MediaQuery.of(context).orientation;

    /*24 is for notification bar on Android*/
    double itemHeight = screenOrientation == Orientation.portrait ? 190 : 300;
    double itemWidth = size.width / 2;
    return OrientationBuilder(
      builder: (context, orientation) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: 0.0,
            vertical: 10.0,
          ),
          child: Stack(
            children: [
              Container(
                height: 190,
                margin: EdgeInsets.only(
                  top: 70.0,
                  right: 15,
                  left: 15,
                ),
                padding: EdgeInsets.only(
                  top: 5.0,
                ),
                child: StreamBuilder(
                  stream: GetSubjects().getOtherSubjects(), //
                  //initialData: initialData ,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return spinkit;
                    }
                    if (!snapshot.hasData) {
                      return Center(
                        child: spinkit,
                      );
                    }
                    return Container(
                      height: 190,
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: (itemWidth / itemHeight),
                          crossAxisCount:
                              orientation == Orientation.portrait ? 2 : 3,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return gridCard(
                            Icons.flight,
                            snapshot.data.docs[index]['name'],
                            snapshot.data.docs[index]['id'],
                            snapshot.data.docs[index]['icon'],
                          );
                        },
                        itemCount: snapshot.data.docs.length,
                      ),
                    );
                  },
                ),
              ),
              Container(
                height: 40,
                width: MediaQuery.of(context).size.width,
                color: Colors.grey.withOpacity(.3),
                child: Center(
                  child: Text(
                    "Other Aircraft Available",
                    style: TextStyle(
                      fontSize: 12.5,
                      //color: Colors.grey,
                      fontFamily: Str.POPPINS,
                      fontWeight: FontWeight.w600,
                      letterSpacing: .8,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  gridCard(
    var icon,
    String heading,
    String id,
    String categoryImg,
  ) =>
      Container(
        margin: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                if (id == 'others') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OtherAircraftsPage()),
                  );
                  return;
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CategoriesPage(subject: heading)),
                );
              },
              child: Container(
                padding: EdgeInsets.all(
                  25,
                ),
                decoration: new BoxDecoration(
                  color: Colors.grey.withOpacity(.3),
                  //shape: BoxShape.circle,
                  image: DecorationImage(
                    image:
                        CachedNetworkImageProvider('$categoryImg'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Center(
                  child: Icon(
                    icon,
                    color: Colors.transparent,
                    size: 50.0,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              heading,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey,
                fontFamily: Str.POPPINS,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.2,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
}
