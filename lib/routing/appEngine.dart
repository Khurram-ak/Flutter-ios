import 'dart:async';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CodeWheeler {
  final int milliseconds;
  VoidCallback action;
  Timer _timer;
  int page = 0;

  CodeWheeler({this.milliseconds});

  run(Function action) {
    if (null != _timer) {
      _timer.cancel();
    }
    _timer = Timer.periodic(Duration(milliseconds: milliseconds), (_) {
      action();
    });
  }

  close() {
    _timer?.cancel();
  }
}


String getTimerText(int seconds, {bool three = false}) {
  int hour = seconds ~/ Duration.secondsPerHour;
  int min = (seconds ~/ 60) % 60;
  int sec = seconds % 60;

  String h = hour.toString();
  String m = min.toString();
  String s = sec.toString();

  String hs = h.length == 1 ? "0$h" : h;
  String ms = m.length == 1 ? "0$m" : m;
  String ss = s.length == 1 ? "0$s" : s;

  return three ? "$hs:$ms:$ss" : "$ms:$ss";
}


pushAndResult(context, item, {result}) {
  Navigator.push(
      context,
      PageRouteBuilder(
          transitionsBuilder: transition,
          opaque: false,
          pageBuilder: (context, _, __) {
            return item;
          })).then((_) {
    if (_ != null) {
      if (null != result) result(_);
    }
  });
}

pushReplaceAndResult(context, item,
    {result, opaque = true, bool depend = false}) {
  bool isIOS = Platform.isIOS;

  PageRoute route;

  if (isIOS && depend) {
    route = CupertinoPageRoute(builder: (ctx) {
      return item;
    });
  } else {
    route = PageRouteBuilder(
        transitionsBuilder: transition,
        opaque: false,
        pageBuilder: (context, _, __) {
          return item;
        });
  }

  Navigator.pushReplacement(context, route).then((_) {
    if (_ != null) {
      if (null != result) result(_);
    }
  });
}

Widget transition(BuildContext context, Animation<double> animation,
    Animation<double> secondaryAnimation, Widget child) {
  return FadeTransition(
    opacity: animation,
    child: child,
  );
}

SizedBox addSpace(double size) {
  return SizedBox(
    height: size,
  );
}

addSpaceWidth(double size) {
  return SizedBox(
    width: size,
  );
}

Container addLine(
    double size, color, double left, double top, double right, double bottom) {
  return Container(
    height: size,
    width: double.infinity,
    color: color,
    margin: EdgeInsets.fromLTRB(left, top, right, bottom),
  );
}

void showProgress(bool show, String progressId, BuildContext context,
    {String msg, bool cancellable = false, double countDown}) {
  if (!show) {
    //Str.CURRENT_PROGRESS = progressId;
    return;
  }

 // currentProgress = ""
}


