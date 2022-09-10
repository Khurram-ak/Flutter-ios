import 'package:flutter/material.dart';
import 'package:quizjets/export_files.dart';

class FAQsPage extends StatefulWidget {
  static const String route = '/faqs';

  @override
  _FAQsPageState createState() => _FAQsPageState();
}

class _FAQsPageState extends State<FAQsPage> {
  bool expandFaq = false;
  @override
  Widget build(BuildContext context) {
    var faqsList = Provider.of<List<Faq>>(context) ?? [];
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
                'Frequently asked questions (FAQs)\n',
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
                child: new ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: faqsList.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return new FaqsTile(
                      faqList: faqsList[index],
                    );
                  },
                ),
              ),
              SizedBox(
                height: 80.0,
              ),
              FooterView()
            ],
          ),
    );
  }
}
