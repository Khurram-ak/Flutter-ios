

import 'package:flutter/material.dart';
import 'package:quizjets/export_files.dart';

class CategoriesPage extends StatefulWidget {
  final subject;

  CategoriesPage({
    this.subject,
  });
  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  List<Question> questionsList = [];

  @override
  void initState() {
    super.initState();
    //initConfidence();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var screenOrientation = MediaQuery.of(context).orientation;

    /*24 is for notification bar on Android*/
    double itemHeight = screenOrientation == Orientation.portrait ? 190 : 300;
    double itemWidth = size.width / 2;

    return AnimatedTheme(
      duration: Duration(milliseconds: 300),
      data: Theme.of(context),
      child: Scaffold(
        appBar: actionBar(),
        body: OrientationBuilder(
          builder: (context, orientation) {
            return Container(
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
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    child: StreamBuilder(
                        stream:
                            GetCategories().getCategories(widget.subject), //
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
                          );
                        }),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget actionBar() => AppBar(
        iconTheme: new IconThemeData(color: Colors.grey),
        title: Text(
          "SELECT CATEGORY",
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
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {
              //_showFilterDialog();
              Navigator.push(
                context,
                SlideUpRoute(
                  page: FilterPage(),
                ),
              );
            },
          ),
        ],
      );

  gridCard(
    var icon,
    String heading,
    String categoryId,
    String categoryImg,
  ) =>
      Container(
        margin: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
        child: Column(
          children: [
            InkWell(
              onTap: () async {
                if (categoryId == '100') {
                  Navigator.push(
                    context,
                    SlideUpRoute(
                      page: FilterPage(),
                    ),
                  );
                  return;
                }

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuestionPage(
                      subject: widget.subject,
                      title: heading,
                      categoryId: categoryId,
                    ),
                  ),
                );
              },
              child: Container(
                height:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? 110
                        : 120,
                padding: EdgeInsets.all(
                  0,
                ),
                decoration: new BoxDecoration(
                  color: Colors.grey.withOpacity(.3),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  image: DecorationImage(
                    image:
                        CachedNetworkImageProvider('$categoryImg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: Icon(
                    icon,
                    size: 50.0,
                    color: Colors.transparent,
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
                fontSize: 12,
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

  void _showFilterDialog() {
    // flutter defined function
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        // return alert dialog object
        int _levelValue = 0;
        return AlertDialog(
          //backgroundColor: Colors.white,
          title: new Text(
            "DEFAULT CONFIDENCE LEVELS ",
            style: TextStyle(
                fontSize: 15.5,
                color: Colors.grey,
                fontFamily: Str.POPPINS,
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          content: Container(
            height: 100.0,
            child: Row(
              children: [
                Text(
                  "Low",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: Str.POPPINS,
                      color: Colors.grey,
                      fontSize: 11.0),
                ),
                Expanded(
                  child: Slider(
                    value: _levelValue.toDouble(),
                    min: 0,
                    max: 100,
                    divisions: 3,
                    activeColor: Color(0xFF007EC7),
                    onChanged: (double value) {
                      setState(
                        () {
                          _levelValue = value.round();
                        },
                      );
                    },
                  ),
                ),
                Text(
                  "V-High",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: Str.POPPINS,
                      color: Colors.grey,
                      fontSize: 11.0),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}



