import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:quizjets/export_files.dart';

class SupportPage extends StatefulWidget {
  @override
  _SupportPageState createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  bool themeOption = true;
  @override
  Widget build(BuildContext context) {
    return AnimatedTheme(
      duration: Duration(milliseconds: 300),
      data: Theme.of(context),
      child: Scaffold(
        appBar: actionBar(),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal:20.0),
          child: ListView(
            children:[
             Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam laoreet, risus ullamcorper ultricies malesuada, risus nunc pulvinar nibh, eu lobortis augue diam sed enim. Donec quis orci molestie lorem ullamcorper efficitur. Donec ornare nisi eget imperdiet ullamcorper. Suspendisse ultrices pharetra massa, malesuada porta metus porta condimentum. In porttitor faucibus enim, ut dignissim nibh tristique in. Phasellus ac risus tellus. In arcu justo, efficitur et bibendum non, lobortis sit amet quam. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Vestibulum imperdiet mauris id metus tincidunt, non ultricies nisl varius.",
            maxLines:null,
            style: TextStyle(
              fontSize: 14,
              //color: Colors.grey,
              
              fontFamily: Str.POPPINS,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.2,
            ),
            textAlign: TextAlign.start,
          )
            ]
          ),
        ),
      ),
    );
  }

  Widget actionBar() => AppBar(
        iconTheme: new IconThemeData(color: Colors.grey),
        title: Column(children: [
          Text(
            "Support",
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey,
              fontFamily: Str.POPPINS,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
            ),
            textAlign: TextAlign.center,
          ),
        ],),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            //color: Colors.black,
          ),
          onPressed: () {
             Navigator.of(context).pop();
          },
        ),
      );

     
}
