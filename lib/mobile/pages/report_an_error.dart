

import 'package:flutter/material.dart';

import '../../export_files.dart';

class ReportError extends StatefulWidget {
  @override
  _ReportErrorState createState() => _ReportErrorState();
}

class _ReportErrorState extends State<ReportError> {
  var errorController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: true,
      appBar: actionBar(),
      body: ListView(children: [
        inputField('Type error here'),
        SizedBox(
          height: 20.0,
        ),
        Container(
          height: 50.0,
          //width: 100.0,
          padding: EdgeInsets.only(right: 20.0, left: 20.0),
          margin: EdgeInsets.symmetric(
            horizontal: 30.0,
            vertical: 30.0,
          ),
          decoration: new BoxDecoration(
            color: Color(0xFF007EC7),
            border: Border.all(
              width: 0.0,
              color: Color(0xFF007EC7),
            ),
            borderRadius: new BorderRadius.all(
              const Radius.circular(24.0),
            ),
          ),
          child: Center(
            child: Text(
              'Submit',
              style: TextStyle(
                fontSize: 16.5,
                color: Colors.white,
                fontFamily: Str.POPPINS,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ]),
      // bottomNavigationBar: Container(
      //   height: 70.0,
      //   child: InkWell(
      //     onTap: () async {
      //       Navigator.of(context).pop();
      //     },
      //     child: Container(
      //       //width: 100.0,
      //       padding: EdgeInsets.only(right: 20.0, left: 20.0),
      //       margin: EdgeInsets.symmetric(
      //         horizontal: 30.0,
      //         vertical: 10.0,
      //       ),
      //       decoration: new BoxDecoration(
      //         color: Colors.grey,
      //         border: Border.all(
      //           width: 0.0,
      //           color: Colors.grey,
      //         ),
      //         borderRadius: new BorderRadius.all(
      //           const Radius.circular(24.0),
      //         ),
      //       ),
      //       child: Center(
      //         child: Text(
      //           'Submit',
      //           style: TextStyle(
      //             fontSize: 16.5,
      //             color: Colors.white,
      //             fontFamily: Str.POPPINS,
      //             fontWeight: FontWeight.w600,
      //           ),
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
    );
  }

  Widget inputField(String hintStr) => Container(
        margin: EdgeInsets.symmetric(
          horizontal: 20.0,
        ),
        child: TextField(
          //controller: controler,
          //  minLines: 11,
          maxLines: null,
          //maxLength: 20,
          autocorrect: true,
          style: TextStyle(
            fontSize: 14.0,
            color: Colors.grey,
            fontFamily: Str.POPPINS,
          ),
          decoration: InputDecoration(
            hintText: hintStr,
            filled: true,
            labelText: hintStr,
            counterStyle: TextStyle(
              color: Colors.grey,
              fontFamily: Str.POPPINS,
            ),
            //fillColor: Color(0xFFDBEDFF),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(6.0)),
              borderSide: BorderSide(color: Colors.grey),
            ),
            prefixIcon: const Icon(
              Icons.error_outline,
              color: Colors.grey,
              size: 21.0,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(6.0)),
              borderSide: BorderSide(color: Colors.grey),
            ),
            hintStyle: TextStyle(
              fontSize: 13.0,
              color: Colors.grey,
              fontFamily: Str.POPPINS,
            ),
            labelStyle: TextStyle(
              fontSize: 14.0,
              color: Colors.grey,
              fontFamily: Str.POPPINS,
            ),
          ),
        ),
      );

  Widget actionBar() => AppBar(
        //iconTheme: new IconThemeData(color: Colors.grey),
        title: Column(
          children: [
            Text(
              "Report Error",
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
                fontFamily: Str.POPPINS,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.2,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.grey,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      );
}
