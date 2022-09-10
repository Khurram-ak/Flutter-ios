// import 'package:flutter/material.dart';


// class LayoutTemplate extends StatelessWidget {
//   const LayoutTemplate({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ResponsiveBuilder(
//       builder: (context, sizingInformation) => Scaffold(
//         drawer: sizingInformation.deviceScreenType == DeviceScreenType.Mobile
//             ? NavigationDrawer()
//             : null,
//         backgroundColor: Colors.white,
//         body: CenteredView(
//           child: Column(
//             children: <Widget>[
//               NavigationBar(),
//               Expanded(
//                 child: Navigator(
//                   key: locator<NavigationService>().navigatorKey,
//                   onGenerateRoute: generateRoute,
//                   initialRoute: HomeRoute,
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
