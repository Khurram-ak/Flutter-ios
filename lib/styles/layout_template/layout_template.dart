import 'package:flutter/material.dart';
import 'package:quizjets/export_files.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LayoutTemplate extends StatefulWidget {
  

  @override
  _LayoutTemplateState createState() => _LayoutTemplateState();
}

class _LayoutTemplateState extends State<LayoutTemplate> {
  @override
  void initState() {
    super.initState();
    
  }


  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User>(context);

    return WillPopScope(
     // onWillPop: () async => locator<NavigationService>().navigateTo(HomeRoute),
      child: ResponsiveBuilder(
        builder: (context, sizingInformation) => Scaffold(
          // appBar: PreferredSize(
          //   preferredSize: const Size.fromHeight(70),
          //   child: HomeBar(),
          // ),
          // body: Navigator(
          //     //key: locator<NavigationService>().navigatorKey,
          //     onGenerateRoute: generateRoute,
          //     initialRoute: HomeRoute,
          //   ),
        ),
      ),
    );
  }
}
