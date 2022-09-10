import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quizjets/export_files.dart';
import 'package:responsive_builder/responsive_builder.dart';

class WebFilterQuestionPage extends StatefulWidget {
  static const String route = '/filter_questions';
  final quizzList;

  WebFilterQuestionPage({
    this.quizzList,
  });
  @override
  _WebFilterQuestionPageState createState() => _WebFilterQuestionPageState();
}

class _WebFilterQuestionPageState extends State<WebFilterQuestionPage> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentSlider = 0;
  bool showHelp = true;
  int currentIndex = 1;
  var quizCount = 0;
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

  Future<void> initializePlayer() async {}
  ChewieController _chewieController;

  var level = '';
  var questionId = '';
  String videoUrl = '';
  bool _stopVideo = false;

  @override
  void initState() {
    super.initState();
    initStopVideo();
    initQuestions();
    countNumberOfQuestions();
    initIndex();
    checkLevel();
    checkLevel2(widget.quizzList);
  }

  initStopVideo() {
    _stopVideo = false;
    setState(() {});
  }

  initQuizCount() {
    setState(() {
      quizCount = widget.quizzList.length;
    });
  }

  checkLevel() async {
    final uid = await GetUserInfo().getCurrentUserID();
    level = null;
    setState(() {});

    FirebaseFirestore.instance.collection('confidenceLevel').doc(uid).set({
          'dummyField': '',
        });

    await FirebaseFirestore.instance
        .collection('confidenceLevel')
        .doc('$uid')
        .collection('levelCollection')
        .doc('${widget.quizzList[indexx].id}')
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
        .doc('${widget.quizzList[indexx].id}')
        .get()
        .then((value) {
      if (level == value.data()['level']) return;
      level = value.data()['level'];
      setState(() {});
    });
  }

  initQuestions() {
    initQuizCount();
    // getAGQuetions();
    // getFPQuetions();
    // getEDQuetions();
    // getVMQuetions();
    // getConfiLevel();

    checkLevel();
    setState(() {});
    // print('THE LISTSS ::: LOADING...');
    // questionsList = questionsFPList + questionsAGList;
    // print('THE LISTSS ::: $questionsList');
    // print('THE FP LISTSS ::: $questionsFPList...');
    // print('THE AG LISTSS ::: $questionsAGList...');

    setState(() {});
  }

  initIndex() {
    currentIndex = 1;

    setState(() {});
  }

  initDialog() {
    if (widget.quizzList.length == currentIndex) {
      _stopVideo = true;
      setState(() {});
      Future.delayed(const Duration(seconds: 1), () {
        _showLastDialog();
      });
    }
  }

  void countNumberOfQuestions() {
    if (widget.quizzList == null) return;
    setState(
      () {
        quizCount = widget.quizzList.length;
      },
    ); // Count of Documents in Collection
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop(true);
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: actionBar(),
        body: Center(
          child: Container(
            width: 500,
            color: Colors.white,
            child: PageView.builder(
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                controller: _pageController,
                onPageChanged: _onPageChanged,
                itemCount: widget.quizzList.length,
                itemBuilder: (context, i) => InkWell(
                      onTap: () {
                        // checkLevel();
                        onPassChanged();
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
                                  widget.quizzList[i].mediaType == 'IMAGE' ??
                                      false,
                              child: SizedBox(
                                height: 250,
                                width: MediaQuery.of(context).size.width,
                                child: QuestionPhoto(
                                  imageUrl: "${widget.quizzList[i].mediaUrl}",
                                ),
                              ),
                            ),
                            Visibility(
                              visible: widget.quizzList[i].mediaType == 'MP4' ||
                                      widget.quizzList[i].mediaType == 'MP3' ??
                                  false,
                              child: _stopVideo
                                  ? Container(
                                      height: 250,
                                      color: Colors.black,
                                    )
                                  : VideoView(
                                      videoUrl: widget.quizzList[i].mediaUrl,
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
                                    '${widget.quizzList[i].question.replaceAll("\\n", "\n")}',
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
                                '${widget.quizzList[i].ans_1.replaceAll("\\n", "\n")}'),
                            widget.quizzList[i].ans_2 != ''
                                ? ansContainer(
                                    '${widget.quizzList[i].ans_2.replaceAll("\\n", "\n")}',
                                  )
                                : Container(),
                            widget.quizzList[i].ans_3 != ''
                                ? ansContainer(
                                    '${widget.quizzList[i].ans_3.replaceAll("\\n", "\n")}',
                                  )
                                : Container(),
                            widget.quizzList[i].ans_4 != ''
                                ? ansContainer(
                                    '${widget.quizzList[i].ans_4.replaceAll("\\n", "\n")}',
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
                          color: level == 'LOW' ? Color(0xFF007EC7) : Colors.grey,
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
                          color:
                              level == 'AVERAGE' ? Color(0xFF007EC7) : Colors.grey,
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
                        color:
                            level == 'VERY HIGH' ? Color(0xFF007EC7) : Colors.grey,
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
            "You have completed Mix It Up",
            style: TextStyle(
                fontSize: 15,
                color: Colors.grey,
                fontFamily: Str.POPPINS,
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            // InkWell(
            //   onTap: () {
            //     _stopVideo = false;
            //     setState(() {

            //     });
            //     Navigator.of(context).pop();
            //     //countNumberOfQuestions();
            //     widget.quizzList.shuffle();
            //     //initQuestions();
            //     _pageController.jumpTo(0);
            //   },
            //   child: new Text(
            //     " Repeat Mix It Up? \n",
            //     style: TextStyle(
            //         fontSize: 14.5,
            //         // color: Colors.black.withOpacity(.5),
            //         fontFamily: Str.POPPINS,
            //         fontWeight: FontWeight.w600),
            //     textAlign: TextAlign.center,
            //   ),
            // ),
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
                Navigator.of(context).pop();
                initBack();
              },
              child: new Text(
                "   Select a new Filter?  \n",
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

  initBack() {
    Navigator.of(context).pop(true);
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
                "   NO       \n",
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
        preferredSize: Size.fromHeight(100.0),
        child: Container(
          child: AppBar(
            iconTheme: new IconThemeData(color: Colors.grey),
            title: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Mix It Up",
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
                  "$currentIndex/${widget.quizzList.length}",
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
    _chewieController.videoPlayerController.dispose();
    _chewieController.dispose();
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
      print('NEW VIDEO URL ::: $videoUrl');
      initVideoUrl2(videoUrl);
    });
  }

  initVideoUrl2(String url) {
    if (mounted)
      setState(() {
        videoUrl = widget.quizzList[indexx].mediaUrl;
        print('URL SSSS :: $videoUrl');
      });
    _chewieController = ChewieController(
      //* VideoPlayer Network constructor for playing video from internet
      videoPlayerController: VideoPlayerController.network('$url'),

      aspectRatio: 16 / 9,
      autoInitialize: true,
      autoPlay: false,
      looping: false,
      fullScreenByDefault: false,
      showControlsOnInitialize: true,
      showControls: true,
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              errorMessage,
              style: TextStyle(
                color: Colors.white,
                fontFamily: Str.POPPINS,
              ),
            ),
          ),
        );
      },
    );
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
    await FirebaseFirestore.instance.collection('confidenceLevel').doc("$userId").set({
        'dummyField': '',
      });

    await FirebaseFirestore.instance
        .collection('confidenceLevel')
        .doc("$userId")
        .collection('levelCollection')
        .doc("${widget.quizzList[indexx].id}")
        .set({
      'level': level,
      'question_id': '${widget.quizzList[indexx].id}',
      'level_id': "${widget.quizzList[indexx].id}",
      'question': "${widget.quizzList[indexx].question}",
      'subject': "${widget.quizzList[indexx].subject}",
      'ans_1': "${widget.quizzList[indexx].ans_1}",
      'ans_2': "${widget.quizzList[indexx].ans_2}",
      'ans_3': "${widget.quizzList[indexx].ans_3}",
      'ans_4': "${widget.quizzList[indexx].ans_4}",
      'mediaType': "${widget.quizzList[indexx].mediaType}",
      'mediaUrl': "${widget.quizzList[indexx].mediaUrl}",
      'id': "${widget.quizzList[indexx].id}",
      'filter_id': "${widget.quizzList[indexx].filter_id}",
      'active': true,
    }).then((value) {
      if (quizCount == currentIndex) {
        _stopVideo = true;
        setState(() {});
        return;
      }
      //_chewieController.pause();
    });
  }

  initNeverAskAgain() async {
    var id = widget.quizzList[indexx].id;
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
   await FirebaseFirestore.instance.collection('neverAskAgain').doc("$uid").set({
        'dummyField': '',
      });
    await FirebaseFirestore.instance
        .collection('neverAskAgain')
        .doc("$uid")
        .collection('levelCollection')
        .doc('${widget.quizzList[indexx].id}')
        .set({
      'level': level,
      'question_id': '${widget.quizzList[indexx].id}',
      'level_id': "${widget.quizzList[indexx].id}",
      'subject': "${widget.quizzList[indexx].subject}",
      'question': "${widget.quizzList[indexx].question}",
      'ans_1': "${widget.quizzList[indexx].ans_1}",
      'ans_2': "${widget.quizzList[indexx].ans_2}",
      'ans_3': "${widget.quizzList[indexx].ans_3}",
      'ans_4': "${widget.quizzList[indexx].ans_4}",
      'mediaType': "${widget.quizzList[indexx].mediaType}",
      'mediaUrl': "${widget.quizzList[indexx].mediaUrl}",
      'id': "${widget.quizzList[indexx].id}",
      'filter_id': "${widget.quizzList[indexx].filter_id}",
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
          duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
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
}
