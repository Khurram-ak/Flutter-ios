import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quizjets/export_files.dart';

class ExtraTile extends StatefulWidget {
  final index;
  ExtraTile({
    this.index,
  });
  @override
  _ExtraTileState createState() => _ExtraTileState();
}

class _ExtraTileState extends State<ExtraTile> {
  bool exist;
  bool loading = true;
  StreamSubscription<DocumentSnapshot> subscription;

  final spinkit = SpinKitThreeBounce(
    color: Colors.white,
    size: 15.0,
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var purchases = Provider.of<List<Purchase>>(context) ?? [];

    return Container(
      height: 487,
      width: 420.0,
      child: Card(
        elevation: 10,
        child: GestureDetector(
          onTap: () {},
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyImage(
                imageUrl: "${purchases[widget.index].icon}",
              ),
              // Container(
              //   height: 200.0,
              //   decoration: BoxDecoration(
              //     image: DecorationImage(
              //       image: NetworkImage("$_icons"),
              //       fit: BoxFit.cover,
              //     ),
              //     color: Colors.black.withOpacity(.3),
              //     borderRadius: BorderRadius.only(
              //       topLeft: Radius.circular(6),
              //       topRight: Radius.circular(6),
              //     ),
              //   ),
              //   //child: Image.network("$_icons"),
              // ),
              Container(
                margin: EdgeInsets.only(
                  left: 25.0,
                  right: 25.0,
                  top: 10.0,
                ),
                child: Text(
                  "${purchases[widget.index].name}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: Str.POPPINS,
                    fontWeight: FontWeight.w500,
                    letterSpacing: .8,
                    wordSpacing: 2.5,
                    color: Colors.black.withOpacity(.9),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 25.0,
                  right: 25.0,
                  top: 10.0,
                ),
                child: Row(
                  children: [
                    // Icon(
                    //   Icons.help_center_outlined,
                    //   size: 19.0,
                    //   color: Colors.black.withOpacity(.6),
                    // ),
                    // SizedBox(
                    //   width: 10,
                    // ),
                    Text(
                      'Cost: \$${purchases[widget.index].cost}',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 17,
                        fontFamily: Str.POPPINS,
                        fontWeight: FontWeight.w500,
                        letterSpacing: .6,
                        wordSpacing: 2.5,
                        color: QuizJetsTheme.quizJetsBlue.withOpacity(.6),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 5.0,
                  horizontal: 30.0,
                ),
                child: Text(
                  '${purchases[widget.index].desc}',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: Str.POPPINS,
                    fontWeight: FontWeight.w500,
                    letterSpacing: .6,
                    wordSpacing: 2.5,
                    color: Colors.black.withOpacity(.8),
                  ),
                ),
              ),
              Expanded(
                child: Container(),
              ),
              Container(
                margin: EdgeInsets.only(
                  bottom: 23.0,
                  right: 30.0,
                  top: 13,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(),
                    ),
                    addToCartBtn(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget addToCartBtn() => Container(
        height: 45.0,
        width: 140.0,
        margin: EdgeInsets.only(
          left: 0,
          top: 0.0,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 9.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(4.0),
          ),
          color: QuizJetsTheme.quizJetsBlue,
        ),
        child: Center(
          child: TextButton(
            onPressed: () async {},
            child: Text(
              'OPEN',
              style: TextStyle(
                fontSize: 14.5,
                fontFamily: Str.POPPINS,
                fontWeight: FontWeight.w600,
                //letterSpacing: .4,
                wordSpacing: 2.5,
                color: Colors.white,
              ),
            ),
          ),
        ),
      );
}
