import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:quizjets/export_files.dart';
import 'package:quizjets/widgets/pricing_bar.dart';
import 'package:responsive_builder/responsive_builder.dart';

class PricingPage extends StatefulWidget {
  static const String route = '/pricing';

  @override
  _PricingPageState createState() => _PricingPageState();
}

class _PricingPageState extends State<PricingPage> {
  @override
  Widget build(BuildContext context) {
    var pricing = Provider.of<List<Pricing>>(context) ?? [];
    return Scaffold(
      drawer: MainNavigationDrawer(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: PricingBar(),
      ),
      body: ListView(children: [
        headingStr(),
        priceRow(pricing, context),
        FooterView(),
      ]),
    );
  }

  void _showExistAlertDialog(
    subId,
    context,
    pricing,
    id,
    price,
    _name,
    _desc,
  ) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return alert dialog object
        return AlertDialog(
          //backgroundColor: Colors.white,
          title: new Text(
            "Are you sure you want to add $pricing subscripition\n"
            "to cart? Other subscripitions will be removed",
            style: TextStyle(
                fontSize: 19,
                color: Colors.grey,
                fontFamily: Str.POPPINS,
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.start,
          ),
          //content: phoneTextField(),
          actions: <Widget>[
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: new Text(
                  "  CANCEL     \n",
                  style: TextStyle(
                      fontSize: 17,
                      // color: Colors.black.withOpacity(.5),
                      fontFamily: Str.POPPINS,
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Text(
              "   ",
              style: TextStyle(
                  fontSize: 14.5,
                  color: Color(0xFF007EC7),
                  fontFamily: Str.POPPINS,
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () async {
                  Navigator.of(context).pop();
                  removeOtherSubscripiton(subId);
                  DatabaseServices().addToCart(
                    id,
                    context,
                    int.parse(price),
                    _name,
                    '',
                    _desc,
                  );
                },
                child: new Text(
                  "   ADD TO CART         \n",
                  style: TextStyle(
                      fontSize: 15,
                      color: Color(0xFF007EC7),
                      fontFamily: Str.POPPINS,
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget headingStr() => Container(
        margin: EdgeInsets.only(
          top: 120.0,
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
                text: 'Two Simple Options\n\n',
                style: TextStyle(
                  fontFamily: Str.POPPINS,
                  fontWeight: FontWeight.w500,
                  //wordSpacing: 2.5,
                  letterSpacing: .6,
                  color: Colors.black.withOpacity(.9),
                  fontSize: 36.0,
                ),
              ),
              // new TextSpan(
              //   text: 'These are a selection of my recent\nworks.',
              //   style: TextStyle(
              //     fontFamily: Str.POPPINS,
              //     fontWeight: FontWeight.w500,
              //     //wordSpacing: 2.5,
              //     letterSpacing: .8,
              //     color: Colors.black.withOpacity(.6),
              //     fontSize: 18.0,
              //   ),
              // ),
            ],
          ),
        ),
      );

  Widget priceRow(pricing, _context) => ResponsiveBuilder(
        builder: (context, sizingInformation) => Container(
          margin: EdgeInsets.symmetric(
            vertical: 90.0,
            horizontal: sizingInformation.deviceScreenType ==
                    DeviceScreenType.mobile
                ? 30
                : sizingInformation.deviceScreenType == DeviceScreenType.tablet
                    ? 100
                    : 250,
          ),
          child: sizingInformation.deviceScreenType == DeviceScreenType.mobile
              ? Column(
                  children: [
                    Container(
                      height: 400,
                      child: Card(
                        elevation: 2,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 70.0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              RichText(
                                textAlign: TextAlign.center,
                                //maxLines: 2,

                                text: new TextSpan(
                                  style: new TextStyle(
                                    height: 1.2,
                                    letterSpacing: .6,
                                  ),
                                  children: <TextSpan>[
                                    new TextSpan(
                                      text: '\$${pricing[0].price}\n\n',
                                      style: TextStyle(
                                        fontFamily: Str.POPPINS,
                                        fontWeight: FontWeight.w500,
                                        //wordSpacing: 2.5,
                                        letterSpacing: .6,
                                        color: Colors.black.withOpacity(.9),
                                        fontSize: 60.0,
                                      ),
                                    ),
                                    new TextSpan(
                                      text:
                                          '${pricing[0].duration.toUpperCase()}\n\n',
                                      style: TextStyle(
                                        fontFamily: Str.POPPINS,
                                        fontWeight: FontWeight.w500,
                                        //wordSpacing: 2.5,
                                        letterSpacing: .8,
                                        color: Colors.black.withOpacity(.6),
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                  horizontal: 50,
                                ),
                                child: Text(
                                  '${pricing[0].desc}',
                                  maxLines: 4,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: Str.POPPINS,
                                    fontWeight: FontWeight.w500,
                                    height: 1.5,
                                    //wordSpacing: 2.5,
                                    letterSpacing: .6,
                                    color: Colors.black.withOpacity(.5),
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                              // addToCart(
                              //   otherSubId,
                              //   pricing.id,
                              //   _context,
                              //   pricing.price,
                              //   pricing.duration,
                              //   '',
                              //   pricing.desc,
                              // )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 400,
                      child: Card(
                        elevation: 2,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 70.0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              RichText(
                                textAlign: TextAlign.center,
                                //maxLines: 2,

                                text: new TextSpan(
                                  style: new TextStyle(
                                    height: 1.2,
                                    letterSpacing: .6,
                                  ),
                                  children: <TextSpan>[
                                    new TextSpan(
                                      text: '\$${pricing[1].price}\n\n',
                                      style: TextStyle(
                                        fontFamily: Str.POPPINS,
                                        fontWeight: FontWeight.w500,
                                        //wordSpacing: 2.5,
                                        letterSpacing: .6,
                                        color: Colors.black.withOpacity(.9),
                                        fontSize: 60.0,
                                      ),
                                    ),
                                    new TextSpan(
                                      text:
                                          '${pricing[1].duration.toUpperCase()}\n\n',
                                      style: TextStyle(
                                        fontFamily: Str.POPPINS,
                                        fontWeight: FontWeight.w500,
                                        //wordSpacing: 2.5,
                                        letterSpacing: .8,
                                        color: Colors.black.withOpacity(.6),
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                  horizontal: 50,
                                ),
                                child: Text(
                                  '${pricing[1].desc}',
                                  maxLines: 4,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: Str.POPPINS,
                                    fontWeight: FontWeight.w500,
                                    height: 1.5,
                                    //wordSpacing: 2.5,
                                    letterSpacing: .6,
                                    color: Colors.black.withOpacity(.5),
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                              // addToCart(
                              //   otherSubId,
                              //   pricing.id,
                              //   _context,
                              //   pricing.price,
                              //   pricing.duration,
                              //   '',
                              //   pricing.desc,
                              // )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              : Row(
                  children: [
                    priceTile(
                      pricing[0],
                      _context,
                      pricing[1].id,
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    priceTile(
                      pricing[1],
                      _context,
                      pricing[0].id,
                    ),
                  ],
                ),
        ),
      );

  Widget priceTile(
    pricing,
    _context,
    otherSubId,
  ) =>
      Expanded(
        child: Container(
          height: 400,
          child: Card(
            elevation: 2,
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 70.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    //maxLines: 2,

                    text: new TextSpan(
                      style: new TextStyle(
                        height: 1.2,
                        letterSpacing: .6,
                      ),
                      children: <TextSpan>[
                        new TextSpan(
                          text: '\$${pricing.price}\n\n',
                          style: TextStyle(
                            fontFamily: Str.POPPINS,
                            fontWeight: FontWeight.w500,
                            //wordSpacing: 2.5,
                            letterSpacing: .6,
                            color: Colors.black.withOpacity(.9),
                            fontSize: 60.0,
                          ),
                        ),
                        new TextSpan(
                          text: '${pricing.duration.toUpperCase()}\n\n',
                          style: TextStyle(
                            fontFamily: Str.POPPINS,
                            fontWeight: FontWeight.w500,
                            //wordSpacing: 2.5,
                            letterSpacing: .8,
                            color: Colors.black.withOpacity(.6),
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 50,
                    ),
                    child: Text(
                      '${pricing.desc}',
                      maxLines: 4,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: Str.POPPINS,
                        fontWeight: FontWeight.w500,
                        height: 1.5,
                        //wordSpacing: 2.5,
                        letterSpacing: .6,
                        color: Colors.black.withOpacity(.5),
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  // addToCart(
                  //   otherSubId,
                  //   pricing.id,
                  //   _context,
                  //   pricing.price,
                  //   pricing.duration,
                  //   '',
                  //   pricing.desc,
                  // )
                ],
              ),
            ),
          ),
        ),
      );

  Widget addToCart(
    otherSubId,
    id,
    context,
    price,
    _name,
    _icons,
    _desc,
  ) =>
      MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () async {
            bool _exists =
                await DatabaseServices().checkIfPricingExists(otherSubId);
            if (_exists) {
              _showExistAlertDialog(
                otherSubId,
                context,
                _name,
                id,
                price,
                _name,
                _desc,
              );
              return;
            }

            DatabaseServices().addToCart(
              id,
              context,
              int.parse(price),
              _name,
              _icons,
              _desc,
            );
          },
          child: Container(
            margin: EdgeInsets.only(
              top: 30.0,
            ),
            height: 60,
            width: 220,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(6),
              ),
              color: QuizJetsTheme.quizJetsBlue,
            ),
            child: Center(
              child: Text(
                'Add to cart',
                style: TextStyle(
                  fontSize: 14.5,
                  fontFamily: Str.POPPINS,
                  fontWeight: FontWeight.w500,
                  letterSpacing: .7,
                  wordSpacing: 2.5,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      );

  removeOtherSubscripiton(subId) async {
    var userId = await GetUserInfo().getCurrentUserID();
    FirebaseFirestore.instance
        .collection('userCart')
        .doc(userId)
        .collection('cartCollection')
        .doc(subId)
        .delete();
  }
}
