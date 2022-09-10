import 'package:flutter/material.dart';
import 'package:quizjets/export_files.dart';
import 'package:responsive_builder/responsive_builder.dart';

class FaqsTile extends StatefulWidget {
  final faqList;

  FaqsTile({
    this.faqList,
  });

  @override
  _FaqsTileState createState() => _FaqsTileState();
}

class _FaqsTileState extends State<FaqsTile> {
  bool expandFaq = false;
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Container(
        margin: EdgeInsets.symmetric(
          horizontal: sizingInformation.deviceScreenType ==
                  DeviceScreenType.mobile
              ? 30
              : sizingInformation.deviceScreenType == DeviceScreenType.tablet
                  ? MediaQuery.of(context).size.width * .1
                  : MediaQuery.of(context).size.width * .2,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15.0),
            frqRow("${widget.faqList.faqsTitle}", onPassChanged),
            infoColllapse('firstAccordion', '${widget.faqList.desc}'),
            divider(),
          ],
        ),
      ),
    );
  }

  Widget divider() => Container(
        margin: EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 20.0,
        ),
        height: 1.0,
        color: Colors.grey.withOpacity(0.4),
      );

  Widget infoColllapse(var infoVisibility, var info) => Visibility(
        visible: expandFaq,
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 10.0,
          ),
          child: Text(
            info,
            style: TextStyle(
                fontSize: 18.5,
                color: Colors.black.withOpacity(.7),
                letterSpacing: .4,
                fontFamily: Str.POPPINS,
                fontWeight: FontWeight.w500),
            textAlign: TextAlign.start,
          ),
        ),
      );

  Widget frqRow(String headingStr, var visbInfo) => MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            visbInfo();
          },
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 18.0,
            ),
            child: Row(
              children: [
                Text(
                  headingStr,
                  style: TextStyle(
                      fontSize: 19.5,
                      color: Colors.black.withOpacity(.9),
                      fontFamily: Str.POPPINS,
                      letterSpacing: .7,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.start,
                ),
                Expanded(
                  child: Container(),
                ),
                Icon(
                  Icons.chevron_right_outlined,
                  size: 22.0,
                  color: Colors.grey,
                )
              ],
            ),
          ),
        ),
      );

  onPassChanged() {
    if (mounted)
      setState(
        () {
          expandFaq = !expandFaq;
        },
      );
  }
}
