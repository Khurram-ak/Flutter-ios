import 'package:flutter/material.dart';
import 'package:quizjets/export_files.dart';
import 'package:responsive_builder/responsive_builder.dart';

class MyDetailsPage extends StatefulWidget {
  static const String route = '/my_details';

  @override
  _MyDetailsPageState createState() => _MyDetailsPageState();
}

class _MyDetailsPageState extends State<MyDetailsPage> {
  var userEmail = '';
  var fullName = '';
  var userId = '';

  @override
  void initState() {
    super.initState();
    initInfo();
  }

  initInfo() async {
    userEmail = await GetUserInfo().getCurrentUserEmail();
    fullName = await GetUserInfo().getCurrentUserName();
    userId = await GetUserInfo().getCurrentUserID();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainNavigationDrawer(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: HomeBar(),
      ),
      body: Container(
        child: ListView(
          children: [
            SizedBox(
              height: 120.0,
            ),
            ResponsiveBuilder(
              builder: (context, sizingInformation) => Container(
                margin: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * .2,
                  left: MediaQuery.of(context).size.width * .1,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    headingStr(),
                    // _divider(),
                    // Container(
                    //   margin: EdgeInsets.only(
                    //     right: 70.0,
                    //     bottom: 70,
                    //     top: 0,
                    //   ),
                    //   height: 130,
                    //   width: 130,
                    //   decoration: BoxDecoration(
                    //     color: Colors.black.withOpacity(.1),
                    //     shape: BoxShape.circle,
                    //   ),
                    // ),
                    RichText(
                      textAlign: TextAlign.start,
                      text: new TextSpan(
                        style: new TextStyle(
                          height: 1.2,
                          letterSpacing: .6,
                        ),
                        children: <TextSpan>[
                          new TextSpan(
                            text: 'Full Name\n\n',
                            style: TextStyle(
                              fontFamily: Str.POPPINS,
                              fontWeight: FontWeight.w600,
                              //wordSpacing: 2.5,
                              letterSpacing: .4,
                              color: Colors.black.withOpacity(.9),
                              fontSize: 18.0,
                            ),
                          ),
                          new TextSpan(
                            text: '$fullName',
                            style: TextStyle(
                              fontFamily: Str.POPPINS,
                              fontWeight: FontWeight.w500,
                              //wordSpacing: 2.5,
                              letterSpacing: .9,
                              color: Colors.black.withOpacity(.9),
                              fontSize: 17.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    _divider(),
                    RichText(
                      textAlign: TextAlign.start,
                      text: new TextSpan(
                        style: new TextStyle(
                          height: 1.2,
                          letterSpacing: .6,
                        ),
                        children: <TextSpan>[
                          new TextSpan(
                            text: 'Email\n\n',
                            style: TextStyle(
                              fontFamily: Str.POPPINS,
                              fontWeight: FontWeight.w600,
                              //wordSpacing: 2.5,
                              letterSpacing: .4,
                              color: Colors.black.withOpacity(.9),
                              fontSize: 18.0,
                            ),
                          ),
                          new TextSpan(
                            text: '$userEmail',
                            style: TextStyle(
                              fontFamily: Str.POPPINS,
                              fontWeight: FontWeight.w500,
                              //wordSpacing: 2.5,
                              letterSpacing: .9,
                              color: Colors.black.withOpacity(.9),
                              fontSize: 17.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 120.0,
            ),
            FooterView(),
          ],
        ),
      ),
    );
  }

  Widget _divider() => Container(
        margin: EdgeInsets.symmetric(
          vertical: 35.0,
        ),
        child: Divider(
          height: 1,
          color: Colors.black.withOpacity(.1),
        ),
      );

  Widget headingStr() => Container(
        margin: EdgeInsets.symmetric(
          vertical: 0.0,
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
                text: 'My Details\n\n\n\n',
                style: TextStyle(
                  fontFamily: Str.POPPINS,
                  fontWeight: FontWeight.w500,
                  //wordSpacing: 2.5,
                  letterSpacing: .6,
                  color: Colors.black.withOpacity(.9),
                  fontSize: 35.0,
                ),
              ),
              new TextSpan(
                text:
                    'Your account details are listed below. For security reasons,\nsome of this details are hidden.\n\n\n\n\n',
                style: TextStyle(
                  fontFamily: Str.POPPINS,
                  fontWeight: FontWeight.w500,
                  //wordSpacing: 2.5,
                  letterSpacing: .4,
                  color: Colors.black.withOpacity(.7),
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
        ),
      );
}
