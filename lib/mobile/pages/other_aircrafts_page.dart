

import 'package:flutter/material.dart';

import '../../export_files.dart';

class OtherAircraftsPage extends StatefulWidget {
  final subject;

  OtherAircraftsPage({this.subject});
  @override
  _OtherAircraftsPageState createState() => _OtherAircraftsPageState();
}

class _OtherAircraftsPageState extends State<OtherAircraftsPage> {
  List<Question> questionsList = [];

  @override
  void initState() {
    super.initState();
    //checkExist();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedTheme(
      duration: Duration(milliseconds: 300),
      data: Theme.of(context),
      child: Scaffold(
        appBar: actionBar(),
        drawer: MainNavigationDrawer(),
        body: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 0.0,
            vertical: 10.0,
          ),
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: 5.0,
                ),
                child: StreamBuilder(
                          stream: GetSubjects().getOtherSubjects(), //
                          //initialData: initialData ,
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return Center(
                                child: const CircularProgressIndicator(),
                              );
                            }
                            return GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2),
                              itemBuilder: (BuildContext context, int index) {
                                return gridCard(
                                  Icons.flight,
                                  snapshot.data.docs[index]['name'],
                                  snapshot.data.docs[index]['id'],
                                  snapshot.data.docs[index]['icon'],
                                );
                              },
                              itemCount: snapshot.data.docs.length,
                            );
                          }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget actionBar() => AppBar(
        iconTheme: new IconThemeData(color: Colors.grey),
        title: Text(
          "AVAILABLE AIRCRAFTS",
          style: TextStyle(
            fontSize: 17,
            color: Colors.grey,
            fontFamily: Str.POPPINS,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.2,
          ),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            //color: Colors.a,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      );

  gridCard(
    var icon,
    String heading,
    String id,
    String categoryImg,
  ) =>
      Container(
        margin: EdgeInsets.all(
          5.0,
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(
                25,
              ),
              decoration: new BoxDecoration(
                color: Colors.grey.withOpacity(.3),
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: CachedNetworkImageProvider('$categoryImg')
                  //image:  CachedNetworkImageProvider('$categoryImg'),
                ),
                // image: DecorationImage(
                //   image: NetworkImage('$categoryImg'),
                //   fit: BoxFit.cover,
                // ),
              ),
              child: Center(
                child: InkWell(
                  child: Icon(
                    icon,
                    size: 50.0,
                    color: Colors.transparent,
                  ),
                  onTap: () {
                   
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => CategoriesPage(subject: heading)
                    //       ),
                    // );
                  },
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
