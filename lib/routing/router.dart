import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quizjets/export_files.dart';
import 'package:quizjets/models/category.dart';
import 'package:quizjets/pages/extract_arguments_screen.dart';
import 'package:quizjets/pages/web_filter_page.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeRoute:
      return _getPageRoute(HomePage(), settings);
    case LoginRoute:
      return _getPageRoute(LoginPage(), settings);
    case PricingRoute:
      return _getPageRoute(PricingPage(), settings);
    case CoursewareRoute:
      return _getPageRoute(CoursewarePage(), settings);
    case GetStartedRoute:
      return _getPageRoute(GetStartedPage(), settings);
    case MyDetailsRoute:
      return _getPageRoute(MyDetailsPage(), settings);
    case ContactUsRoute:
      return _getPageRoute(ContactUsPage(), settings);
    case LegalRoute:
      return _getPageRoute(LegalPage(), settings);
    case FaqsRoute:
      return _getPageRoute(FAQsPage(), settings);
    case PurchasesRoute:
      return _getPageRoute(PurchasesPage(), settings);
    case SettingsRoute:
      return _getPageRoute(SettingsPage(), settings);
    case ChangePasswordRoute:
      return _getPageRoute(ChangePasswordPage(), settings);
    case EditProfileRoute:
      return _getPageRoute(EditProfilePage(), settings);
    case CartRoute:
      return _getPageRoute(CartPage(), settings);
    case QuestionRoute:
      if (settings.arguments is Category) {
        return MaterialPageRoute(
          builder: (_) => WebQuestionPage(
            category: settings.arguments,
          ),
        );
      }
      return _errorRoute();
    case CategoriesRoute:
      if (settings.arguments is String) {
        return MaterialPageRoute(
          builder: (_) => WebCategoriesPage(
            subjectId: settings.arguments,
          ),
        );
      }

      return _errorRoute();
    case FilterRoute:
      return _getPageRoute(WebFilterPage(), settings);
    case ExtractRoute:
      return _getPageRoute(ExtractArgumentsScreen(), settings);
    default:
      return _getPageRoute(HomePage(), settings);
  }
}

PageRoute _getPageRoute(Widget child, RouteSettings settings) {
  return _FadeRoute(child: child, routeName: settings.name);
}

class _FadeRoute extends PageRouteBuilder {
  final Widget child;
  final String routeName;
  _FadeRoute({this.child, this.routeName})
      : super(
          settings: RouteSettings(name: routeName),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              child,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}

Route<dynamic> _errorRoute() {
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
