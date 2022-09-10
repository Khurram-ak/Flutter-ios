import 'package:flutter/material.dart';
import 'package:quizjets/export_files.dart';
import 'package:intl/intl.dart';
import 'package:responsive_builder/responsive_builder.dart';

class PurchasesPage extends StatefulWidget {
  static const String route = '/purchases';

  @override
  _PurchasesPageState createState() => _PurchasesPageState();
}

class _PurchasesPageState extends State<PurchasesPage> {
  var userId = '';
  @override
  void initState() {
    super.initState();
    initInfo();
  }

  initInfo() async {
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
      body: ListView(
        children: [
          SizedBox(
            height: 100.0,
          ),
          ResponsiveBuilder(
            builder: (context, sizingInformation) => Container(
              margin: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * .2,
                left: sizingInformation.deviceScreenType ==
                        DeviceScreenType.mobile || sizingInformation.deviceScreenType ==
                          DeviceScreenType.tablet
                    ? 30
                    : MediaQuery.of(context).size.width * .11,
              ),
              child: Text(
                'My Subscriptions\n',
                style: TextStyle(
                  fontFamily: Str.POPPINS,
                  fontWeight: FontWeight.w500,
                  //wordSpacing: 2.5,
                  letterSpacing: .6,
                  color: Colors.black.withOpacity(.9),
                  fontSize: 35.0,
                ),
              ),
            ),
          ),
          // headingStr(),
          //  Container(
          //     margin: EdgeInsets.only(
          //       right: MediaQuery.of(context).size.width * .2,
          //       left: MediaQuery.of(context).size.width * .11,
          //     ),
          //     child: ,
          //   ),
          StreamProvider<List<Purchase>>.value(
            initialData: [],
            value: DatabaseServices().streamPurchases(userId),
            child: PurchaseList(),
          ),

          SizedBox(
            height: 160.0,
          ),
          SizedBox(
            height: 40.0,
          ),
          FooterView(),
        ],
      ),
    );
  }
}

class PurchaseList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var purchases = Provider.of<List<Purchase>>(context) ?? [];
    if (purchases.isEmpty) {
      return Container(
        margin: EdgeInsets.all(
          80.0,
        ),
        child: Center(
          child: Text(
            'You have no purchases : (',
            style: TextStyle(
              fontFamily: Str.POPPINS,
              fontWeight: FontWeight.w500,
              //wordSpacing: 2.5,
              letterSpacing: .6,
              color: Colors.black.withOpacity(.9),
              fontSize: 17.0,
            ),
          ),
        ),
      );
    }
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: purchases.length,
      itemBuilder: (BuildContext ctxt, int index) {
        if (purchases.isEmpty) {
          return Center(
            child: Text(
              'You have no purchases : (',
              style: TextStyle(
                fontFamily: Str.POPPINS,
                fontWeight: FontWeight.w500,
                //wordSpacing: 2.5,
                letterSpacing: .6,
                color: Colors.black.withOpacity(.9),
                fontSize: 17.0,
              ),
            ),
          );
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ResponsiveBuilder(
              builder: (context, sizingInformation) => Container(
                //height: 190,
                margin: EdgeInsets.only(
                  right: sizingInformation.deviceScreenType ==
                          DeviceScreenType.mobile || sizingInformation.deviceScreenType ==
                          DeviceScreenType.tablet
                      ? 30
                      : MediaQuery.of(context).size.width * .25,
                  left: sizingInformation.deviceScreenType ==
                          DeviceScreenType.mobile || sizingInformation.deviceScreenType ==
                          DeviceScreenType.tablet
                      ? 30
                      : MediaQuery.of(context).size.width * .11,
                ),
                child: Row(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CartPhoto(
                      imageUrl: purchases[index].icon,
                      deviceScreenType: sizingInformation,
                    ),
                    Container(
                      width: sizingInformation.deviceScreenType ==
                              DeviceScreenType.mobile || sizingInformation.deviceScreenType ==
                          DeviceScreenType.tablet
                          ? MediaQuery.of(context).size.width * .28
                          : MediaQuery.of(context).size.width * .35,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${purchases[index].name}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: Str.POPPINS,
                              fontWeight: FontWeight.w600,
                              //wordSpacing: 2.5,
                              letterSpacing: .6,
                              height: 2.5,
                              color: Colors.black.withOpacity(.9),
                              fontSize: 17.0,
                            ),
                          ),
                          Text(
                            '${purchases[index].desc}',
                            maxLines: sizingInformation.deviceScreenType ==
                                    DeviceScreenType.mobile || sizingInformation.deviceScreenType ==
                          DeviceScreenType.tablet
                                ? 2
                                : 4,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: Str.POPPINS,
                              fontWeight: FontWeight.w500,
                              //wordSpacing: 2.5,
                              height: 1.5,
                              letterSpacing: 1,
                              color: Colors.black.withOpacity(.7),
                              fontSize: 14.0,
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Text(
                            purchases[index].monthly
                                ? 'Expires on ${DateFormat('d MMM yyyy - kk:mm a').format(purchases[index].date.toDate().add(const Duration(days: 30)))}'
                                : 'Expires on ${DateFormat('d MMM yyyy - kk:mm a').format(purchases[index].date.toDate().add(const Duration(days: 365)))}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: Str.POPPINS,
                              fontWeight: FontWeight.w600,
                              //wordSpacing: 2.5,
                              height: 1.5,
                              letterSpacing: 1,
                              color: QuizJetsTheme.quizJetsBlue.withOpacity(.9),
                              fontSize: 14.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    sizingInformation.deviceScreenType ==
                            DeviceScreenType.mobile || sizingInformation.deviceScreenType ==
                          DeviceScreenType.tablet
                        ? SizedBox(
                            width: 10,
                          )
                        : Expanded(
                            child: Container(),
                          ),
                    Container(
                      height: 45,
                      width: sizingInformation.deviceScreenType ==
                              DeviceScreenType.mobile || sizingInformation.deviceScreenType ==
                          DeviceScreenType.tablet
                          ? 80
                          : 95,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                        color: QuizJetsTheme.quizJetsBlue.withOpacity(.7),
                      ),
                      child: TextButton(
                        onPressed: () {
                          // Navigator.pushNamed(
                          //   context,
                          //   WebCategoriesPage.route,
                          //   arguments: '${purchases[index].name}',
                          // );
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WebCategoriesPage(
                                subjectId: '${purchases[index].name}',
                              ),
                            ),
                          );
                        },
                        child: Center(
                          child: Text(
                            'OPEN',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: Str.POPPINS,
                              fontWeight: FontWeight.w500,
                              //wordSpacing: 2.5,
                              height: 1.5,
                              letterSpacing: 1,
                              color: Colors.white,
                              fontSize: 16.5,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * .25,
                left: MediaQuery.of(context).size.width * .11,
                top: 40.0,
                bottom: 20,
              ),
              child: Divider(
                color: Colors.black.withOpacity(
                  .1,
                ),
                height: 1,
              ),
            )
          ],
        );
      },
    );
  }
}
