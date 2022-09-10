import 'dart:html';

import 'package:flutter/material.dart';
import 'package:quizjets/export_files.dart';
import 'dart:ui' as ui;

import 'package:quizjets/models/category.dart';
import 'package:quizjets/pages/web_filter_page.dart';
import 'package:quizjets/provider/app_state.dart';
import 'package:responsive_builder/responsive_builder.dart';

class WebCategoriesPage extends StatefulWidget {
  static const String route = '/categories';
  final subjectId;

  WebCategoriesPage({
    this.subjectId,
  });

  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<WebCategoriesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainNavigationDrawer(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: HomeBar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 100.0,
            ),
            ResponsiveBuilder(
              builder: (context, sizingInformation) => Container(
                margin: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * .2,
                  left: sizingInformation.deviceScreenType ==
                              DeviceScreenType.mobile ||
                          sizingInformation.deviceScreenType ==
                              DeviceScreenType.tablet
                      ? 30
                      : MediaQuery.of(context).size.width * .11,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Categories\n\n',
                      style: TextStyle(
                        fontFamily: Str.POPPINS,
                        fontWeight: FontWeight.w500,
                        //wordSpacing: 2.5,
                        letterSpacing: .6,
                        color: Colors.black.withOpacity(.9),
                        fontSize: 35.0,
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    widget.subjectId == "BD700"
                        ? IconButton(
                            onPressed: () {
                              //locator<NavigationService>().navigateTo(FilterRoute);
                              Navigator.of(context)
                                  .pushNamed(WebFilterPage.route);
                            },
                            icon: Icon(
                              Icons.filter_list,
                              size: 30.0,
                            ),
                          )
                        : Container()
                  ],
                ),
              ),
            ),
            StreamProvider<List<Category>>.value(
              initialData: [],
              value: DatabaseServices().streamCategory(widget.subjectId),
              child: CategoryList(
                subject: widget.subjectId,
              ),
            ),
            SizedBox(
              height: 100.0,
            ),
            FooterView(),
          ],
        ),
      ),
    );
  }
}

class CategoryList extends StatelessWidget {
  final subject;

  CategoryList({
    this.subject,
  });

  @override
  Widget build(BuildContext context) {
    var category = Provider.of<List<Category>>(context) ?? [];
    if (category.isEmpty) {
      return Container(
        margin: EdgeInsets.all(
          80.0,
        ),
        child: Center(
          child: Text(
            ' $subject Empty : (',
            style: TextStyle(
              fontFamily: Str.POPPINS,
              fontWeight: FontWeight.w500,
              //wordSpacing: 2.5,
              letterSpacing: .6,
              color: Colors.black.withOpacity(.9),
              fontSize: 17.0,
            ),
          ),
        ),
      );
    }
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: category.length,
      itemBuilder: (BuildContext ctxt, int index) {
        if (category.isEmpty) {
          return Center(
            child: Text(
              'Empty',
              style: TextStyle(
                fontFamily: Str.POPPINS,
                fontWeight: FontWeight.w500,
                //wordSpacing: 2.5,
                letterSpacing: .6,
                color: Colors.black.withOpacity(.9),
                fontSize: 17.0,
              ),
            ),
          );
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ResponsiveBuilder(
              builder: (context, sizingInformation) => Container(
                //height: 190,
                margin: EdgeInsets.only(
                  right: sizingInformation.deviceScreenType ==
                              DeviceScreenType.mobile ||
                          sizingInformation.deviceScreenType ==
                              DeviceScreenType.tablet
                      ? 30
                      : MediaQuery.of(context).size.width * .25,
                  left: sizingInformation.deviceScreenType ==
                              DeviceScreenType.mobile ||
                          sizingInformation.deviceScreenType ==
                              DeviceScreenType.tablet
                      ? 30
                      : MediaQuery.of(context).size.width * .11,
                ),
                child: new Row(
                  children: [
                    // CartPhoto(
                    //   imageUrl: category[index].icon,
                    //   deviceScreenType: sizingInformation,
                    // ),
                    Container(
                      margin: EdgeInsets.only(
                        right: sizingInformation.deviceScreenType ==
                                    DeviceScreenType.mobile ||
                                sizingInformation.deviceScreenType ==
                                    DeviceScreenType.tablet
                            ? 20
                            : 40,
                      ),
                      height: sizingInformation.deviceScreenType ==
                              DeviceScreenType.mobile
                          ? 120
                          : 150,
                      width: sizingInformation.deviceScreenType ==
                              DeviceScreenType.mobile
                          ? 140
                          : 170,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(
                          .1,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(6),
                        ),
                        image: DecorationImage(
                          image: new NetworkImage('${category[index].icon}'),
                          fit: BoxFit.cover,
                        ),
                      ), 
                    ),
                    Container(
                      width: sizingInformation.deviceScreenType ==
                                  DeviceScreenType.mobile ||
                              sizingInformation.deviceScreenType ==
                                  DeviceScreenType.tablet
                          ? MediaQuery.of(context).size.width * .28
                          : MediaQuery.of(context).size.width * .35,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${category[index].name}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: Str.POPPINS,
                              fontWeight: FontWeight.w600,
                              //wordSpacing: 2.5,
                              letterSpacing: .6,
                              height: 2.5,
                              color: Colors.black.withOpacity(.9),
                              fontSize: 17.0,
                            ),
                          ),
                          Text(
                            '${category[index].desc}',
                            maxLines: sizingInformation.deviceScreenType ==
                                        DeviceScreenType.mobile ||
                                    sizingInformation.deviceScreenType ==
                                        DeviceScreenType.tablet
                                ? 2
                                : 4,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: Str.POPPINS,
                              fontWeight: FontWeight.w500,
                              //wordSpacing: 2.5,
                              height: 1.5,
                              letterSpacing: 1,
                              color: Colors.black.withOpacity(.7),
                              fontSize: 14.0,
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                        ],
                      ),
                    ),
                    sizingInformation.deviceScreenType ==
                                DeviceScreenType.mobile ||
                            sizingInformation.deviceScreenType ==
                                DeviceScreenType.tablet
                        ? SizedBox(
                            width: 10,
                          )
                        : Expanded(
                            child: Container(),
                          ),
                    Container(
                      height: 45,
                      width: sizingInformation.deviceScreenType ==
                                  DeviceScreenType.mobile ||
                              sizingInformation.deviceScreenType ==
                                  DeviceScreenType.tablet
                          ? 80
                          : 95,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                        color: QuizJetsTheme.quizJetsBlue.withOpacity(.7),
                      ),
                      child: TextButton(
                        onPressed: () {
                          var provider = Provider.of<AppState>(context);
                          provider.setPlaneId('${category[index].plane_id}');
                          Navigator.pushNamed(
                            context,
                            QuestionRoute,
                            arguments: Category(
                              id: '${category[index].id}',
                              name: '${category[index].name}',
                              desc: '${category[index].desc}',
                              icon: '${category[index].icon}',
                            ),
                          );
                        },
                        child: Center(
                          child: Text(
                            'OPEN',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: Str.POPPINS,
                              fontWeight: FontWeight.w500,
                              //wordSpacing: 2.5,
                              height: 1.5,
                              letterSpacing: 1,
                              color: Colors.white,
                              fontSize: 17.5,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * .25,
                left: MediaQuery.of(context).size.width * .11,
                top: 40.0,
                bottom: 20,
              ),
              child: Divider(
                color: Colors.black.withOpacity(
                  .1,
                ),
                height: 1,
              ),
            )
          ],
        );
      },
    );
  }
}

class MyCatImage extends StatelessWidget {
  final imageUrl;
  MyCatImage({
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    // https://github.com/flutter/flutter/issues/41563
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      imageUrl,
      (int _) => ImageElement()..src = imageUrl,
    );
    return HtmlElementView(
      viewType: imageUrl,
    );
  }
}
