

import 'package:flutter/material.dart';
import 'package:quizjets/export_files.dart';

class FilterPage extends StatefulWidget {
  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  var errorController = TextEditingController();
  bool selectAllValue = false;
  bool airplaneGeneralValue = false;
  bool electronicDisplayValue = false;
  bool fireProtectionValue = false;

  // bool lowCheckBoxValue = false;
  // bool highCheckBoxValue = false;
  // bool averageCheckBoxValue = false;
  // bool vHighCheckBoxValue = false;
  // bool selectAllConfidenceValue = false;

  List<String> confidenceLevelIds = [];
  List<String> lowLevelIds = [];
  List<String> averageLevelIds = [];
  List<String> highLevelIds = [];
  List<String> vHighLevelIds = [];

  String confidenceLevelValue = 'Low';

  List<Question> questionsList = [];
  List<Question> questionsFPList = [];
  List<Question> questionsAllList = [];

  List<Question> questionsLowAGList = [];
  List<Question> questionsLowFPList = [];
  List<Question> questionsLowVMList = [];

  List<Question> questionsAGList = [];
  List<Question> questionsEDList = [];
  List<Question> questionsEGList = [];

  List<Question> questionsAvFPList = [];
  List<Question> questionsAvAGList = [];
  List<Question> questionsAvEGList = [];

  List<Question> questionsHighFPList = [];
  List<Question> questionsHighAGList = [];
  List<Question> questionsHighEGList = [];

  List<Question> questionsVHighFPList = [];
  List<Question> questionsVHighAGList = [];
  List<Question> questionsVHighEGList = [];

  List<Question> questionsALLCLList = [];
  List<Question> cLevelList = [];

  List<String> nonCLevelIds = [];
  List<String> nonAGCLevelIds = [];
  List<String> nonEDCLevelIds = [];
  List<String> nonFPCLevelIds = [];
  List<Question> neverAskAgainIds = [];

  int airplaneGeneralCount = 0;
  int fireProtectionCount = 0;
  int electronicDisplayCount = 0;
  int _levelValue = 1;
  int confidenceLeveCount = 0;

  final spinkit = SpinKitThreeBounce(
    color: Colors.white,
    size: 15.0,
  );

  bool loadingCount = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: true,
      appBar: actionBar(),
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 20.0,
        ),
        child: ListView(children: <Widget>[
          SizedBox(height: 40.0),
          Text(
            "Confidence Levels: ( $confidenceLevelValue )",
            textAlign: TextAlign.start,
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontFamily: Str.POPPINS,
                color: Colors.grey,
                fontSize: 17.0),
          ),
          SizedBox(height: 20.0),
          Row(
            children: [
              Text(
                "Low",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: Str.POPPINS,
                    color: Colors.grey,
                    fontSize: 11.0),
              ),
              Expanded(
                child: Slider(
                  value: _levelValue.toDouble(),
                  min: 0,
                  max: 100,
                  divisions: 3,
                  activeColor: Color(0xFF007EC7),
                  onChanged: (double value) {
                    setState(
                      () {
                        _levelValue = value.round();
                        if (value.round() == 0) {
                          confidenceLevelValue = 'Low';
                          initConfidenceFilter();
                          return;
                        }
                        if (value.round() == 33) {
                          confidenceLevelValue = 'Average';
                          initConfidenceFilter();
                          return;
                        }
                        if (value.round() == 67) {
                          confidenceLevelValue = 'High';
                          initConfidenceFilter();
                          return;
                        }
                        if (value.round() == 100) {
                          confidenceLevelValue = 'Very High';
                          initConfidenceFilter();
                          return;
                        }
                        

                        //initFilters();
                      },
                    );
                  },
                ),
              ),
              Text(
                "Very High",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: Str.POPPINS,
                    color: Colors.grey,
                    fontSize: 11.0),
              ),
            ],
          ),
          SizedBox(height: 35.0),
          Text(
            "Categories",
            textAlign: TextAlign.start,
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontFamily: Str.POPPINS,
                color: Colors.grey,
                fontSize: 17.0),
          ),
          SizedBox(height: 20.0),
          ListTile(
            leading: Text(
              "Select All",
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: Str.POPPINS,
                  color: Colors.grey,
                  fontSize: 16.0),
            ),
            trailing: new Theme(
              data: ThemeData(
                primarySwatch: Colors.grey,
                unselectedWidgetColor: Colors.grey, // Your color
              ),
              child: Checkbox(
                value: selectAllValue,
                activeColor: Color(0xFF007EC7),
                onChanged: (bool newValue) {
                  setState(() {
                    if(loadingCount) return;

                    questionsList.clear();
                    selectAllValue = newValue;

                    selectAll();
                    //_onLoading();
                    initConfidenceFilter();
                  });
                  //onSelectAllChanged();
                },
              ),
            ),
          ),
          ListTile(
            leading: Text(
              "Airplane General",
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: Str.POPPINS,
                  color: Colors.grey,
                  fontSize: 16.0),
            ),
            trailing: new Theme(
              data: ThemeData(
                primarySwatch: Colors.grey,
                unselectedWidgetColor: Colors.grey, // Your color
              ),
              child: Checkbox(
                value: airplaneGeneralValue,
                activeColor: Color(0xFF007EC7),
                onChanged: (bool newValue) {
                  setState(() {
                    if(loadingCount) return;

                    airplaneGeneralValue = newValue;
                    //initConfidenceFilter();
                    // countAirplaneGeneral();
                    checkForselectAll();
                    //_onLoading();
                    initConfidenceFilter();
                  });
                  //onSelectAllChanged();
                },
              ),
            ),
          ),
          ListTile(
            leading: Text(
              "Electronic Displays",
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: Str.POPPINS,
                  color: Colors.grey,
                  fontSize: 16.0),
            ),
            trailing: new Theme(
              data: ThemeData(
                primarySwatch: Colors.grey,
                unselectedWidgetColor: Colors.grey, // Your color
              ),
              child: Checkbox(
                value: electronicDisplayValue,
                activeColor: Color(0xFF007EC7),
                onChanged: (bool newValue) {
                  setState(() {
                    if(loadingCount) return;

                    electronicDisplayValue = newValue;
                    //initConfidenceFilter();
                    // countElectronicDisplay();
                    checkForselectAll();
                    //_onLoading();
                    initConfidenceFilter();
                  });
                  //onSelectAllChanged();
                },
              ),
            ),
          ),
          ListTile(
            leading: Text(
              "Fire Protection",
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: Str.POPPINS,
                  color: Colors.grey,
                  fontSize: 16.0),
            ),
            trailing: new Theme(
              data: ThemeData(
                primarySwatch: Colors.grey,
                unselectedWidgetColor: Colors.grey, // Your color
              ),
              child: Checkbox(
                value: fireProtectionValue,
                activeColor: Color(0xFF007EC7),
                onChanged: (bool newValue) async {
                  setState(() {
                    if(loadingCount) return;

                    fireProtectionValue = newValue;
                    //initConfidenceFilter();
                    // countFireProtection();

                    checkForselectAll();
                    //_onLoading();
                    initConfidenceFilter();
                  });
                },
              ),
            ),
          ),
          // ListTile(
          //   leading: Text(
          //     "Various Media",
          //     textAlign: TextAlign.start,
          //     style: TextStyle(
          //         fontWeight: FontWeight.w600,
          //         fontFamily: Str.POPPINS,
          //         color: Colors.grey,
          //         fontSize: 16.0),
          //   ),
          //   trailing: new Theme(
          //     data: ThemeData(
          //       primarySwatch: Colors.grey,
          //       unselectedWidgetColor: Colors.grey, // Your color
          //     ),
          //     child: Checkbox(
          //       value: variousMediaValue,
          //       activeColor: Color(0xFF007EC7),
          //       onChanged: (bool newValue) {
          //         setState(() {
          //           if(loadingCount) return;

          //           variousMediaValue = newValue;
          //           //initConfidenceFilter();
          //           // countVariousMedia();
          //           checkForselectAll();
          //           //_onLoading();
          //           initConfidenceFilter();
          //         });
          //         //onSelectAllChanged();
          //       },
          //     ),
          //   ),
          // ),
          SizedBox(height: 20.0),
        ]),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 20.0,
        ),
        height: 55.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                clearAll();
              },
              child: Text(
                "Clear All",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: Str.POPPINS,
                    color: Colors.grey,
                    fontSize: 16.0),
              ),
            ),
            GestureDetector(
              onTap: () async {
                if(loadingCount)return;
                if (confidenceLeveCount == 0) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Color(0xFF007EC7),
                      content: Text(
                        "No Questions to display!",
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
                  return;
                }
                questionsList.shuffle();
                bool isBack = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FilterQuestionPage(
                      agFilter: airplaneGeneralValue,
                      edFilter: electronicDisplayValue,
                      fpFilter: fireProtectionValue,
                      level: confidenceLevelValue,
                      quizzList: questionsList,
                    ),
                  ),
                );
                if(null == isBack) return;
                if(isBack) {
                  initConfidenceFilter();
                  return;
                }
   
              },
              child: Container(
                width: 140,
                padding: EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 5.0,
                ),
                margin: EdgeInsets.symmetric(
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: Color(0xFF007EC7),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: loadingCount
                      ? spinkit
                      : Text(
                          "$confidenceLeveCount Questions",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontFamily: Str.POPPINS,
                              color: Colors.white,
                              fontSize: 15.5),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    readFilter();
    initConfidenceFilter();
    // getAllConfidencelevelIds();
  }

  @override
  void dispose() {
    super.dispose();
    rememberFilter();
  }

  unselectAll() {
    selectAllValue = false;
    setState(() {});
  }

  checkForselectAll() {
    if (airplaneGeneralValue &&
        electronicDisplayValue &&
        fireProtectionValue) {
      selectAllValue = true;
      setState(() {});
      return;
    }
    unselectAll();
  }

  clearAll() {
    selectAllValue = false;
    airplaneGeneralValue = false;
    electronicDisplayValue = false;
    fireProtectionValue = false;
    confidenceLevelValue = 'Low';
    _levelValue = 0;

    setState(() {});
    questionsList.clear();
    //_onLoading();
    initConfidenceFilter();
  }

  onSelectFireProtectionChanged() {
    if (mounted)
      setState(() {
        fireProtectionValue = !fireProtectionValue;
      });
  }

  selectAll() {
    if (selectAllValue) {
      airplaneGeneralValue = true;
      electronicDisplayValue = true;
      fireProtectionValue = true;
      //countAll();
      setState(() {});
      return;
    }
    airplaneGeneralValue = false;
    electronicDisplayValue = false;
    fireProtectionValue = false;
    //countAll();
    setState(() {});
  }

  // countAll() {
  //   countAirplaneGeneral();
  //   countElectronicDisplay();
  //   countFireProtection();
  //   countVariousMedia();
  // }

  void countFireProtection() async {
    if (!fireProtectionValue) {
      fireProtectionCount = 0;
      setState(() {});
      return;
    }
    // fetching confidence level ids
    var uid = await GetUserInfo().getCurrentUserID();
    await FirebaseFirestore.instance
        .collection('confidenceLevel')
        .doc(uid)
        .collection('levelCollection')
        .where('level', isEqualTo: '${confidenceLevelValue.toUpperCase()}')
        .where('subject', isEqualTo: 'FIRE PROTECTION')
        .get(GetOptions(source: Source.serverAndCache))
        .then(
      (value) {
        print('CONFIDENCE LEVEL VALUE::: $value');
        for (var item in value.docs) {
          confidenceLevelIds.add(item["question_id"]);
        }
      },
    );
    // counting
    QuerySnapshot _myDoc = await FirebaseFirestore.instance
        .collection('quizjetsQuestions')
        .doc('000')
        .collection('questionsCollection')
        .where('active', isEqualTo: true)
        .where('id', whereIn: confidenceLevelIds)
        .where('FIRE_PROTECTION', isEqualTo: true)
        .get(GetOptions(source: Source.serverAndCache));
    List<DocumentSnapshot> _myDocCount = _myDoc.docs; //
    setState(
      () {
        fireProtectionCount = _myDocCount.length;
      },
    );
  }

  void countElectronicDisplay() async {
    if (!electronicDisplayValue) {
      electronicDisplayCount = 0;
      setState(() {});
      return;
    }
    QuerySnapshot _myDoc = await FirebaseFirestore.instance
        .collection('quizjetsQuestions')
        .doc('000')
        .collection('questionsCollection')
        .where('active', isEqualTo: true)
        .where('ELECTRONIC_DISPLAYS', isEqualTo: true)
        .get(GetOptions(source: Source.serverAndCache));
    List<DocumentSnapshot> _myDocCount = _myDoc.docs; //
    setState(
      () {
        electronicDisplayCount = _myDocCount.length;
      },
    );
  }

  Future getAllConfidenceQuestions(var idz) async {
    setState(() {});
    await FirebaseFirestore.instance
        .collection('quizjetsQuestions')
        .doc('000')
        .collection('questionsCollection')
        .where('id', whereIn: idz)
        .get(GetOptions(source: Source.serverAndCache))
        .then((value) {
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

        questionsAllList.add(questions);
        questionsAllList.shuffle();
      }
    });
    setState(() {});
    questionsList.addAll(questionsAllList);
    questionsList.shuffle();
    //confidenceLeveCount = questionsList.length;
    return questionsAllList;
  }

  Widget actionBar() => AppBar(
        //iconTheme: new IconThemeData(color: Colors.grey),
        title: Column(
          children: [
            Text(
              "Mix It Up",
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
            Icons.clear,
            color: Colors.grey,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      );

  bool isFilterInitd() {
    if (airplaneGeneralValue) {
      return airplaneGeneralValue;
    }
    if (electronicDisplayValue) {
      return electronicDisplayValue;
    }
    if (fireProtectionValue) {
      return fireProtectionValue;
    }
    return false;
  }

  void rememberFilter() async {
    var uid = await GetUserInfo().getCurrentUserID();
    await FirebaseFirestore.instance.collection('userFilter').doc('$uid').set(
      {
        'airplaneGeneralValue': airplaneGeneralValue,
        'electricalDisplaysValue': electronicDisplayValue,
        'fireProtectionValue': fireProtectionValue,
        'confidenceLevelValue': confidenceLevelValue,
        'levelValue': _levelValue,
        'selectAllValue': selectAllValue,
      },
    );
  }

  void readFilter() async {
    var uid = await GetUserInfo().getCurrentUserID();
    await FirebaseFirestore.instance
        .collection('userFilter')
        .doc(uid)
        .get(GetOptions(source: Source.serverAndCache))
        .then(
      (value) {
        airplaneGeneralValue = value.data()['airplaneGeneralValue'];
        electronicDisplayValue = value.data()['electricalDisplaysValue'];
        fireProtectionValue = value.data()['fireProtectionValue'];
        confidenceLevelValue = value.data()['confidenceLevelValue'];
        selectAllValue = value.data()['selectAllValue'];

        _levelValue = value.data()['levelValue'] ?? 0;
        setState(() {
          initConfidenceFilter();
          // countAirplaneGeneral();
          // countElectronicDisplay();
          // countFireProtection();
          // countVariousMedia();
        });
      },
    );
  }

  /*************************** FRESH FILTER ********************************/

  Future getFPQuetions() async {
    questionsFPList.clear();
    await FirebaseFirestore.instance
        .collection('quizjetsQuestions')
        .doc('000')
        .collection('questionsCollection')
        .where('active', isEqualTo: true)
        .where('FIRE_PROTECTION', isEqualTo: fireProtectionValue)
        //.where('AIRPLANE_GENERAL', isEqualTo: true)
        .get(GetOptions(source: Source.serverAndCache))
        .then((value) {
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

        questionsFPList.add(questions);
        questionsFPList.shuffle();
      }
      //initVideoUrl(questionsList);
    });
    setState(() {});
    questionsList.addAll(questionsFPList);
    questionsList.shuffle();
    // confidenceLeveCount = questionsList.length;
    setState(() {});
    return questionsFPList.toSet().toList();
  }

  Future getLowFireProtectionQuetions() async {
    questionsLowFPList.clear();
    //questionsList.clear();

    setState(() {});
    var uid = await GetUserInfo().getCurrentUserID();

    await FirebaseFirestore.instance
        .collection('quizjetsQuestions')
        .doc('000')
        .collection('questionsCollection')
        //.where('AIRPLANE_GENERAL', isEqualTo: true)
        .get(GetOptions(source: Source.serverAndCache))
        .then((value) {
      questionsLowFPList.clear();
      // questionsList.clear();
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

        questionsLowFPList.add(questions);
        questionsLowFPList.shuffle();
      }
      //initVideoUrl(questionsList);
    });

    await FirebaseFirestore.instance
        .collection('confidenceLevel')
        .doc('$uid')
        .collection('levelCollection')
        .where('subject', isEqualTo: 'FIRE PROTECTION')
        .where('level', isEqualTo: 'LOW')
        .get(GetOptions(source: Source.serverAndCache))
        .then((value) {
      questionsLowFPList.clear();
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

        questionsLowFPList.add(questions);
        questionsLowFPList.shuffle();
      }
      //initVideoUrl(questionsList);
    });
    var neverAskAgainQuiz = await getNeverAskAgain();
    for (var quizId in neverAskAgainQuiz) {
      questionsLowFPList.removeWhere((item) => item.id == quizId.id);
    }
    setState(() {});
    questionsList.addAll(questionsLowFPList);
    questionsList.shuffle();
    // confidenceLeveCount = questionsList.length;
    setState(() {});
    return questionsLowFPList.toSet().toList();
  }

  Future getAverageFireProtectionQuetions() async {
    questionsAvFPList.clear();
    //questionsList.clear();
    setState(() {});
    var uid = await GetUserInfo().getCurrentUserID();
    await FirebaseFirestore.instance
        .collection('confidenceLevel')
        .doc('$uid')
        .collection('levelCollection')
        .where('filter_id', isEqualTo: 'FIRE_PROTECTION')
        .where('level', isEqualTo: 'AVERAGE')
        .get(GetOptions(source: Source.serverAndCache))
        .then((value) {
      questionsAvFPList.clear();
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

        questionsAvFPList.add(questions);
        questionsAvFPList.shuffle();
      }
      //initVideoUrl(questionsList);
    });
    var neverAskAgainQuiz = await getNeverAskAgain();
    for (var quizId in neverAskAgainQuiz) {
      questionsAvFPList.removeWhere((item) => item.id == quizId.id);
    }
    setState(() {});
    questionsList.addAll(questionsAvFPList);
    questionsList.shuffle();
    // confidenceLeveCount = questionsList.length;
    setState(() {});
    return questionsAvFPList.toSet().toList();
  }

  Future getHighFireProtectionQuetions() async {
    questionsHighFPList.clear();
    //questionsList.clear();
    setState(() {});
    var uid = await GetUserInfo().getCurrentUserID();
    await FirebaseFirestore.instance
        .collection('confidenceLevel')
        .doc('$uid')
        .collection('levelCollection')
        .where('filter_id', isEqualTo: 'FIRE_PROTECTION')
        .where('level', isEqualTo: 'HIGH')
        .get(GetOptions(source: Source.serverAndCache))
        .then((value) {
      questionsHighFPList.clear();
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

        questionsHighFPList.add(questions);
        questionsHighFPList.shuffle();
      }
      //initVideoUrl(questionsList);
    });
    var neverAskAgainQuiz = await getNeverAskAgain();
    for (var quizId in neverAskAgainQuiz) {
      questionsHighFPList.removeWhere((item) => item.id == quizId.id);
    }
    setState(() {});
    questionsList.addAll(questionsHighFPList);
    questionsList.shuffle();
    // confidenceLeveCount = questionsList.length;
    setState(() {});
    return questionsHighFPList.toSet().toList();
  }

  Future getVHighFireProtectionQuetions() async {
    questionsVHighFPList.clear();
    //questionsList.clear();
    setState(() {});
    var uid = await GetUserInfo().getCurrentUserID();
    await FirebaseFirestore.instance
        .collection('confidenceLevel')
        .doc('$uid')
        .collection('levelCollection')
        .where('filter_id', isEqualTo: 'FIRE_PROTECTION')
        .where('level', isEqualTo: 'VERY HIGH')
        .get(GetOptions(source: Source.serverAndCache))
        .then((value) {
      questionsVHighFPList.clear();
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

        questionsVHighFPList.add(questions);
        questionsVHighFPList.shuffle();
      }
      //initVideoUrl(questionsList);
    });
    var neverAskAgainQuiz = await getNeverAskAgain();
    for (var quizId in neverAskAgainQuiz) {
      questionsVHighFPList.removeWhere((item) => item.id == quizId.id);
    }
    setState(() {});
    questionsList.addAll(questionsVHighFPList);
    questionsList.shuffle();
    // confidenceLeveCount = questionsList.length;
    setState(() {});
    return questionsVHighFPList.toSet().toList();
  }

  Future getLowAirplaneGeneralQuetions() async {
    questionsLowAGList.clear();
    //questionsList.clear();
    setState(() {});
    var uid = await GetUserInfo().getCurrentUserID();
    await FirebaseFirestore.instance
        .collection('confidenceLevel')
        .doc('$uid')
        .collection('levelCollection')
        .where('subject', isEqualTo: 'AIRPLANE GENERAL')
        .where('level', isEqualTo: 'LOW')
        .get(GetOptions(source: Source.serverAndCache))
        .then((value) {
      questionsLowAGList.clear();
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

        questionsLowAGList.add(questions);
        questionsLowAGList.shuffle();
      }
      //initVideoUrl(questionsList);
    });
    var neverAskAgainQuiz = await getNeverAskAgain();
    for (var quizId in neverAskAgainQuiz) {
      questionsLowAGList.removeWhere((item) => item.id == quizId.id);
    }
    setState(() {});
    questionsList.addAll(questionsLowAGList);
    questionsList.shuffle();
    // confidenceLeveCount = questionsList.length;
    setState(() {});
    return questionsLowAGList.toSet().toList();
  }

  Future getAverageAirplaneGeneralQuetions() async {
    questionsAvAGList.clear();
    //questionsList.clear();
    setState(() {});
    var uid = await GetUserInfo().getCurrentUserID();
    await FirebaseFirestore.instance
        .collection('confidenceLevel')
        .doc('$uid')
        .collection('levelCollection')
        .where('filter_id', isEqualTo: 'AIRPLANE_GENERAL')
        .where('level', isEqualTo: 'AVERAGE')
        .get(GetOptions(source: Source.serverAndCache))
        .then((value) {
      questionsAvAGList.clear();
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

        questionsAvAGList.add(questions);
        questionsAvAGList.shuffle();
      }
      //initVideoUrl(questionsList);
    });
    var neverAskAgainQuiz = await getNeverAskAgain();
    for (var quizId in neverAskAgainQuiz) {
      questionsAvAGList.removeWhere((item) => item.id == quizId.id);
    }
    setState(() {});
    questionsList.addAll(questionsAvAGList);
    questionsList.shuffle();
    // confidenceLeveCount = questionsList.length;
    setState(() {});
    return questionsAvAGList.toSet().toList();
  }

  Future getHighAirplaneGeneralQuetions() async {
    questionsHighAGList.clear();
    //questionsList.clear();
    setState(() {});
    var uid = await GetUserInfo().getCurrentUserID();
    await FirebaseFirestore.instance
        .collection('confidenceLevel')
        .doc('$uid')
        .collection('levelCollection')
        .where('filter_id', isEqualTo: 'AIRPLANE_GENERAL')
        .where('level', isEqualTo: 'HIGH')
        .get(GetOptions(source: Source.serverAndCache))
        .then((value) {
      questionsHighAGList.clear();
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

        questionsHighAGList.add(questions);
        questionsHighAGList.shuffle();
      }
      //initVideoUrl(questionsList);
    });
    var neverAskAgainQuiz = await getNeverAskAgain();
    for (var quizId in neverAskAgainQuiz) {
      questionsHighAGList.removeWhere((item) => item.id == quizId.id);
    }
    setState(() {});
    questionsList.addAll(questionsHighAGList);
    questionsList.shuffle();
    // confidenceLeveCount = questionsList.length;
    setState(() {});
    return questionsHighAGList.toSet().toList();
  }

  Future getVHighAirplaneGeneralQuetions() async {
    questionsVHighAGList.clear();
    //questionsList.clear();
    setState(() {});
    var uid = await GetUserInfo().getCurrentUserID();
    await FirebaseFirestore.instance
        .collection('confidenceLevel')
        .doc('$uid')
        .collection('levelCollection')
        .where('filter_id', isEqualTo: 'AIRPLANE_GENERAL')
        .where('level', isEqualTo: 'VERY HIGH')
        .get(GetOptions(source: Source.serverAndCache))
        .then((value) {
      questionsVHighAGList.clear();
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

        questionsVHighAGList.add(questions);
        questionsVHighAGList.shuffle();
      }
      //initVideoUrl(questionsList);
    });
    var neverAskAgainQuiz = await getNeverAskAgain();
    for (var quizId in neverAskAgainQuiz) {
      questionsVHighAGList.removeWhere((item) => item.id == quizId.id);
    }
    setState(() {});
    questionsList.addAll(questionsVHighAGList);
    questionsList.shuffle();
    // confidenceLeveCount = questionsList.length;
    setState(() {});
    return questionsVHighAGList.toSet().toList();
  }

  Future getLowElectronicDisplayQuetions() async {
    questionsEGList.clear();
    //questionsList.clear();
    setState(() {});
    var uid = await GetUserInfo().getCurrentUserID();
    await FirebaseFirestore.instance
        .collection('confidenceLevel')
        .doc('$uid')
        .collection('levelCollection')
        .where('filter_id', isEqualTo: 'ELECTRONIC_DISPLAYS')
        .where('level', isEqualTo: 'LOW')
        .get(GetOptions(source: Source.serverAndCache))
        .then((value) {
      questionsEGList.clear();
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

        questionsEGList.add(questions);
        questionsEGList.shuffle();
      }
      //initVideoUrl(questionsList);
    });
    var neverAskAgainQuiz = await getNeverAskAgain();
    for (var quizId in neverAskAgainQuiz) {
      questionsEGList.removeWhere((item) => item.id == quizId.id);
    }
    setState(() {});
    questionsList.addAll(questionsEGList);
    questionsList.shuffle();
    // confidenceLeveCount = questionsList.length;
    setState(() {});
    return questionsEGList.toSet().toList();
  }

  Future getAverageElectronicDisplayQuetions() async {
    questionsAvEGList.clear();
    //questionsList.clear();
    setState(() {});
    var uid = await GetUserInfo().getCurrentUserID();
    await FirebaseFirestore.instance
        .collection('confidenceLevel')
        .doc('$uid')
        .collection('levelCollection')
        .where('filter_id', isEqualTo: 'ELECTRONIC_DISPLAYS')
        .where('level', isEqualTo: 'AVERAGE')
        .get(GetOptions(source: Source.serverAndCache))
        .then((value) {
      questionsAvEGList.clear();
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

        questionsAvEGList.add(questions);
        questionsAvEGList.shuffle();
      }
      //initVideoUrl(questionsList);
    });
    var neverAskAgainQuiz = await getNeverAskAgain();
    for (var quizId in neverAskAgainQuiz) {
      questionsAvEGList.removeWhere((item) => item.id == quizId.id);
    }
    setState(() {});
    questionsList.addAll(questionsAvEGList);
    questionsList.shuffle();
    // confidenceLeveCount = questionsList.length;
    setState(() {});
    return questionsAvEGList.toSet().toList();
  }

  Future getHighElectronicDisplayQuetions() async {
    questionsHighEGList.clear();
    //questionsList.clear();
    setState(() {});
    var uid = await GetUserInfo().getCurrentUserID();
    await FirebaseFirestore.instance
        .collection('confidenceLevel')
        .doc('$uid')
        .collection('levelCollection')
        .where('filter_id', isEqualTo: 'ELECTRONIC_DISPLAYS')
        .where('level', isEqualTo: 'HIGH')
        .get(GetOptions(source: Source.serverAndCache))
        .then((value) {
      questionsHighEGList.clear();
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

        questionsHighEGList.add(questions);
        questionsHighEGList.shuffle();
      }
      //initVideoUrl(questionsList);
    });
    var neverAskAgainQuiz = await getNeverAskAgain();
    for (var quizId in neverAskAgainQuiz) {
      questionsHighEGList.removeWhere((item) => item.id == quizId.id);
    }
    setState(() {});
    questionsList.addAll(questionsHighEGList);
    questionsList.shuffle();
    // confidenceLeveCount = questionsList.length;
    setState(() {});
    return questionsHighEGList.toSet().toList();
  }

  Future getVHighElectronicDisplayQuetions() async {
    questionsVHighEGList.clear();
    //questionsList.clear();
    setState(() {});
    var uid = await GetUserInfo().getCurrentUserID();
    await FirebaseFirestore.instance
        .collection('confidenceLevel')
        .doc('$uid')
        .collection('levelCollection')
        .where('filter_id', isEqualTo: 'ELECTRONIC_DISPLAYS')
        .where('level', isEqualTo: 'VERY HIGH')
        .get(GetOptions(source: Source.serverAndCache))
        .then((value) {
      questionsVHighEGList.clear();
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

        questionsVHighEGList.add(questions);
        questionsVHighEGList.shuffle();
      }
      //initVideoUrl(questionsList);
    });
    var neverAskAgainQuiz = await getNeverAskAgain();
    for (var quizId in neverAskAgainQuiz) {
      questionsVHighEGList.removeWhere((item) => item.id == quizId.id);
    }
    setState(() {});
    questionsList.addAll(questionsVHighEGList);
    questionsList.shuffle();
    // confidenceLeveCount = questionsList.length;
    setState(() {});
    return questionsVHighEGList.toSet().toList();
  }

  Future getLowVariousMediaQuetions() async {
    questionsLowVMList.clear();
    //questionsList.clear();
    setState(() {});
    var uid = await GetUserInfo().getCurrentUserID();
    await FirebaseFirestore.instance
        .collection('confidenceLevel')
        .doc('$uid')
        .collection('levelCollection')
        .where('filter_id', isEqualTo: 'VARIOUS_MEDIA')
        .where('level', isEqualTo: 'LOW')
        .get(GetOptions(source: Source.serverAndCache))
        .then((value) {
      questionsLowVMList.clear();
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

        questionsLowVMList.add(questions);
        questionsLowVMList.shuffle();
      }
      //initVideoUrl(questionsList);
    });
    var neverAskAgainQuiz = await getNeverAskAgain();
    for (var quizId in neverAskAgainQuiz) {
      questionsLowVMList.removeWhere((item) => item.id == quizId.id);
    }
    setState(() {});
    questionsList.addAll(questionsLowVMList);
    questionsList.shuffle();
    // confidenceLeveCount = questionsList.length;
    setState(() {});
    return questionsLowVMList.toSet().toList();
  }

  /*********************** FILTER CATEGORIES BASED ON CONFIDENCE LEVEL ****************************** */

  initConfidenceFilter() async {
    questionsList.clear();
    loadingCount = true;
    setState(() {});

    // when low confidence has been selected
    // if (_levelValue == 0) {
    //   questionsList.clear();

    //   if (fireProtectionValue) await getFPCLQuetions();
    //   if (airplaneGeneralValue) await getAGCLQuetions();
    //   if (electronicDisplayValue) await getEDCLQuetions();
    //   if (variousMediaValue) await getVMCLQuetions();
    //   confidenceLeveCount = questionsList.toSet().toList().length;
    //   loadingCount = false;
    //   setState(() {});
    //   setState(() {});
    //   return;
    // }

    if (_levelValue >= 0) {
      questionsList.clear();
      if (fireProtectionValue) await getFPCLQuetions();
      if (airplaneGeneralValue) await getAGCLQuetions();
      if (electronicDisplayValue) await getEDCLQuetions();
      if (_levelValue < 33) {
        confidenceLeveCount = questionsList.toSet().toList().length;
        loadingCount = false;
        setState(() {});
      }

      //await getLowFireProtectionQuetions();
      //questionsList.addAll(await getAllLowConfidenceLevels());
      print('LOW COUNT ::: ${questionsList.length}');
      //confidenceLeveCount = questionsList.toSet().toList().length;

      if (_levelValue >= 33) {
        if (fireProtectionValue) await getAverageFireProtectionQuetions();
        if (airplaneGeneralValue) await getAverageAirplaneGeneralQuetions();
        if (electronicDisplayValue) await getAverageElectronicDisplayQuetions();
        if (_levelValue < 67) {
          confidenceLeveCount = questionsList.toSet().toList().length;
          loadingCount = false;
          setState(() {});
        }

        if (_levelValue >= 67) {
          if (fireProtectionValue) await getHighFireProtectionQuetions();
          if (airplaneGeneralValue) await getHighAirplaneGeneralQuetions();
          if (electronicDisplayValue) await getHighElectronicDisplayQuetions();
          if (_levelValue != 100) {
            confidenceLeveCount = questionsList.toSet().toList().length;
            loadingCount = false;
            setState(() {});
          }

          if (_levelValue == 100) {
            if (fireProtectionValue) await getVHighFireProtectionQuetions();
            if (airplaneGeneralValue) await getVHighAirplaneGeneralQuetions();
            if (electronicDisplayValue)
              await getVHighElectronicDisplayQuetions();
            confidenceLeveCount = questionsList.toSet().toList().length;
            loadingCount = false;
            setState(() {});
          }
        }
      }
    }

    //confidenceLeveCount = questionsList.length;

    setState(() {});
  }

  // void _onLoading() {
  //   showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (BuildContext context) {
  //       return Dialog(
  //         child: Container(
  //           padding: EdgeInsets.symmetric(
  //             vertical: 30.0,
  //             horizontal: 20.0,
  //           ),
  //           child: new Row(
  //             mainAxisSize: MainAxisSize.min,
  //             children: [
  //               new CircularProgressIndicator(
  //                 valueColor: new AlwaysStoppedAnimation<Color>(
  //                   Color(0xFF007EC7),
  //                 ),
  //               ),
  //               SizedBox(
  //                 width: 15.0,
  //               ),
  //               new Text(
  //                 "Loading...",
  //                 style: TextStyle(
  //                   fontSize: 15.0,
  //                   color: Colors.grey,
  //                   fontFamily: Str.POPPINS,
  //                   fontWeight: FontWeight.w600,
  //                 ),
  //                 textAlign: TextAlign.center,
  //               ),
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );
    
  //   new Future.delayed(new Duration(seconds: 3), () {
  //     Navigator.pop(context); //pop dialog

  //     //Navigator.pop(context);
  //   });
  // }

  Future getAllNonCLevel() async {
    nonCLevelIds.clear();
    var uid = await GetUserInfo().getCurrentUserID();
    await FirebaseFirestore.instance
        .collection('confidenceLevel')
        .doc('$uid')
        .collection('levelCollection')
        .get(GetOptions(source: Source.serverAndCache))
        .then(
      (value) {
        for (var item in value.docs) {
          nonCLevelIds.add(item["id"]);
        }
      },
    );
    print('AG C-Level ::: prep');
    print('AG C-Level ::: $nonCLevelIds');
    setState(() {});
    return nonCLevelIds.toSet().toList();
  }

  Future getAGNonCLevel() async {
    nonAGCLevelIds.clear();
    var uid = await GetUserInfo().getCurrentUserID();
    await FirebaseFirestore.instance
        .collection('confidenceLevel')
        .doc('$uid')
        .collection('levelCollection')
        .where('subject', isEqualTo: 'AIRPLANE GENERAL')
        .get(GetOptions(source: Source.serverAndCache))
        .then(
      (value) {
        for (var item in value.docs) {
          nonAGCLevelIds.add(item["id"]);
        }
      },
    );

    setState(() {});
    return nonAGCLevelIds.toSet().toList();
  }

  Future getAGCLQuetions() async {
    questionsAGList.clear();

    var userId = await GetUserInfo().getCurrentUserID();
    await FirebaseFirestore.instance
        .collection('confidenceLevel')
        .doc('$userId')
        .collection('levelCollection')
        .where('level', isEqualTo: 'LOW')
        .where('filter_id', isEqualTo: 'AIRPLANE_GENERAL')
        //.where('AIRPLANE_GENERAL', isEqualTo: true)
        .get(GetOptions(source: Source.serverAndCache))
        .then((value) {
      questionsAGList.clear();
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

        questionsAGList.add(questions);
        questionsAGList.shuffle();
      }
      //initVideoUrl(questionsList);
    });

    var neverAskAgainList = await getNeverAskAgain();
    //var confidenceLevelList = await getCLQuestions();

    //remove never ask again questions
    for (var quizId in neverAskAgainList) {
      questionsAGList.removeWhere((item) => item.id == quizId.id);
    }

    //remove confidence level questions
    // for (var quizId in confidenceLevelList) {
    //   questionsAGList.removeWhere((item) => item.id == quizId.id);
    // }
    setState(() {});

    questionsList.addAll(questionsAGList);
    questionsList.shuffle();
    //confidenceLeveCount = questionsList.length;
    setState(() {});
    return questionsAGList.toSet().toList();
  }

  Future getEDNonCLevel() async {
    nonEDCLevelIds.clear();
    var uid = await GetUserInfo().getCurrentUserID();
    await FirebaseFirestore.instance
        .collection('confidenceLevel')
        .doc('$uid')
        .collection('levelCollection')
        .where('subject', isEqualTo: 'ELECTRONIC DISPLAYS')
        .get(GetOptions(source: Source.serverAndCache))
        .then(
      (value) {
        for (var item in value.docs) {
          nonEDCLevelIds.add(item["id"]);
        }
      },
    );
    setState(() {});
    return nonEDCLevelIds.toSet().toList();
  }

  Future getEDCLQuetions() async {
    questionsEDList.clear();

    var userId = await GetUserInfo().getCurrentUserID();
    await FirebaseFirestore.instance
        .collection('confidenceLevel')
        .doc('$userId')
        .collection('levelCollection')
        .where('level', isEqualTo: 'LOW')
        .where('filter_id', isEqualTo: 'ELECTRONIC_DISPLAYS')
        //.where('AIRPLANE_GENERAL', isEqualTo: true)
        .get(GetOptions(source: Source.serverAndCache))
        .then((value) {
      questionsEDList.clear();
      //questionsList.clear();
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

        questionsEDList.add(questions);
        questionsEDList.shuffle();
      }
      //initVideoUrl(questionsList);
    });
    var neverAskAgainList = await getNeverAskAgain();
    //var confidenceLevelList = await getCLQuestions();

    //remove never ask again questions
    for (var quizId in neverAskAgainList) {
      questionsEDList.removeWhere((item) => item.id == quizId.id);
    }

    // //remove confidence level questions
    // for (var quizId in confidenceLevelList) {
    //   questionsEDList.removeWhere((item) => item.id == quizId.id);
    // }
    setState(() {});
    questionsList.addAll(questionsEDList);
    questionsList.shuffle();
    //confidenceLeveCount = questionsList.length;
    setState(() {});
    return questionsEDList.toSet().toList();
  }

  Future getFPNonCLevel() async {
    nonFPCLevelIds.clear();
    var uid = await GetUserInfo().getCurrentUserID();
    await FirebaseFirestore.instance
        .collection('confidenceLevel')
        .doc('$uid')
        .collection('levelCollection')
        .where('subject', isEqualTo: 'FIRE PROTECTION')
        .get(GetOptions(source: Source.serverAndCache))
        .then(
      (value) {
        for (var item in value.docs) {
          nonFPCLevelIds.add(item["id"]);
        }
      },
    );
    setState(() {});
    print('FP NON C-LEVEL :: ${nonFPCLevelIds.length}');
    return nonFPCLevelIds.toSet().toList();
  }

  Future getFPCLQuetions() async {
    questionsFPList.clear();
    var userId = await GetUserInfo().getCurrentUserID();
    await FirebaseFirestore.instance
        .collection('confidenceLevel')
        .doc('$userId')
        .collection('levelCollection')
        .where('level', isEqualTo: 'LOW')
        .where('filter_id', isEqualTo: 'FIRE_PROTECTION')
        //.where('AIRPLANE_GENERAL', isEqualTo: true)
        .get(GetOptions(source: Source.serverAndCache))
        .then((value) {
      questionsFPList.clear();
      //questionsList.clear();
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

        questionsFPList.add(questions);
        questionsFPList.shuffle();
      }
      //initVideoUrl(questionsList);
    });

    var neverAskAgainList = await getNeverAskAgain();
    //var confidenceLevelList = await getCLQuestions();

    //remove never ask again questions
    for (var quizId in neverAskAgainList) {
      questionsFPList.removeWhere((item) => item.id == quizId.id);
    }

    // //remove confidence level questions
    // for (var quizId in confidenceLevelList) {
    //   questionsFPList.removeWhere((item) => item.id == quizId.id);
    // }
    print('NUMBER OF FP ITEMS:: ${questionsFPList.length}');
    setState(() {});
    questionsList.addAll(questionsFPList);
    questionsList.shuffle();
    // confidenceLeveCount = questionsList.length;
    setState(() {});
    return questionsFPList.toSet().toList();
  }

  Future getALLNonCLQuetions() async {
    var listz = await getAllNonCLevel();
    print('REAL LIST :: $listz');
    questionsALLCLList.clear();
    questionsList.clear();
    await FirebaseFirestore.instance
        .collection('quizjetsQuestions')
        .doc('000')
        .collection('questionsCollection')
        //.where('AIRPLANE_GENERAL', isEqualTo: true)
        .get(GetOptions(source: Source.serverAndCache))
        .then((value) {
      questionsALLCLList.clear();
      questionsList.clear();
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

        questionsALLCLList.add(questions);
        questionsALLCLList.shuffle();
      }
      //initVideoUrl(questionsList);
    });

    var neverAskAgainList = await getNeverAskAgain();
    print('NEVER ASK AGAIN FINAL ::: ${neverAskAgainList.length}');
    var confidenceLevelList = await getCLQuestions();
    print('CONFIDENCE LEVEL FINAL ::: ${confidenceLevelList.length}');

    //remove never ask again questions
    for (var quizId in neverAskAgainList) {
      questionsALLCLList.removeWhere((item) => item.id == quizId.id);
    }

    //remove confidence level questions
    for (var quizId in confidenceLevelList) {
      questionsALLCLList.removeWhere((item) => item.id == quizId.id);
    }

    print('NEVER INITSTATE ::: ${questionsALLCLList.length}');

    questionsList.addAll(questionsALLCLList);
    questionsList.shuffle();
    //confidenceLeveCount = questionsList.length;
    setState(() {});
    return questionsALLCLList.toSet().toList();
  }

  Future getNeverAskAgain() async {
    neverAskAgainIds.clear();
    var uid = await GetUserInfo().getCurrentUserID();
    await FirebaseFirestore.instance
        .collection('neverAskAgain')
        .doc(uid)
        .collection('levelCollection')
        .get(GetOptions(source: Source.serverAndCache))
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

  Future getCLQuestions() async {
    cLevelList.clear();
    var uid = await GetUserInfo().getCurrentUserID();
    await FirebaseFirestore.instance
        .collection('confidenceLevel')
        .doc(uid)
        .collection('levelCollection')
        .get(GetOptions(source: Source.serverAndCache))
        .then(
      (value) {
        cLevelList.clear();
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

          cLevelList.add(questions);
          cLevelList.shuffle();
        }
      },
    );
    setState(() {});
    return cLevelList.toSet().toList();
  }
}
