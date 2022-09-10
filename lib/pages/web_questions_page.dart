import 'dart:async';
import 'dart:html';

import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:quizjets/export_files.dart';
import 'package:quizjets/provider/app_state.dart';
import 'package:quizjets/styles/theme/quizjets_theme.dart';
import 'package:responsive_builder/responsive_builder.dart';

class WebQuestionPage extends StatefulWidget {
  static const String route = '/questions';
  final category;
  final name;
  final planeId;
  // final subject;
  // final index;
  // final categoryId;
  // final title;
  WebQuestionPage({
    this.category,
    this.name,
    this.planeId,
    // this.subject,
    // this.index,
    // this.categoryId,
    // this.title,
  });
  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<WebQuestionPage> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentSlider = 0;
  bool showHelp = true;
  int currentIndex = 1;
  int quizCount = 1;
  var currentDouble = 0.0;
  bool ansVisibility = false;
  bool isPlaying = true;
  bool isBuffering = true;
  String position = '';
  String duration = '';
  double sliderValue = 0.0;
  double startValue = 0.0;
  double volume = 80;
  var indexx = 0;
  StreamSubscription<DocumentSnapshot> subscription;
  List<Question> questionsList = [];
  List<Question> filteredList = [];
  List<Question> questionsNeverAskList = [];

  List<Question> neverAskAgainIds = [];

  var level = '';
  var questionId = '';
  String videoUrl = '';
  bool _stopVideo = false;

  final Widget sentimentNeutralIcon = SvgPicture.asset(
    'assets/svgs/sentiment_neutral_black_24dp.svg',
  );

  @override
  void initState() {
    super.initState();
    initStopVideo();
    initQuestions();
    initFilteredQquestions();
    initIndex();
    checkLevel();
  }

  initStopVideo() {
    _stopVideo = false;
    setState(() {});
  }

  initSaveState() async {
    final uid = await GetUserInfo().getCurrentUserID();
    await FirebaseFirestore.instance
        .collection('userState')
        .doc('$uid')
        .update({
      'page': 1,
      '${widget.category.name.replaceAll(' ', '_').toUpperCase()}': 1,
      'airplane_general': 1,
      'electronic_display': 1,
      'fire_protection': 1,
    }).onError((error, stackTrace) {
      FirebaseFirestore.instance.collection('userState').doc('$uid').set({
        'page': 1,
        'airplane_general': 1,
        'electronic_display': 1,
        'fire_protection': 1,
      });
    });
  }

  checkLevel() async {
    final uid = await GetUserInfo().getCurrentUserID();
    level = null;
    setState(() {});

    await FirebaseFirestore.instance
        .collection('confidenceLevel')
        .doc('$uid')
        .collection('levelCollection')
        .doc('${questionsList[indexx].id}')
        .get()
        .then((value) {
      level = value.data()['level'];
      setState(() {});
    });
  }

  checkLevel2(var quezList) async {
    final uid = await GetUserInfo().getCurrentUserID();
    level = null;
    setState(() {});
    await FirebaseFirestore.instance
        .collection('confidenceLevel')
        .doc('$uid')
        .collection('levelCollection')
        .doc('${quezList[indexx].id}')
        .get()
        .then((value) {
      if (level == value.data()['level']) return;
      level = value.data()['level'];
      setState(() {});
    });
  }

  initQuestions() {
    var provider = Provider.of<AppState>(context);
    print('provider value:: ${provider.planeId}');
    getQuetions(provider.planeId);
    //getNeverAskAgain();

    checkLevel();
    setState(() {});
  }

  initIndex() {
    if (quizCount == 0) {
      currentIndex = 0;

      setState(() {});
      return;
    }
    currentIndex = 1;

    setState(() {});
  }

  Future getQuetions(planeId) async {
    filteredList.clear();
    await FirebaseFirestore.instance
        .collection('quizjetsQuestions')
        .doc('000')
        .collection('questionsCollection')
        .where('active', isEqualTo: true)
        .where('${widget.category.name.replaceAll(' ', '_').toUpperCase()}',
            isEqualTo: true)
        .where('${planeId.toUpperCase()}', isEqualTo: true)
        .get()
        .then((value) {
      filteredList.clear();
      for (var item in value.docs) {
        Question questions = Question(
          item["question"],
          item["id"],
          item["ans_1"],
          item["ans_2"],
          item["ans_3"],
          item["ans_4"],
          item["mediaType"],
          item["mediaUrl"],
          item["active"],
          item["subject"],
          item["filter_id"],
        );

        filteredList.add(questions);
        filteredList.shuffle();
        checkLevel2(questionsList);
      }
    });
    setState(() {});

    return filteredList;
  }

  initDialog() {
    if (quizCount == currentIndex) {
      _stopVideo = true;
      setState(() {});
      Future.delayed(const Duration(seconds: 1), () {
        _showLastDialog();
      });
    }
  }

  initFilteredQquestions() async {
    neverAskAgainIds.clear();
    questionsList.clear();
    var neverAksAgainIdz = await getNeverAskAgain();
    var provider = Provider.of<AppState>(context);
    var questionzz = await getQuetions(provider.planeId);
    for (var quizId in neverAksAgainIdz) {
      questionzz.removeWhere((item) => item.id == quizId.id);
    }
    questionsList.addAll(questionzz);
    setState(
      () {
        quizCount = questionsList.length;
      },
    );
    print('NEW LISSSSRA ${questionsList.length}');
    if (questionsList.isEmpty) {
      _showNoQuestionsDialog();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: actionBar(),
      body: Center(
        child: Container(
          color: Colors.white,
          width: 500,
          child: PageView.builder(
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              controller: _pageController,
              onPageChanged: _onPageChanged,
              itemCount: questionsList.length,
              itemBuilder: (context, i) => InkWell(
                    onTap: () {
                      // checkLevel();
                      onPassChanged();

                      //if()
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: ListView(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Visibility(
                            visible:
                                questionsList[i].mediaType == 'IMAGE' ?? false,
                            child: SizedBox(
                              height: 250,
                              width: MediaQuery.of(context).size.width,
                              child: QuestionPhoto(
                                imageUrl: "${questionsList[i].mediaUrl}",
                              ),
                            ),
                          ),
                          Visibility(
                            visible: questionsList[i].mediaType == 'MP4' ||
                                    questionsList[i].mediaType == 'MP3' ??
                                false,
                            child: _stopVideo
                                ? Container(
                                    height: 250,
                                    color: Colors.black,
                                  )
                                : VideoView(
                                    videoUrl: questionsList[i].mediaUrl,
                                    stopVideo: _stopVideo,
                                  ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 30.0,
                              vertical: 15.0,
                            ),
                            child: InkWell(
                                onTap: () {
                                  indexx = i;
                                  setState(() {});
                                  //checkLevel();
                                  onPassChanged();
                                },
                                child: Text(
                                  '${questionsList[i].question.replaceAll("\\n", "\n")}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    //color: Colors.white,
                                    fontSize: 18.0,
                                    letterSpacing: .9,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: Str.POPPINS,
                                  ),
                                )),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ansContainer(
                              '${questionsList[i].ans_1.replaceAll("\\n", "\n")}'),
                          questionsList[i].ans_2 != ''
                              ? ansContainer(
                                  '${questionsList[i].ans_2.replaceAll("\\n", "\n")}',
                                )
                              : Container(),
                          questionsList[i].ans_3 != ''
                              ? ansContainer(
                                  '${questionsList[i].ans_3.replaceAll("\\n", "\n")}',
                                )
                              : Container(),
                          questionsList[i].ans_4 != ''
                              ? ansContainer(
                                  '${questionsList[i].ans_4.replaceAll("\\n", "\n")}',
                                )
                              : Container(),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  )),
        ),
      ),
      bottomNavigationBar: ResponsiveBuilder(
        builder: (context, sizingInformation) => Visibility(
          child: Container(
            height: 85,
            margin: EdgeInsets.symmetric(
              horizontal: sizingInformation.deviceScreenType ==
                          DeviceScreenType.mobile ||
                      sizingInformation.deviceScreenType ==
                          DeviceScreenType.tablet
                  ? 0
                  : MediaQuery.of(context).size.width * .33,
            ),
            padding: EdgeInsets.all(0),
            child: Column(children: [
              Container(
                height: 1,
                width: MediaQuery.of(context).size.width,
                color: Colors.grey,
              ),
              SizedBox(
                height: 8.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        color: level == 'LOW' ? Color(0xFF007EC7) : Colors.grey,
                        icon: Icon(
                          Icons.thumb_down,
                          size: 33.0,
                          color:
                              level == 'LOW' ? Color(0xFF007EC7) : Colors.grey,
                        ),
                        onPressed: () {
                          level = 'LOW';
                          setState(() {});
                          initDialog();
                          uploadConfidence(
                            'LOW',
                          );
                          // Future.delayed(const Duration(milliseconds: 700), () {
                          //   veryLowColor = Colors.grey;
                          //   setState(() {});
                          // });
                        },
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "  LOW",
                        style: TextStyle(
                            fontSize: 15.5,
                            color: level == 'LOW'
                                ? Color(0xFF007EC7)
                                : Colors.grey,
                            fontFamily: Str.POPPINS,
                            fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 8.0),
                        child: IconButton(
                          color: level == 'AVERAGE'
                              ? Color(0xFF007EC7)
                              : Colors.grey,
                          // iconSize: 36,
                          icon: Icon(
                            Icons.star_half,
                            size: 40.0,
                            color: level == 'AVERAGE'
                                ? Color(0xFF007EC7)
                                : Colors.grey,
                          ),
                          //icon: SizedBox(
                          // height: 80,
                          // width: 80,
                          // child: SvgPicture.asset(
                          //   'assets/svgs/sentiment_neutral_black_24dp.svg',
                          //   color: level == 'AVERAGE'
                          //       ? Color(0xFF007EC7)
                          //       : Colors.grey,
                          // ),
                          //),
                          onPressed: () {
                            level = 'AVERAGE';
                            setState(() {});
                            initDialog();
                            uploadConfidence(
                              'AVERAGE',
                            );
                            // Future.delayed(const Duration(milliseconds: 700), () {
                            //   lowColor = Colors.grey;
                            //   setState(() {});
                            // });
                          },
                        ),
                      ),
                      Text(
                        "AVERAGE",
                        style: TextStyle(
                            fontSize: 15.5,
                            color: level == 'AVERAGE'
                                ? Color(0xFF007EC7)
                                : Colors.grey,
                            fontFamily: Str.POPPINS,
                            fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                  new CircularPercentIndicator(
                    radius: 45.0,
                    animation: true,
                    animationDuration: 1200,
                    lineWidth: 7.0,
                    percent: quizCount == 0
                        ? 0 / 0
                        : currentIndex.toDouble() / quizCount,
                    center: new Text(
                      "$currentIndex",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        fontFamily: Str.POPPINS,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    circularStrokeCap: CircularStrokeCap.butt,
                    backgroundColor: Colors.grey.withOpacity(
                      .5,
                    ),
                    progressColor: Color(0xFF007EC7),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 8.0),
                        child: IconButton(
                          color:
                              level == 'HIGH' ? Color(0xFF007EC7) : Colors.grey,
                          //iconSize: 36,
                          // icon: SizedBox(
                          //   height: 80,
                          //   width: 80,
                          //   child: SvgPicture.asset(
                          //     'assets/svgs/sentiment_satisfied_black_24dp.svg',
                          //     color:
                          //         level == 'HIGH' ? Color(0xFF007EC7) : Colors.grey,
                          //   ),
                          // ),
                          icon: Icon(
                            Icons.star,
                            size: 40.0,
                            color: level == 'HIGH'
                                ? Color(0xFF007EC7)
                                : Colors.grey,
                          ),
                          onPressed: () {
                            level = 'HIGH';
                            setState(() {});
                            initDialog();

                            uploadConfidence(
                              'HIGH',
                            );
                            // Future.delayed(const Duration(milliseconds: 700), () {
                            //   //highColor = Colors.grey;
                            //   setState(() {});
                            // });
                          },
                        ),
                      ),
                      SizedBox(
                        height: 0,
                      ),
                      // HIGH TITLE
                      Text(
                        "   HIGH",
                        style: TextStyle(
                            fontSize: 15.5,
                            color: level == 'HIGH'
                                ? Color(0xFF007EC7)
                                : Colors.grey,
                            fontFamily: Str.POPPINS,
                            fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        color: level == 'VERY HIGH'
                            ? Color(0xFF007EC7)
                            : Colors.grey,
                        icon: Icon(
                          Icons.thumb_up,
                          size: 33.0,
                          color: level == 'VERY HIGH'
                              ? Color(0xFF007EC7)
                              : Colors.grey,
                        ),
                        onPressed: () {
                          level = 'VERY HIGH';
                          setState(() {});
                          initDialog();
                          uploadConfidence('VERY HIGH');
                          // Future.delayed(
                          //   const Duration(milliseconds: 700),
                          //   () {
                          //    // veryHighColor = Colors.grey;
                          //     setState(() {});
                          //   },
                          // );
                        },
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "MAXIMUM",
                        style: TextStyle(
                            fontSize: 15.5,
                            color: level == 'VERY HIGH'
                                ? Color(0xFF007EC7)
                                : Colors.grey,
                            fontFamily: Str.POPPINS,
                            fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }

  Widget ansContainer(String ansStr) => Visibility(
        visible: ansVisibility,
        child: InkWell(
          onTap: () async {
            setState(() {
              ansVisibility = false;
            });
            initDialog();
            // if (quizCount == currentIndex) {
            //   _stopVideo = true;
            //   setState(() {});
            //   return;
            // }
            _pageController.nextPage(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut);
          },
          child: Container(
            //height: 60.0,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 14.0,
            ),
            margin: EdgeInsets.symmetric(
              vertical: 6.0,
              horizontal: 25.0,
            ),
            decoration: new BoxDecoration(
              border: Border.all(
                width: 1.0,
                color: Colors.grey.withOpacity(.6),
              ),
              borderRadius: new BorderRadius.all(
                const Radius.circular(8.0),
              ),
            ),
            child: Center(
              child: Text(
                ansStr,
                style: TextStyle(
                  fontSize: 18,
                  letterSpacing: .8,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey,
                  fontFamily: Str.POPPINS,
                  //letterSpacing: 1.2,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      );

  onPassChanged() {
    if (mounted)
      setState(() {
        ansVisibility = !ansVisibility;
      });
  }

  void _showLastDialog() {
    // flutter defined function
    // _stopVideo = true;
    // setState(() {});
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        // return alert dialog object
        return AlertDialog(
          //backgroundColor: Colors.white,
          title: new Text(
            "CONGRATULATIONS ",
            style: TextStyle(
                fontSize: 15.5,
                color: Colors.grey,
                fontFamily: Str.POPPINS,
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          content: Text(
            "You have completed ${widget.category.name}",
            style: TextStyle(
                fontSize: 15,
                color: Colors.grey,
                fontFamily: Str.POPPINS,
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            InkWell(
              onTap: () {
                _stopVideo = false;
                setState(() {});
                Navigator.of(context).pop();
                initFilteredQquestions();
                var provider = Provider.of<AppState>(context);
                getQuetions(provider.planeId);
                _pageController.jumpTo(0);
              },
              child: new Text(
                " Repeat ${widget.category.name}? \n",
                style: TextStyle(
                    fontSize: 14.5,
                    // color: Colors.black.withOpacity(.5),
                    fontFamily: Str.POPPINS,
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              "               ",
              style: TextStyle(
                  fontSize: 14.5,
                  color: Color(0xFF007EC7),
                  fontFamily: Str.POPPINS,
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            InkWell(
              onTap: () async {
                _stopVideo = false;
                setState(() {});
                // Navigator.of(context).pop();
                // Navigator.of(context).pop();
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => WebCategoriesPage(
                //       subjectId: widget.name,
                //     ),
                //   ),
                // );
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              child: new Text(
                "   Select a new category?  \n",
                style: TextStyle(
                    fontSize: 14.5,
                    color: Color(0xFF007EC7),
                    fontFamily: Str.POPPINS,
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        );
      },
    );
  }

  void _showNoQuestionsDialog() {
    // flutter defined function
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        // return alert dialog object
        return AlertDialog(
          //backgroundColor: Colors.white,
          title: new Text(
            "EMPTY ",
            style: TextStyle(
                fontSize: 15.5,
                color: Colors.grey,
                fontFamily: Str.POPPINS,
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          content: Text(
            "Sorry, ${widget.category.name} has no questions to display.",
            style: TextStyle(
                fontSize: 15,
                color: Colors.grey,
                fontFamily: Str.POPPINS,
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            InkWell(
              onTap: () {},
              child: new Text(
                "",
                style: TextStyle(
                    fontSize: 14.5,
                    // color: Colors.black.withOpacity(.5),
                    fontFamily: Str.POPPINS,
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              "               ",
              style: TextStyle(
                  fontSize: 14.5,
                  color: Color(0xFF007EC7),
                  fontFamily: Str.POPPINS,
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            InkWell(
              onTap: () async {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              child: new Text(
                "   Exit                  \n",
                style: TextStyle(
                    fontSize: 15.5,
                    color: Color(0xFF007EC7),
                    fontFamily: Str.POPPINS,
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        );
      },
    );
  }

  void _showNeverAskAgainDialog() {
    // flutter defined function
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        // return alert dialog object
        return AlertDialog(
          //backgroundColor: Colors.white,
          title: new Text(
            "NEVER ASK AGAIN ",
            style: TextStyle(
                fontSize: 15.5,
                color: Colors.grey,
                fontFamily: Str.POPPINS,
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          content: Text(
            "Confirm you are removing this question from your study?",
            style: TextStyle(
                fontSize: 15,
                color: Colors.grey,
                fontFamily: Str.POPPINS,
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: new Text(
                "   NO          \n",
                style: TextStyle(
                    fontSize: 14.5,
                    // color: Colors.black.withOpacity(.5),
                    fontFamily: Str.POPPINS,
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              "               ",
              style: TextStyle(
                  fontSize: 14.5,
                  color: Color(0xFF007EC7),
                  fontFamily: Str.POPPINS,
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            InkWell(
              onTap: () async {
                Navigator.of(context).pop();
                initNeverAskAgain();
              },
              child: new Text(
                "    YES       \n",
                style: TextStyle(
                    fontSize: 14.5,
                    color: Color(0xFF007EC7),
                    fontFamily: Str.POPPINS,
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget actionBar() => PreferredSize(
        preferredSize: Size.fromHeight(130.0),
        child: Container(
          child: AppBar(
            iconTheme: new IconThemeData(color: Colors.grey),
            title: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  "${widget.category.name}",
                  style: TextStyle(
                    fontSize: 23,
                    color: Colors.black.withOpacity(.9),
                    fontFamily: Str.POPPINS,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "$currentIndex/$quizCount",
                  style: TextStyle(
                    fontSize: 15,
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
            leading: Container(
              margin: EdgeInsets.only(left: 10),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  "<<",
                  style: TextStyle(
                    fontSize: 24,
                    color: QuizJetsTheme.quizJetsBlue,
                    fontFamily: Str.POPPINS,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: () {
                  _showPopupMenu();
                },
              ),
            ],
          ),
        ),
      );

  @override
  void dispose() {
    _pageController.dispose();
    initSaveState();
    super.dispose();
  }

  _onPageChanged(int index) {
    // setState(() {
    //   _currentSlider = index;
    // });
    checkLevel();

    setState(() {
      //reason = changeReason.toString();
      _currentSlider = index;
      showHelp = false;
      indexx = index;
      currentIndex = index + 1;
      currentDouble = currentIndex.toDouble() / quizCount;
      ansVisibility = false;
      videoUrl = questionsList[indexx].mediaUrl;
      print('NEW VIDEO URL ::: $videoUrl');
    });
  }

  uploadConfidence(
    var level,
  ) async {
    var userId = await GetUserInfo().getCurrentUserID();
    if (quizCount != currentIndex) {
      setState(() {
        ansVisibility = false;
      });
      _pageController.nextPage(
          duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
    }
    FirebaseFirestore.instance.collection('confidenceLevel').doc(userId).set({
      'dummyField': '',
    });
    await FirebaseFirestore.instance
        .collection('confidenceLevel')
        .doc("$userId")
        .collection('levelCollection')
        .doc("${questionsList[indexx].id}")
        .set({
      'level': level,
      'question_id': '${questionsList[indexx].id}',
      'level_id': "${questionsList[indexx].id}",
      'subject': "${questionsList[indexx].subject}",
      'question': "${questionsList[indexx].question}",
      'ans_1': "${questionsList[indexx].ans_1}",
      'ans_2': "${questionsList[indexx].ans_2}",
      'ans_3': "${questionsList[indexx].ans_3}",
      'ans_4': "${questionsList[indexx].ans_4}",
      'ans_5': "${questionsList[indexx].ans_4}",
      'mediaType': "${questionsList[indexx].mediaType}",
      'mediaUrl': "${questionsList[indexx].mediaUrl}",
      'id': "${questionsList[indexx].id}",
      'filter_id': "${questionsList[indexx].filter_id}",
      'active': true,
    }).then((value) {
      print('THE STOP VIDEO:::');
    });
  }

  initNeverAskAgain() async {
    var id = questionsList[indexx].id;
    var uid = await GetUserInfo().getCurrentUserID();
    print('NEVER ASK ID :::: $id');
    setState(() {});

    if (quizCount != currentIndex) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Color(0xFF007EC7),
          content: Text(
            "Success!",
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
              fontFamily: Str.POPPINS,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
            ),
          ),
        ),
      );
      _pageController.nextPage(
          duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
    }

    initDialog();
    FirebaseFirestore.instance.collection('neverAskAgain').doc(uid).set({
      'dummyField': '',
    });

    await FirebaseFirestore.instance
        .collection('neverAskAgain')
        .doc("$uid")
        .collection('levelCollection')
        .doc('${questionsList[indexx].id}')
        .set({
      'level': level,
      'question_id': '${questionsList[indexx].id}',
      'level_id': "${questionsList[indexx].id}",
      'subject': "${widget.category.name.toUpperCase()}",
      'question': "${questionsList[indexx].question}",
      'ans_1': "${questionsList[indexx].ans_1}",
      'ans_2': "${questionsList[indexx].ans_2}",
      'ans_3': "${questionsList[indexx].ans_3}",
      'ans_4': "${questionsList[indexx].ans_4}",
      'ans_5': "${questionsList[indexx].ans_4}",
      'mediaType': "${questionsList[indexx].mediaType}",
      'mediaUrl': "${questionsList[indexx].mediaUrl}",
      'id': "${questionsList[indexx].id}",
      'filter_id': "${questionsList[indexx].filter_id}",
      'active': true,
    }).then((value) {});
  }

  _showPopupMenu() {
    showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(25.0, 25.0, 0.0,
          0.0), //position where you want to show the menu on screen
      items: [
        PopupMenuItem<String>(
            child: Text(
              "Previous Question",
              style: TextStyle(
                //fontSize: 17,
                fontFamily: Str.POPPINS,
                fontWeight: FontWeight.w500,
                letterSpacing: 1.2,
              ),
              textAlign: TextAlign.start,
            ),
            value: '1'),
        // PopupMenuItem<String>(
        //     child: const Text(
        //       "Suggest Question",
        //       style: TextStyle(
        //         //fontSize: 17,
        //         fontFamily: Str.POPPINS,
        //         fontWeight: FontWeight.w500,
        //         letterSpacing: 1.2,
        //       ),
        //       textAlign: TextAlign.start,
        //     ),
        //     value: '2'),
        PopupMenuItem<String>(
            child: const Text(
              "Never ask again?",
              style: TextStyle(
                //fontSize: 17,
                fontFamily: Str.POPPINS,
                fontWeight: FontWeight.w500,
                letterSpacing: 1.2,
              ),
              textAlign: TextAlign.start,
            ),
            value: '3'),
      ],
      elevation: 8.0,
    ).then<void>((String itemSelected) {
      if (itemSelected == null) return;

      if (itemSelected == "1") {
        _pageController.previousPage(
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOut);
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => ReportError(),
        //   ),
        // );
      } else if (itemSelected == "2") {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SuggestQuestion(),
          ),
        );
      } else {
        _showNeverAskAgainDialog();
      }
    });
  }

  Future getNeverAskAgain() async {
    neverAskAgainIds.clear();
    var uid = await GetUserInfo().getCurrentUserID();
    await FirebaseFirestore.instance
        .collection('neverAskAgain')
        .doc(uid)
        .collection('levelCollection')
        .get()
        .then(
      (value) {
        print('NEVER ASK AGAIN VALUE::: $value');
        neverAskAgainIds.clear();
        for (var item in value.docs) {
          Question questions = Question(
            item["question"],
            item["id"],
            item["ans_1"],
            item["ans_2"],
            item["ans_3"],
            item["ans_4"],
            item["mediaType"],
            item["mediaUrl"],
            item["active"],
            item["subject"],
            item["filter_id"],
          );

          neverAskAgainIds.add(questions);
          neverAskAgainIds.shuffle();
        }
      },
    );
    setState(() {});
    return neverAskAgainIds.toSet().toList();
  }
}

class QuestionPhoto extends StatefulWidget {
  final imageUrl;

  QuestionPhoto({
    this.imageUrl,
  });
  @override
  _MyImageState createState() => _MyImageState();
}

class _MyImageState extends State<QuestionPhoto> {
  @override
  Widget build(BuildContext context) {
    // https://github.com/flutter/flutter/issues/41563
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      widget.imageUrl,
      (int _) => ImageElement()..src = widget.imageUrl,
    );

    return Container(
      height: 250,
      //width: 180,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(
          .1,
        ),
        // borderRadius: BorderRadius.all(
        //   Radius.circular(6),
        // ),
      ),
      child: HtmlElementView(
        viewType: widget.imageUrl,
      ),
    );
  }
}
