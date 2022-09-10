import 'package:flutter/material.dart';
import 'package:quizjets/export_files.dart';

class LegalPage extends StatefulWidget {
  static const String route = '/legal';

  @override
  _LegalPageState createState() => _LegalPageState();
}

class _LegalPageState extends State<LegalPage> {

  @override
  Widget build(BuildContext context) {
    var webInfo = Provider.of<WebInfo>(context);
    return Scaffold(
      drawer: MainNavigationDrawer(),
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: HomeBar(),
        ),
      body: ListView(
        children: [
          SizedBox(
            height: 120,
          ),
          Text(
            'Acceptance of Terms.\n',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: Str.POPPINS,
              fontWeight: FontWeight.w500,
              //wordSpacing: 2.5,
              letterSpacing: .8,
              color: Colors.black.withOpacity(.9),
              fontSize: 36.0,
            ),
          ),
          Container(
            // margin: EdgeInsets.symmetric(
            //     horizontal: MediaQuery.of(context).size.width * .12),
            child: headingStr(webInfo),
          ),
          SizedBox(
            height: 70.0,
          ),
          FooterView()
        ],
      ),
    );
  }

  Widget headingStr(webInfo) => Container(
        margin: EdgeInsets.only(
          top: 20.0,
          left: MediaQuery.of(context).size.width * .13,
          right: MediaQuery.of(context).size.width * .13,
        ),
        child: RichText(
          textAlign: TextAlign.center,
          text: new TextSpan(
            style: new TextStyle(
              height: 1.8,
              letterSpacing: .9,
            ),
            children: <TextSpan>[
              new TextSpan(
                text: '${webInfo.legal_terms.replaceAll("\\n", "\n")}',
                style: TextStyle(
                  fontFamily: Str.POPPINS,
                  fontWeight: FontWeight.w500,
                  //wordSpacing: 2.5,
                  letterSpacing: .8,
                  color: Colors.black.withOpacity(.6),

                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        ),
      );
}
