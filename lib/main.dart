import 'package:flutter/material.dart';
import 'package:quizjets/export_files.dart';

import 'package:quizjets/models/category.dart';
import 'package:quizjets/pages/app_store_page.dart';
import 'package:quizjets/pages/google_play_page.dart';

import 'package:quizjets/pages/web_filter_page.dart';
import 'package:quizjets/provider/app_state.dart';

void main() async {
 // await Firebase.initializeApp();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  runApp(MyApp(savedThemeMode: savedThemeMode));
  // setupLocator();
  //setPathUrlStrategy();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  final AdaptiveThemeMode savedThemeMode;

  const MyApp({Key key, this.savedThemeMode}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isAuth = false;
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    initAuthListener(source: Source.server);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<User>.value(
          value: FirebaseAuth.instance.authStateChanges(),
        ),
        StreamProvider<List<Subject>>.value(
          initialData: [],
          value: DatabaseServices().streamSubjects(),
        ),
        StreamProvider<List<Pricing>>.value(
          initialData: [],
          value: DatabaseServices().streamPricing(),
        ),
        StreamProvider<WebInfo>.value(
          value: DatabaseServices().streamWebInfo(),
        ),
        StreamProvider<List<Faq>>.value(
          initialData: [],
          value: DatabaseServices().streamFaqs(),
        ),
        ChangeNotifierProvider<AppState>.value(
              value: AppState(),
            ),
      ],
      child: MaterialApp(
        title: 'QuizJets',
        debugShowCheckedModeBanner: false,
        // home: ResponsiveBuilder(
        //   builder: (context, sizingInformation) => MaterialApp(
        //     title: 'QuizJets',
        //     debugShowCheckedModeBanner: false,
        //     home:
        //         sizingInformation.deviceScreenType == DeviceScreenType.mobile ||
        //                 sizingInformation.deviceScreenType ==
        //                     DeviceScreenType.tablet
        //             ? (isLoading
        //                 ? LoadingPage()
        //                 : isAuth
        //                     ? LandingPage()
        //                     : MobileLoginPage())
        //             : (LayoutTemplate()),
        //   ),
        // ),
        initialRoute: '/',
        routes: {
          '/': (context) => HomePage(),
          LoginPage.route: (context) => LoginPage(),
          GetStartedPage.route: (context) => GetStartedPage(),
          CoursewarePage.route: (context) => CoursewarePage(),
          MyCoursewarePage.route: (context) => MyCoursewarePage(),
          PricingPage.route: (context) => PricingPage(),
          CartPage.route: (context) => CartPage(),
          ChangePasswordPage.route: (context) => ChangePasswordPage(),
          EditProfilePage.route: (context) => EditProfilePage(),
          FAQsPage.route: (context) => FAQsPage(),
          LegalPage.route: (context) => LegalPage(),
          MyDetailsPage.route: (context) => MyDetailsPage(),
          PurchasesPage.route: (context) => PurchasesPage(),
          SettingsPage.route: (context) => SettingsPage(),
          SuccessPage.route: (context) => SuccessPage(),
          CancelPage.route: (context) => CancelPage(),
          ContactUsPage.route: (context) => ContactUsPage(),
          WebCategoriesPage.route: (context) => WebCategoriesPage(),
          WebFilterQuestionPage.route: (context) => WebFilterQuestionPage(),
          WebFilterPage.route: (context) => WebFilterPage(),
          AppStorePage.route: (context) => AppStorePage(),
          GooglePlayPage.route: (context) => GooglePlayPage(),   
        },    
        onGenerateRoute: (settings) {
          // If you push the PassArguments route
          if (settings.arguments is Category) {
            return MaterialPageRoute(
              builder: (_) => WebQuestionPage(
                category: settings.arguments,
              ),
            );
          }
          if (settings.arguments is String) {
            return MaterialPageRoute(
              builder: (_) => WebCategoriesPage(
                subjectId: settings.arguments, 
              ),
            );
          }

          assert(false, 'Need to implement ${settings.name}');
          return null;
        },
      ),
    );
  }

  initAuthListener({Source source = Source.serverAndCache}) async {
    User user = FirebaseAuth.instance.currentUser;
    bool noUser = user == null;
    Future.delayed(
      Duration(seconds: 1),
      () async {
        if (noUser) {
          isAuth = false;
          isLoading = false;
          setState(() {});
        } else {
          FirebaseFirestore.instance
              .collection("userBase")
              .doc(user.uid)
              .get()
              .then((doc) {
            if (doc.exists) {
              isAuth = true;
              isLoading = false;
              setState(() {});
            } else {
              _showAlertDialog();
            }
          }).catchError(
            (e) {
              if (source == Source.cache) {
                initAuthListener(source: Source.server);
              } 
            },
          );
        }
      },
    );
  }

  void _showAlertDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return alert dialog object
        return AlertDialog(
          //backgroundColor: Colors.white,
          title: new Text(
            "This account no longer exists\n"
            "it might have been deleted ",
            style: TextStyle(
                fontSize: 19,
                color: Colors.grey,
                fontFamily: Str.POPPINS,
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.start,
          ),
          //content: phoneTextField(),
          actions: <Widget>[
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushNamed(GetStartedPage.route);
                },
                child: new Text(
                  "  SIGN UP     \n",
                  style: TextStyle(
                      fontSize: 17,
                      // color: Colors.black.withOpacity(.5),
                      fontFamily: Str.POPPINS,
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Text(
              "   ",
              style: TextStyle(
                  fontSize: 14.5,
                  color: Color(0xFF007EC7),
                  fontFamily: Str.POPPINS,
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () async {
                  Navigator.of(context).pop();
                  
                },
                child: new Text(
                  "   OKAY         \n",
                  style: TextStyle(
                      fontSize: 17,
                      color: Color(0xFF007EC7),
                      fontFamily: Str.POPPINS,
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
