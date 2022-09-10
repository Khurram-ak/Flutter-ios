import 'dart:html';

import 'package:flutter/material.dart';
import 'package:quizjets/checkout/stripe_checkout.dart';
import 'package:quizjets/checkout/stripe_checkout_web.dart';
import 'package:quizjets/checkout/stripe_checkout_web_monthly.dart';
import 'package:quizjets/checkout/stripe_checkout_web_yearly.dart';
import 'package:quizjets/export_files.dart';
import 'dart:ui' as ui;

import 'package:responsive_builder/responsive_builder.dart';

class CartPage extends StatefulWidget {
  static const String route = '/cart';

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  //var sub
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
            height: 120.0,
          ),
          ResponsiveBuilder(
              builder: (context, sizingInformation) => Container(
                    margin: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width * .2,
                      left: sizingInformation.deviceScreenType ==
                                      DeviceScreenType.mobile || sizingInformation.deviceScreenType ==
                                      DeviceScreenType.tablet
                          ? 30
                          : MediaQuery.of(context).size.width * .09,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        headingStr(),
                        // _divider(),
                      ],
                    ),
                  )),
          StreamProvider<List<Cart>>.value(
            initialData: [],
            value: DatabaseServices().streamCart(userId),
            child: CartList(),
          ),
          SizedBox(
            height: 80.0,
          ),
          // Row(
          //   children: [
          //     checkOutBtn(),
          //   ],
          // ),
          SizedBox(
            height: 30.0,
          ),
          FooterView(),
        ],
      ),
    );
  }

  Widget checkOutBtn() => MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          margin: EdgeInsets.only(
            //right: MediaQuery.of(context).size.width * .2,
            left: MediaQuery.of(context).size.width * .11,
          ),
          height: 50,
          width: 190,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(6),
            ),
            color: QuizJetsTheme.quizJetsBlue.withOpacity(.7),
          ),
          child: TextButton(
            onPressed: () {
              //redirectToCheckout(context);
              DatabaseServices().addItemToPurchase(context);
            },
            child: Center(
              child: Row(
                children: [
                  SizedBox(
                    width: 10.0,
                  ),
                  Icon(
                    Icons.payment,
                    size: 25.0,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Text(
                    'CHECKOUT',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: Str.POPPINS,
                      fontWeight: FontWeight.w500,
                      //wordSpacing: 2.5,
                      height: 1.5,
                      letterSpacing: 1,
                      color: Colors.white,
                      fontSize: 17.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
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
                text: 'My Cart\n\n\n',
                style: TextStyle(
                  fontFamily: Str.POPPINS,
                  fontWeight: FontWeight.w500,
                  //wordSpacing: 2.5,
                  letterSpacing: .6,
                  color: Colors.black.withOpacity(.9),
                  fontSize: 35.0,
                ),
              ),
            ],
          ),
        ),
      );
}

class CartList extends StatefulWidget {
  final subscriptionType;

  CartList({this.subscriptionType});
  @override
  _CartListState createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  List _subscriptionList = [
    {'no': 1, 'keyword': 'Price: \$20 per Year'},
    {'no': 2, 'keyword': 'Price: \$15 30 Days'},
  ];
  List<DropdownMenuItem> _dropdownGoalItems;
  var _subscriptionSelected;
  bool monthly = false;

  @override
  void initState() {
    _dropdownGoalItems = buildDropdownTestItems(_subscriptionList);
    super.initState();
  }

  List<DropdownMenuItem> buildDropdownTestItems(List _subscriptionList) {
    List<DropdownMenuItem> items = List();
    for (var i in _subscriptionList) {
      items.add(
        DropdownMenuItem(
          value: i,
          child: Text(i['keyword']),
        ),
      );
    }
    return items;
  }

  Widget subscriptionDropDownMenu() => new Padding(
        padding:
            EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: new DropdownBelow(
            itemWidth: 250,
            itemTextstyle: _textStyle,
            boxTextstyle: _textStyle,
            boxPadding: EdgeInsets.fromLTRB(0, 6, 0, 12),
            boxHeight: 45,
            boxWidth: 250,
            hint: Text(
              'Price: \$20 per Year',
              style: _textStyle,
            ),
            value: _subscriptionSelected,
            items: _dropdownGoalItems,
            onChanged: onChangeDropdownTests,
            icon: Icon(Icons.arrow_drop_down),
          ),
        ),
      );

  onChangeDropdownTests(selectedTest) {
    print(selectedTest);
    setState(() {
      _subscriptionSelected = selectedTest;
      if (_subscriptionSelected['no'] == 1) {
        monthly = false;
      } else {
        monthly = true;
      }
    });
  }

  var _textStyle = TextStyle(
    fontFamily: Str.POPPINS,
    fontWeight: FontWeight.w600,
    //wordSpacing: 2.5,
    height: 1.5,
    letterSpacing: 1,
    color: QuizJetsTheme.quizJetsBlue.withOpacity(.9),
    fontSize: 16.5,
  );

  @override
  Widget build(BuildContext context) {
    var carts = Provider.of<List<Cart>>(context) ?? [];

    if (carts.isEmpty) {
      return Container(
        margin: EdgeInsets.all(
          80.0,
        ),
        child: Center(
          child: Text(
            'Your cart is empty : (',
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
      itemCount: carts.length,
      itemBuilder: (BuildContext ctxt, int index) {
        if (carts.isEmpty) {
          return Center(
            child: Text(
              'Your cart is empty',
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
                      : MediaQuery.of(context).size.width * .20,
                  left: sizingInformation.deviceScreenType ==
                                      DeviceScreenType.mobile || sizingInformation.deviceScreenType ==
                                      DeviceScreenType.tablet
                      ? 30
                      : MediaQuery.of(context).size.width * .09,
                ),
                child: new Row(
                  children: [
                    CartPhoto(
                      imageUrl: carts[index].icon,
                      deviceScreenType: sizingInformation,
                    ),
                    Container(
                      width: sizingInformation.deviceScreenType ==
                                      DeviceScreenType.mobile || sizingInformation.deviceScreenType ==
                                      DeviceScreenType.tablet
                          ? MediaQuery.of(context).size.width * .26
                          : MediaQuery.of(context).size.width * .33,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${carts[index].name}',
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
                            '${carts[index].desc}',
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
                            'Please Select Your Option',
                            style: TextStyle(
                              fontFamily: Str.POPPINS,
                              fontWeight: FontWeight.w600,
                              //wordSpacing: 2.5,
                              letterSpacing: .6,
                              height: 2.5,
                              color: Colors.black.withOpacity(.9),
                              fontSize: 15.0,
                            ),
                          ),
                          // SizedBox(
                          //   height: 10.0,
                          // ),
                          subscriptionDropDownMenu(),
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
                          Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 43,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(4),
                                ),
                                color:
                                    QuizJetsTheme.quizJetsBlue.withOpacity(.7),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  DatabaseServices().removeFromCart(
                                      '${carts[index].id}', context);
                                },
                                child: Center(
                                  child: Text(
                                    ' REMOVE  ',
                                    
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontFamily: Str.POPPINS,
                                      fontWeight: FontWeight.w500,
                                      //wordSpacing: 2.5,
                                      height: 1.5,
                                      letterSpacing: 1,
                                      color: Colors.white,
                                      fontSize: 14.5,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                                    height: 10.0,
                                  ),
                            Container(
                              height: 43,
                              width: 100,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: QuizJetsTheme.quizJetsBlue
                                      .withOpacity(.7),
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(4),
                                ),
                                color: Colors.transparent,
                              ),
                              child: TextButton(
                                onPressed: () async {
                                  var userId =
                                      await GetUserInfo().getCurrentUserID();
                                  //redirectToCheckout(context);
                                  //redirectToCheckoutMain(context);

                                  if (_subscriptionSelected == null) {
                                    
                                    FirebaseFirestore.instance
                                        .collection('processingPurchase')
                                        .doc(userId)
                                        .set({
                                      'id': '${carts[index].id}',
                                      'name': '${carts[index].name}',
                                      'desc': '${carts[index].desc}',
                                      'icon': '${carts[index].icon}',
                                      'cost': '${carts[index].cost}',
                                      'monthly': monthly,
                                    }).then((value) =>
                                            redirectToCheckoutYearly(context));
                                    //   DatabaseServices().addSingleItemToPurchase(
                                    //   context,
                                    //   '${carts[index].id}',
                                    //   '${carts[index].name}',
                                    //   '${carts[index].desc}',
                                    //   '${carts[index].icon}',
                                    //   carts[index].cost,
                                    //   monthly,
                                    // );
                                    //return;
                                  }
                                  if (_subscriptionSelected['keyword'] ==
                                      'Price: \$20 per Year') {
                                    //redirectToCheckoutYearly(context);
                                    FirebaseFirestore.instance
                                        .collection('processingPurchase')
                                        .doc(userId)
                                        .update({
                                      'id': '${carts[index].id}',
                                      'name': '${carts[index].name}',
                                      'desc': '${carts[index].desc}',
                                      'icon': '${carts[index].icon}',
                                      'cost': '${carts[index].cost}',
                                      'monthly': monthly,
                                    }).then((value) =>
                                            redirectToCheckoutYearly(context));
                                    //return;
                                  }
                                  if (_subscriptionSelected['keyword'] ==
                                      'Price: \$15 30 Days') {
                                    // redirectToCheckoutMonthly(context);
                                    FirebaseFirestore.instance
                                        .collection('processingPurchase')
                                        .doc(userId)
                                        .update({
                                      'id': '${carts[index].id}',
                                      'name': '${carts[index].name}',
                                      'desc': '${carts[index].desc}',
                                      'icon': '${carts[index].icon}',
                                      'cost': '${carts[index].cost}',
                                      'monthly': monthly,
                                    }).then((value) =>
                                            redirectToCheckoutMonthly(context));
                                    //return;
                                  }
                                },
                                child: Center(
                                  child: Text(
                                    'CHECKOUT',
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontFamily: Str.POPPINS,
                                      fontWeight: FontWeight.w500,
                                      //wordSpacing: 2.5,
                                      height: 1.5,
                                      letterSpacing: 1,
                                      color: QuizJetsTheme.quizJetsBlue
                                          .withOpacity(.7),
                                      fontSize: 14.5,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ])
                        
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
               // right: MediaQuery.of(context).size.width * .20,
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

class CartPhoto extends StatefulWidget {
  final imageUrl;
  var deviceScreenType;

  CartPhoto({
    this.imageUrl,
    this.deviceScreenType,
  });
  @override
  _MyImageState createState() => _MyImageState();
}

class _MyImageState extends State<CartPhoto> {
  @override
  Widget build(BuildContext context) {
    // https://github.com/flutter/flutter/issues/41563
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      widget.imageUrl,
      (int _) => ImageElement()..src = widget.imageUrl,
    );

    return Container(
      margin: EdgeInsets.only(
        right:
            widget.deviceScreenType.deviceScreenType == DeviceScreenType.mobile || widget.deviceScreenType.deviceScreenType == DeviceScreenType.tablet
                ? 20
                : 40,
      ),
      height:
          widget.deviceScreenType.deviceScreenType == DeviceScreenType.mobile
              ? 120
              : 150,
      width: widget.deviceScreenType.deviceScreenType == DeviceScreenType.mobile
          ? 140
          : 170,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(
          .1,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(6),
        ),
      ),
      child: HtmlElementView(
        viewType: widget.imageUrl,
      ),
    );
  }
}
