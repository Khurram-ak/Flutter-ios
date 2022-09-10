import 'package:flutter/material.dart';
import 'package:quizjets/export_files.dart';

class GetStartedBtn extends StatefulWidget {
  @override
  _GetStartedBtnState createState() => _GetStartedBtnState();
}

class _GetStartedBtnState extends State<GetStartedBtn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 0.0,
        horizontal: 30.0,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(4.0),
        ),
        color: Colors.white,
      ),
      child: Center(
        child: TextButton(
          
          onPressed: () {
            //locator<NavigationService>().navigateTo(GetStartedRoute);
            Navigator.of(context).pushNamed(GetStartedPage.route);
          },
          child: Text(
            'GET STARTED',
            style: TextStyle(
              fontSize: 14.5,
              fontFamily: Str.POPPINS,
              fontWeight: FontWeight.w600,
              //letterSpacing: .4,
              wordSpacing: 2.5,
              color: QuizJetsTheme.quizJetsBlue,
            ),
          ),
        ),
      ),
    );
  }
}
