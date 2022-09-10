
import 'package:flutter/material.dart';
import 'package:quizjets/export_files.dart';

goToWidget(BuildContext context, Widget myWidget, {result}) async {
  return await Navigator.of(context)
      .push(new MaterialPageRoute(builder: (context) {
    return myWidget;
  })).then((_) {
    if (_ != null) {
      if (result != null) result(_);
    }
  });
}

goToWidgetAndDisposeCurrent(BuildContext context, Widget myWidget,
    {result}) async {
  return await Navigator.of(context)
      .pushReplacement(new MaterialPageRoute(builder: (context) {
    return myWidget;
  })).then((_) {
    if (_ != null) {
      if (result != null) result(_);
    }
  });
}

goBackUntilFirstWidget(BuildContext context, {var result}) {

}

popUpWidget(BuildContext context, Widget myWidget, {result}) async {
  return await Navigator.of(context)
      .push(new PageRouteBuilder(
          opaque: false,
          pageBuilder: (BuildContext context, _, __) {
            return myWidget;
          }),)
      .then((_) {
    if (_ != null) {
      if (result != null) result(_);
    }
  });
}

popUpWidgetAndDisposeCurrent(BuildContext context, Widget myWidget,
    {result}) async {
  return await Navigator.of(context)
      .pushReplacement(new PageRouteBuilder(
          opaque: false,
          pageBuilder: (BuildContext context, _, __) {
            return myWidget;
          }))
      .then((_) {
    if (_ != null) {
      if (result != null) result(_);
    }
  });
}

clearScreenUntil(BuildContext context, Widget myWidget, {result}) {
  Navigator.of(context)
      .pushAndRemoveUntil(
          new MaterialPageRoute(builder: (BuildContext context) => myWidget),
          (Route<dynamic> route) => false)
      .then((_) {
    if (_ != null) {
      if (result != null) result(_);
    }
  });
}

popUpWidgetScreenUntil(BuildContext context, Widget myWidget, {result}) async {
  Navigator.of(context)
      .pushAndRemoveUntil(
          new PageRouteBuilder(
              opaque: false,
              pageBuilder: (BuildContext context, _, __) {
                return myWidget;
              }),
          (Route<dynamic> route) => false)
      .then((_) {
    if (_ != null) {
      if (result != null) result(_);
    }
  });
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/categories':
        // Validation of correct data type
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => WebCategoriesPage(
                  subjectId: args,
                ),
          );
        }//
        // If args is not of the correct type, return an error page.
        // You can also throw an exception while in development.
        return _errorRoute();
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
