import 'package:flutter/material.dart';
import 'package:quizjets/export_files.dart';
import 'package:responsive_builder/responsive_builder.dart';

class WebFilterPage extends StatefulWidget {
  static const String route = '/filter';
  @override
  _WebFilterPageState createState() => _WebFilterPageState();
}

class _WebFilterPageState extends State<WebFilterPage> {
  var errorController = TextEditingController();
  bool selectAllValue = false;
  bool airplaneGeneralValue = false;
  bool electronicDisplayValue = false;
  bool fireProtectionValue = false;
  bool flightControlsValue = false;
  bool fuelValue = false;
  bool hydraulicsValue = false;
  bool iamValue = false;
  bool iceAndRainValue = false;
  bool landingGearBrakesValue = false;
  bool navAndCamsValue = false;
  bool operatingNumbersValue = false;
  bool eeLightingValue = false;
  bool powerPlantValue = false;
  bool afcsValue = false;
  bool apuValue = false;
  bool electricalValue = false;

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
  List<Question> questionsAvAGGList = [];
  List<Question> questionsAvEGList = [];
  List<Question> questionsAvAFCSList = [];
  List<Question> questionsAvPPList = [];
  List<Question> questionsAvElectricalList = [];
  List<Question> questionsAvLGList = [];
  List<Question> questionsAvEELList = [];
  List<Question> questionsAvOPList = [];
  List<Question> questionsAvIceAndRainList = [];
  List<Question> questionsAvAPUSList = [];
  List<Question> questionsAvFCList = [];
  List<Question> questionsAvFuelList = [];
  List<Question> questionsAvHydraulicsList = [];
  List<Question> questionsAvIAMList = [];
  List<Question> questionsAvNavAndCommmsList = [];

  List<Question> questionsHighFPList = [];
  List<Question> questionsHighAGList = [];
  List<Question> questionsHighEGList = [];
  List<Question> questionsHighAFCSList = [];
  List<Question> questionsHighPPList = [];
  List<Question> questionsHighElectricalList = [];
  List<Question> questionsHighLGList = [];
  List<Question> questionsHighEELList = [];
  List<Question> questionsHighAPUList = [];
  List<Question> questionsHighFCList = [];
  List<Question> questionsHighFuelList = [];
  List<Question> questionsHighHydraulicsList = [];
  List<Question> questionsHighIAMList = [];
  List<Question> questionsHighIceAndRainList = [];
  List<Question> questionsHighNavAndCommsList = [];
  List<Question> questionsHighOPList = [];

  List<Question> questionsVHighFPList = [];
  List<Question> questionsVHighAGList = [];
  List<Question> questionsVHighEGList = [];
  List<Question> questionsVHighAFCSList = [];
  List<Question> questionsVHighPPList = [];
  List<Question> questionsVHighElectricalList = [];
  List<Question> questionsVHighLGList = [];
  List<Question> questionsVHighEELList = [];
  List<Question> questionsVHighONList = [];
  List<Question> questionsVHighNVList = [];
  List<Question> questionsVHighAPUList = [];
  List<Question> questionsVHighFCList = [];
  List<Question> questionsVHighFuelList = [];
  List<Question> questionsVHighHydraulicList = [];
  List<Question> questionsVHighIAMList = [];
  List<Question> questionsVHighIceAndRainList = [];

  List<Question> questionsALLCLList = [];
  List<Question> cLevelList = [];
  List<Question> questionsAFCSList = [];
  List<Question> questionsPPList = [];
  List<Question> questionsElectricalCSList = [];
  List<Question> questionsLGList = [];
  List<Question> questionsEELightingList = [];
  List<Question> questionsOperatingNumbersList = [];
  List<Question> questionsAPUList = [];
  List<Question> questionsFCCSList = [];
  List<Question> questionsFuelList = [];
  List<Question> questionsHydraulicsList = [];
  List<Question> questionsIAMList = [];
  List<Question> questionsIceAndRainList = [];
  List<Question> questionsNVList = [];

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
        body: Center(
          child: Container(
            width: 500,
            margin: EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                SizedBox(height: 40.0),
                Text(
                  "Confidence Levels: ( $confidenceLevelValue )",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontFamily: Str.POPPINS,
                      color: Colors.black.withOpacity(.9),
                      fontSize: 21.0),
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
                          color: Colors.black.withOpacity(.9),
                          fontSize: 17.0),
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
                      "Maximum",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: Str.POPPINS,
                          color: Colors.black.withOpacity(.9),
                          fontSize: 17.0),
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
                      color: Colors.black.withOpacity(.9),
                      fontSize: 21.0),
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
                        fontSize: 18.0),
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
                          if (loadingCount) return;

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
                    "AFCS",
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
                      value: afcsValue,
                      activeColor: Color(0xFF007EC7),
                      onChanged: (bool newValue) {
                        setState(() {
                          if (loadingCount) return;

                          afcsValue = newValue;
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
                    "APU",
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
                      value: apuValue,
                      activeColor: Color(0xFF007EC7),
                      onChanged: (bool newValue) {
                        setState(() {
                          if (loadingCount) return;

                          apuValue = newValue;
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
                          if (loadingCount) return;

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
                    "Electrical",
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
                      value: electricalValue,
                      activeColor: Color(0xFF007EC7),
                      onChanged: (bool newValue) {
                        setState(() {
                          if (loadingCount) return;

                          electricalValue = newValue;
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
                          if (loadingCount) return;

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
                    "Flight Controls",
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
                      value: flightControlsValue,
                      activeColor: Color(0xFF007EC7),
                      onChanged: (bool newValue) {
                        setState(() {
                          if (loadingCount) return;

                          flightControlsValue = newValue;
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
                    "Fuel",
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
                      value: fuelValue,
                      activeColor: Color(0xFF007EC7),
                      onChanged: (bool newValue) {
                        setState(() {
                          if (loadingCount) return;

                          fuelValue = newValue;
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
                          if (loadingCount) return;

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
                ListTile(
                  leading: Text(
                    "Hydraulics",
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
                      value: hydraulicsValue,
                      activeColor: Color(0xFF007EC7),
                      onChanged: (bool newValue) {
                        setState(() {
                          if (loadingCount) return;

                          hydraulicsValue = newValue;
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
                    "IAM",
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
                      value: iamValue,
                      activeColor: Color(0xFF007EC7),
                      onChanged: (bool newValue) {
                        setState(() {
                          if (loadingCount) return;

                          iamValue = newValue;
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
                    "Ice & Rain",
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
                      value: iceAndRainValue,
                      activeColor: Color(0xFF007EC7),
                      onChanged: (bool newValue) {
                        setState(() {
                          if (loadingCount) return;

                          iceAndRainValue = newValue;
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
                    "Landing Gear and Brakes",
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
                      value: landingGearBrakesValue,
                      activeColor: Color(0xFF007EC7),
                      onChanged: (bool newValue) {
                        setState(() {
                          if (loadingCount) return;

                          landingGearBrakesValue = newValue;
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
                    "Nav & Comms",
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
                      value: navAndCamsValue,
                      activeColor: Color(0xFF007EC7),
                      onChanged: (bool newValue) {
                        setState(() {
                          if (loadingCount) return;

                          navAndCamsValue = newValue;
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
                    "Operating Numbers",
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
                      value: operatingNumbersValue,
                      activeColor: Color(0xFF007EC7),
                      onChanged: (bool newValue) {
                        setState(() {
                          if (loadingCount) return;

                          operatingNumbersValue = newValue;
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
                    "o2, EE, Lighting",
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
                      value: eeLightingValue,
                      activeColor: Color(0xFF007EC7),
                      onChanged: (bool newValue) {
                        setState(() {
                          if (loadingCount) return;

                          eeLightingValue = newValue;
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
                    "Power Plant",
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
                      value: powerPlantValue,
                      activeColor: Color(0xFF007EC7),
                      onChanged: (bool newValue) {
                        setState(() {
                          if (loadingCount) return;

                          powerPlantValue = newValue;
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
                SizedBox(
                  height: 50.0,
                ),
                //FooterView(),
              ]),
            ),
          ),
        ),
        bottomNavigationBar: ResponsiveBuilder(
          builder: (context, sizingInformation) => Visibility(
              child: Container(
            height: 75,
            margin: EdgeInsets.symmetric(
              horizontal: sizingInformation.deviceScreenType ==
                          DeviceScreenType.mobile ||
                      sizingInformation.deviceScreenType ==
                          DeviceScreenType.tablet
                  ? 30
                  : MediaQuery.of(context).size.width * .33,
            ),
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
                        fontWeight: FontWeight.w700,
                        fontFamily: Str.POPPINS,
                        color: Colors.black.withOpacity(.9),
                        fontSize: 21.0),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    if (loadingCount) return;
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
                        builder: (context) => WebFilterQuestionPage(
                          quizzList: questionsList,
                        ),
                      ),
                    );
                    if (null == isBack) return;
                    if (isBack) {
                      initConfidenceFilter();
                      return;
                    }
                  },
                  child: Container(
                    width: 180,
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 15.0,
                    ),
                    margin: EdgeInsets.symmetric(
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFF007EC7),
                      borderRadius: BorderRadius.circular(6.0),
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
                                  fontSize: 18.5),
                            ),
                    ),
                  ),
                ),
              ],
            ),
          )),
        ));
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
    if (apuValue &&
        afcsValue &&
        electricalValue &&
        fuelValue &&
        hydraulicsValue &&
        flightControlsValue &&
        iamValue &&
        iceAndRainValue &&
        landingGearBrakesValue &&
        powerPlantValue &&
        eeLightingValue &&
        operatingNumbersValue &&
        navAndCamsValue &&
        apuValue &&
        airplaneGeneralValue &&
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
    apuValue = false;
    iamValue = false;
    afcsValue = false;
    electricalValue = false;
    flightControlsValue = false;
    fuelValue = false;
    hydraulicsValue = false;
    iceAndRainValue = false;
    landingGearBrakesValue = false;
    navAndCamsValue = false;
    operatingNumbersValue = false;
    eeLightingValue = false;
    powerPlantValue = false;
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
      landingGearBrakesValue = true;
      iceAndRainValue = true;
      flightControlsValue = true;
      afcsValue = true;
      electricalValue = true;
      fuelValue = true;
      hydraulicsValue = true;
      iamValue = true;
      navAndCamsValue = true;
      operatingNumbersValue = true;
      eeLightingValue = true;
      apuValue = true;
      powerPlantValue = true;
      electronicDisplayValue = true;
      fireProtectionValue = true;
      //countAll();
      setState(() {});
      return;
    }
    airplaneGeneralValue = false;
    iceAndRainValue = false;
    fuelValue = false;
    afcsValue = false;
    electricalValue = false;
    flightControlsValue = false;
    hydraulicsValue = false;
    iamValue = false;
    landingGearBrakesValue = false;
    navAndCamsValue = false;
    operatingNumbersValue = false;
    eeLightingValue = false;
    powerPlantValue = false;
    apuValue = false;
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
        .get(GetOptions(source: Source.server))
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
        .get(GetOptions(source: Source.server));
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
        .get(GetOptions(source: Source.server));
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
        .get(GetOptions(source: Source.server))
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
                fontSize: 24,
                color: Colors.black.withOpacity(.9),
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
        leading: TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            "  <<",
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
      );

  bool isFilterInitd() {
    if (apuValue) {
      return apuValue;
    }
    if (afcsValue) {
      return afcsValue;
    }
    if (electricalValue) {
      return electricalValue;
    }
    if (flightControlsValue) {
      return flightControlsValue;
    }
    if (fuelValue) {
      return fuelValue;
    }
    if (hydraulicsValue) {
      return hydraulicsValue;
    }
    if (iamValue) {
      return iamValue;
    }
    if (iceAndRainValue) {
      return iceAndRainValue;
    }
    if (landingGearBrakesValue) {
      return landingGearBrakesValue;
    }
    if (navAndCamsValue) {
      return navAndCamsValue;
    }
    if (operatingNumbersValue) {
      return operatingNumbersValue;
    }
    if (eeLightingValue) {
      return eeLightingValue;
    }
    if (powerPlantValue) {
      return powerPlantValue;
    }
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
        'afcsValue': afcsValue,
        'electricalValue': electricalValue,
        'flightControlsValue': flightControlsValue,
        'fuelValue': fuelValue,
        'hydraulicsValue': hydraulicsValue,
        'iamValue': iamValue,
        'iceAndRainValue': iceAndRainValue,
        'landingGearBrakesValue': landingGearBrakesValue,
        'navAndCamsValue': navAndCamsValue,
        'operatingNumbersValue': operatingNumbersValue,
        'powerPlantValue': powerPlantValue,
        'eeLightingValue': eeLightingValue,
        'apuValue': apuValue,
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
        .get(GetOptions(source: Source.server))
        .then(
      (value) {
        afcsValue = value.data()['afcsValue'];
        electricalValue = value.data()['electricalValue'];
        flightControlsValue = value.data()['flightControlsValue'];
        fuelValue = value.data()['fuelValue'];
        hydraulicsValue = value.data()['hydraulicsValue'];
        iamValue = value.data()['iamValue'];
        iceAndRainValue = value.data()['iceAndRainValue'];
        landingGearBrakesValue = value.data()['landingGearBrakesValue'];
        navAndCamsValue = value.data()['navAndCamsValue'];
        operatingNumbersValue = value.data()['operatingNumbersValue'];
        eeLightingValue = value.data()['eeLightingValue'];
        powerPlantValue = value.data()['powerPlantValue'];
        apuValue = value.data()['apuValue'];
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
        .get(GetOptions(source: Source.server))
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
        .get(GetOptions(source: Source.server))
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
        .get(GetOptions(source: Source.server))
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
        .get(GetOptions(source: Source.server))
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
        .get(GetOptions(source: Source.server))
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
        .get(GetOptions(source: Source.server))
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
        .get(GetOptions(source: Source.server))
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
    questionsAvAGGList.clear();
    //questionsList.clear();
    setState(() {});
    var uid = await GetUserInfo().getCurrentUserID();
    await FirebaseFirestore.instance
        .collection('confidenceLevel')
        .doc('$uid')
        .collection('levelCollection')
        .where('filter_id', isEqualTo: 'AIRPLANE_GENERAL')
        .where('level', isEqualTo: 'AVERAGE')
        .get(
          GetOptions(
            source: Source.server,
          ),
        )
        .then((value) {
      questionsAvAGGList.clear();
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

        questionsAvAGGList.add(questions);
        questionsAvAGGList.shuffle();
      }
      //initVideoUrl(questionsList);
    });
    var neverAskAgainQuiz = await getNeverAskAgain();
    for (var quizId in neverAskAgainQuiz) {
      questionsAvAGGList.removeWhere(
        (item) => item.id == quizId.id,
      );
    }
    setState(() {});
    questionsList.addAll(questionsAvAGGList);
    questionsList.shuffle();
    setState(() {});
    return questionsAvAGGList.toSet().toList();
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
        .get(GetOptions(source: Source.server))
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
        .get(GetOptions(source: Source.server))
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
        .get(GetOptions(source: Source.server))
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
        .get(GetOptions(source: Source.server))
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
        .get(GetOptions(source: Source.server))
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
        .get(GetOptions(source: Source.server))
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
        .get(GetOptions(source: Source.server))
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

    if (_levelValue >= 0) {
      questionsList.clear();
      if (afcsValue) await getAFCSCLQuetions();
      if (apuValue) await getAPUCLQuestions();
      if (electricalValue) await getElectricalCLQuestions();
      if (landingGearBrakesValue) await getLandingGearQuestions();
      if (flightControlsValue) await getFlightControlCLQuestions();
      if (fuelValue) await getFuelCLQuestions();
      if (hydraulicsValue) await getHydraulicsCLQuestions();
      if (iamValue) await getIAMCLQuestions();
      if (iceAndRainValue) await getIceAndRainCLQuestions();
      if (navAndCamsValue) await getNavAndCommsCLQuestions();
      if (operatingNumbersValue) await getOperatingNumbersCLQuestions();
      if (eeLightingValue) await getEELightingCLQuestions();
      if (fireProtectionValue) await getFPCLQuetions();
      if (airplaneGeneralValue) await getAGCLQuetions();
      if (powerPlantValue) await getPowerPlantQuestions();
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
        if (afcsValue) await getAverageAFCSQuetions();
        if (apuValue) await getAverageAPUQuestions();
        if (electricalValue) await getAverageElectricalQuestions();
        if (landingGearBrakesValue) await getAverageLandingGearQuestions();
        if (flightControlsValue) await getAverageFlightControlsQuestions();
        if (fuelValue) await getAverageFuelQuestions();
        if (hydraulicsValue) await getAverageHydraulicsQuestions();
        if (iamValue) await getAverageIAMQuestions();
        if (iceAndRainValue) await getAverageIceAndRainQuestions();
        if (navAndCamsValue) await getAverageNavAndCommsQuestions();
        if (operatingNumbersValue) await getAverageOperatingNumbersQuestions();
        if (eeLightingValue) await getAverageEELightingQuestions();
        if (fireProtectionValue) await getAverageFireProtectionQuetions();
        if (airplaneGeneralValue) await getAverageAirplaneGeneralQuetions();
        if (powerPlantValue) await getAveragePowerPlantQuestions();
        if (electronicDisplayValue) await getAverageElectronicDisplayQuetions();
        if (_levelValue < 67) {
          confidenceLeveCount = questionsList.toSet().toList().length;
          loadingCount = false;
          setState(() {});
        }

        if (_levelValue >= 67) {
          if (afcsValue) await getHighAFCSQuetions();
          if (apuValue) await getHighAPUQuestions();
          if (electricalValue) await getHighElectricalQuestions();
          if (flightControlsValue) await getHighFlightControlsQuestions();
          if (landingGearBrakesValue) await getHighLandingGearQuestions();
          if (fuelValue) await getHighFuelQuestions();
          if (hydraulicsValue) await getHighHydraulicsQuestions();
          if (iamValue) await getHighIAMQuestions();
          if (iceAndRainValue) await getHighIceAndRainQuetions();
          if (navAndCamsValue) await getHighNavAndCommsQuestions();
          if (operatingNumbersValue) await getHighOperatingNumbersQuestions();
          if (eeLightingValue) await getHighEELightingQuestions();
          if (fireProtectionValue) await getHighFireProtectionQuetions();
          if (airplaneGeneralValue) await getHighAirplaneGeneralQuetions();
          if (powerPlantValue) await getHighPowerPlantQuestions();
          if (electronicDisplayValue) await getHighElectronicDisplayQuetions();
          if (_levelValue != 100) {
            confidenceLeveCount = questionsList.toSet().toList().length;
            loadingCount = false;
            setState(() {});
          }

          if (_levelValue == 100) {
            if (afcsValue) await getVHighAFCSQuetions();
            if (apuValue) await getVHighAPUQuestions();
            if (electricalValue) await getVHighElectricalQuestions();
            if (flightControlsValue) await getVHighFlightControlsQuestions();
            if (landingGearBrakesValue) await getVHighLandingGearQuestions();
            if (fuelValue) await getVHighFuelQuestions();
            if (hydraulicsValue) await getVHighHydraulicQuestions();
            if (iamValue) await getVHighIAMQuestions();
            if (iceAndRainValue) await getVHighIceAndRainQuetions();
            if (navAndCamsValue) await getVHighNavAndCommsQuestions();
            if (operatingNumbersValue)
              await getVHighOperatingNumbersQuestions();
            if (powerPlantValue) await getVHighPowerPlantQuestions();
            if (eeLightingValue) await getVHighEELQuestions();
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

  Future getHighAFCSQuetions() async {
    questionsHighAFCSList.clear();
    //questionsList.clear();
    setState(() {});
    var uid = await GetUserInfo().getCurrentUserID();
    await FirebaseFirestore.instance
        .collection('confidenceLevel')
        .doc('$uid')
        .collection('levelCollection')
        .where('filter_id', isEqualTo: 'AFCS')
        .where('level', isEqualTo: 'HIGH')
        .get(GetOptions(source: Source.server))
        .then((value) {
      questionsHighAFCSList.clear();
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

        questionsHighAFCSList.add(questions);
        questionsHighAFCSList.shuffle();
      }
      //initVideoUrl(questionsList);
    });
    var neverAskAgainQuiz = await getNeverAskAgain();
    for (var quizId in neverAskAgainQuiz) {
      questionsHighAFCSList.removeWhere((item) => item.id == quizId.id);
    }
    setState(() {});
    questionsList.addAll(questionsHighAFCSList);
    questionsList.shuffle();
    // confidenceLeveCount = questionsList.length;
    setState(() {});
    return questionsHighAFCSList.toSet().toList();
  }

  Future getAFCSCLQuetions() async {
    questionsAFCSList.clear();
    var userId = await GetUserInfo().getCurrentUserID();
    await FirebaseFirestore.instance
        .collection('confidenceLevel')
        .doc('$userId')
        .collection('levelCollection')
        .where('level', isEqualTo: 'LOW')
        .where('filter_id', isEqualTo: 'AFCS')
        //.where('AIRPLANE_GENERAL', isEqualTo: true)
        .get(GetOptions(source: Source.server))
        .then((value) {
      questionsAFCSList.clear();
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

        questionsAFCSList.add(questions);
        questionsAFCSList.shuffle();
      }
      //initVideoUrl(questionsList);
    });

    var neverAskAgainList = await getNeverAskAgain();
    //var confidenceLevelList = await getCLQuestions();

    //remove never ask again questions
    for (var quizId in neverAskAgainList) {
      questionsAFCSList.removeWhere((item) => item.id == quizId.id);
    }

    // //remove confidence level questions
    // for (var quizId in confidenceLevelList) {
    //   questionsFPList.removeWhere((item) => item.id == quizId.id);
    // }
    print('NUMBER OF AFCS ITEMS:: ${questionsAFCSList.length}');
    setState(() {});
    questionsList.addAll(questionsAFCSList);
    questionsList.shuffle();
    // confidenceLeveCount = questionsList.length;
    setState(() {});
    return questionsAFCSList.toSet().toList();
  }

  Future getPowerPlantQuestions() async {
    questionsPPList.clear();
    var userId = await GetUserInfo().getCurrentUserID();
    await FirebaseFirestore.instance
        .collection('confidenceLevel')
        .doc('$userId')
        .collection('levelCollection')
        .where('level', isEqualTo: 'LOW')
        .where('filter_id', isEqualTo: 'POWER_PLANT')
        //.where('AIRPLANE_GENERAL', isEqualTo: true)
        .get(GetOptions(source: Source.server))
        .then((value) {
      questionsPPList.clear();
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

        questionsPPList.add(questions);
        questionsPPList.shuffle();
      }
      //initVideoUrl(questionsList);
    });

    var neverAskAgainList = await getNeverAskAgain();
    //var confidenceLevelList = await getCLQuestions();

    //remove never ask again questions
    for (var quizId in neverAskAgainList) {
      questionsPPList.removeWhere((item) => item.id == quizId.id);
    }

    // //remove confidence level questions
    // for (var quizId in confidenceLevelList) {
    //   questionsFPList.removeWhere((item) => item.id == quizId.id);
    // }
    print('NUMBER OF AFCS ITEMS:: ${questionsPPList.length}');
    setState(() {});
    questionsList.addAll(questionsPPList);
    questionsList.shuffle();
    // confidenceLeveCount = questionsList.length;
    setState(() {});
    return questionsPPList.toSet().toList();
  }

  Future getElectricalCLQuestions() async {
    questionsElectricalCSList.clear();
    var userId = await GetUserInfo().getCurrentUserID();
    await FirebaseFirestore.instance
        .collection('confidenceLevel')
        .doc('$userId')
        .collection('levelCollection')
        .where('level', isEqualTo: 'LOW')
        .where('filter_id', isEqualTo: 'ELECTRICAL')
        //.where('AIRPLANE_GENERAL', isEqualTo: true)
        .get(GetOptions(source: Source.server))
        .then((value) {
      questionsElectricalCSList.clear();
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

        questionsElectricalCSList.add(questions);
        questionsElectricalCSList.shuffle();
      }
      //initVideoUrl(questionsList);
    });

    var neverAskAgainList = await getNeverAskAgain();
    //var confidenceLevelList = await getCLQuestions();

    //remove never ask again questions
    for (var quizId in neverAskAgainList) {
      questionsElectricalCSList.removeWhere((item) => item.id == quizId.id);
    }

    // //remove confidence level questions
    // for (var quizId in confidenceLevelList) {
    //   questionsFPList.removeWhere((item) => item.id == quizId.id);
    // }
    print('NUMBER OF ELECTRICAL ITEMS:: ${questionsElectricalCSList.length}');
    setState(() {});
    questionsList.addAll(questionsElectricalCSList);
    questionsList.shuffle();
    // confidenceLeveCount = questionsList.length;
    setState(() {});
    return questionsElectricalCSList.toSet().toList();
  }

  Future getLandingGearQuestions() async {
    questionsLGList.clear();
    var userId = await GetUserInfo().getCurrentUserID();
    await FirebaseFirestore.instance
        .collection('confidenceLevel')
        .doc('$userId')
        .collection('levelCollection')
        .where('level', isEqualTo: 'LOW')
        .where('filter_id', isEqualTo: 'LANDING_GEAR_AND_BRAKES')
        //.where('AIRPLANE_GENERAL', isEqualTo: true)
        .get(GetOptions(source: Source.server))
        .then((value) {
      questionsLGList.clear();
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

        questionsLGList.add(questions);
        questionsLGList.shuffle();
      }
      //initVideoUrl(questionsList);
    });

    var neverAskAgainList = await getNeverAskAgain();
    //var confidenceLevelList = await getCLQuestions();

    //remove never ask again questions
    for (var quizId in neverAskAgainList) {
      questionsLGList.removeWhere((item) => item.id == quizId.id);
    }

    // //remove confidence level questions
    // for (var quizId in confidenceLevelList) {
    //   questionsFPList.removeWhere((item) => item.id == quizId.id);
    // }
    print('NUMBER OF AFCS ITEMS:: ${questionsLGList.length}');
    setState(() {});
    questionsList.addAll(questionsLGList);
    questionsList.shuffle();
    // confidenceLeveCount = questionsList.length;
    setState(() {});
    return questionsLGList.toSet().toList();
  }

  Future getEELightingCLQuestions() async {
    questionsEELightingList.clear();
    var userId = await GetUserInfo().getCurrentUserID();
    await FirebaseFirestore.instance
        .collection('confidenceLevel')
        .doc('$userId')
        .collection('levelCollection')
        .where('level', isEqualTo: 'LOW')
        .where('filter_id', isEqualTo: 'O2,_EE,_LIGHTING')
        //.where('AIRPLANE_GENERAL', isEqualTo: true)
        .get(GetOptions(source: Source.server))
        .then((value) {
      questionsEELightingList.clear();
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

        questionsEELightingList.add(questions);
        questionsEELightingList.shuffle();
      }
      //initVideoUrl(questionsList);
    });

    var neverAskAgainList = await getNeverAskAgain();
    //var confidenceLevelList = await getCLQuestions();

    //remove never ask again questions
    for (var quizId in neverAskAgainList) {
      questionsEELightingList.removeWhere((item) => item.id == quizId.id);
    }

    // //remove confidence level questions
    // for (var quizId in confidenceLevelList) {
    //   questionsFPList.removeWhere((item) => item.id == quizId.id);
    // }
    print('NUMBER OF AFCS ITEMS:: ${questionsEELightingList.length}');
    setState(() {});
    questionsList.addAll(questionsEELightingList);
    questionsList.shuffle();
    // confidenceLeveCount = questionsList.length;
    setState(() {});
    return questionsEELightingList.toSet().toList();
  }

  Future getOperatingNumbersCLQuestions() async {
    questionsOperatingNumbersList.clear();
    var userId = await GetUserInfo().getCurrentUserID();
    await FirebaseFirestore.instance
        .collection('confidenceLevel')
        .doc('$userId')
        .collection('levelCollection')
        .where('level', isEqualTo: 'LOW')
        .where('filter_id', isEqualTo: 'OPERATING_NUMBERS')
        //.where('AIRPLANE_GENERAL', isEqualTo: true)
        .get(GetOptions(source: Source.server))
        .then((value) {
      questionsOperatingNumbersList.clear();
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

        questionsOperatingNumbersList.add(questions);
        questionsOperatingNumbersList.shuffle();
      }
      //initVideoUrl(questionsList);
    });

    var neverAskAgainList = await getNeverAskAgain();
    //var confidenceLevelList = await getCLQuestions();

    //remove never ask again questions
    for (var quizId in neverAskAgainList) {
      questionsOperatingNumbersList.removeWhere((item) => item.id == quizId.id);
    }

    // //remove confidence level questions
    // for (var quizId in confidenceLevelList) {
    //   questionsFPList.removeWhere((item) => item.id == quizId.id);
    // }
    print('NUMBER OF AFCS ITEMS:: ${questionsOperatingNumbersList.length}');
    setState(() {});
    questionsList.addAll(questionsOperatingNumbersList);
    questionsList.shuffle();
    // confidenceLeveCount = questionsList.length;
    setState(() {});
    return questionsOperatingNumbersList.toSet().toList();
  }

  Future getNavAndCommsCLQuestions() async {
    questionsNVList.clear();
    var userId = await GetUserInfo().getCurrentUserID();
    await FirebaseFirestore.instance
        .collection('confidenceLevel')
        .doc('$userId')
        .collection('levelCollection')
        .where('level', isEqualTo: 'LOW')
        .where('filter_id', isEqualTo: 'NAV_&_COMMS')
        //.where('AIRPLANE_GENERAL', isEqualTo: true)
        .get(GetOptions(source: Source.server))
        .then((value) {
      questionsNVList.clear();
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

        questionsNVList.add(questions);
        questionsNVList.shuffle();
      }
      //initVideoUrl(questionsList);
    });

    var neverAskAgainList = await getNeverAskAgain();
    //var confidenceLevelList = await getCLQuestions();

    //remove never ask again questions
    for (var quizId in neverAskAgainList) {
      questionsNVList.removeWhere((item) => item.id == quizId.id);
    }

    // //remove confidence level questions
    // for (var quizId in confidenceLevelList) {
    //   questionsFPList.removeWhere((item) => item.id == quizId.id);
    // }
    print('NUMBER OF AFCS ITEMS:: ${questionsNVList.length}');
    setState(() {});
    questionsList.addAll(questionsNVList);
    questionsList.shuffle();
    // confidenceLeveCount = questionsList.length;
    setState(() {});
    return questionsNVList.toSet().toList();
  }

  Future getIceAndRainCLQuestions() async {
    questionsIceAndRainList.clear();
    var userId = await GetUserInfo().getCurrentUserID();
    await FirebaseFirestore.instance
        .collection('confidenceLevel')
        .doc('$userId')
        .collection('levelCollection')
        .where('level', isEqualTo: 'LOW')
        .where('filter_id', isEqualTo: 'ICE_&_RAIN')
        //.where('AIRPLANE_GENERAL', isEqualTo: true)
        .get(GetOptions(source: Source.server))
        .then((value) {
      questionsIceAndRainList.clear();
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

        questionsIceAndRainList.add(questions);
        questionsIceAndRainList.shuffle();
      }
      //initVideoUrl(questionsList);
    });

    var neverAskAgainList = await getNeverAskAgain();
    //var confidenceLevelList = await getCLQuestions();

    //remove never ask again questions
    for (var quizId in neverAskAgainList) {
      questionsIceAndRainList.removeWhere((item) => item.id == quizId.id);
    }

    // //remove confidence level questions
    // for (var quizId in confidenceLevelList) {
    //   questionsFPList.removeWhere((item) => item.id == quizId.id);
    // }
    print('NUMBER OF AFCS ITEMS:: ${questionsIceAndRainList.length}');
    setState(() {});
    questionsList.addAll(questionsIceAndRainList);
    questionsList.shuffle();
    // confidenceLeveCount = questionsList.length;
    setState(() {});
    return questionsIceAndRainList.toSet().toList();
  }

  Future getIAMCLQuestions() async {
    questionsIAMList.clear();
    var userId = await GetUserInfo().getCurrentUserID();
    await FirebaseFirestore.instance
        .collection('confidenceLevel')
        .doc('$userId')
        .collection('levelCollection')
        .where('level', isEqualTo: 'LOW')
        .where('filter_id', isEqualTo: 'IAM')
        //.where('AIRPLANE_GENERAL', isEqualTo: true)
        .get(GetOptions(source: Source.server))
        .then((value) {
      questionsIAMList.clear();
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

        questionsIAMList.add(questions);
        questionsIAMList.shuffle();
      }
      //initVideoUrl(questionsList);
    });

    var neverAskAgainList = await getNeverAskAgain();
    //var confidenceLevelList = await getCLQuestions();

    //remove never ask again questions
    for (var quizId in neverAskAgainList) {
      questionsIAMList.removeWhere((item) => item.id == quizId.id);
    }

    // //remove confidence level questions
    // for (var quizId in confidenceLevelList) {
    //   questionsFPList.removeWhere((item) => item.id == quizId.id);
    // }
    print('NUMBER OF AFCS ITEMS:: ${questionsIAMList.length}');
    setState(() {});
    questionsList.addAll(questionsIAMList);
    questionsList.shuffle();
    // confidenceLeveCount = questionsList.length;
    setState(() {});
    return questionsIAMList.toSet().toList();
  }

  Future getHydraulicsCLQuestions() async {
    questionsHydraulicsList.clear();
    var userId = await GetUserInfo().getCurrentUserID();
    await FirebaseFirestore.instance
        .collection('confidenceLevel')
        .doc('$userId')
        .collection('levelCollection')
        .where('level', isEqualTo: 'LOW')
        .where('filter_id', isEqualTo: 'HYDRAULICS')
        //.where('AIRPLANE_GENERAL', isEqualTo: true)
        .get(GetOptions(source: Source.server))
        .then((value) {
      questionsHydraulicsList.clear();
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

        questionsHydraulicsList.add(questions);
        questionsHydraulicsList.shuffle();
      }
      //initVideoUrl(questionsList);
    });

    var neverAskAgainList = await getNeverAskAgain();
    //var confidenceLevelList = await getCLQuestions();

    //remove never ask again questions
    for (var quizId in neverAskAgainList) {
      questionsHydraulicsList.removeWhere((item) => item.id == quizId.id);
    }

    // //remove confidence level questions
    // for (var quizId in confidenceLevelList) {
    //   questionsFPList.removeWhere((item) => item.id == quizId.id);
    // }
    print('NUMBER OF AFCS ITEMS:: ${questionsHydraulicsList.length}');
    setState(() {});
    questionsList.addAll(questionsHydraulicsList);
    questionsList.shuffle();
    // confidenceLeveCount = questionsList.length;
    setState(() {});
    return questionsHydraulicsList.toSet().toList();
  }

  Future getFuelCLQuestions() async {
    questionsFuelList.clear();
    var userId = await GetUserInfo().getCurrentUserID();
    await FirebaseFirestore.instance
        .collection('confidenceLevel')
        .doc('$userId')
        .collection('levelCollection')
        .where('level', isEqualTo: 'LOW')
        .where('filter_id', isEqualTo: 'FUEL')
        //.where('AIRPLANE_GENERAL', isEqualTo: true)
        .get(GetOptions(source: Source.server))
        .then((value) {
      questionsFuelList.clear();
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

        questionsFuelList.add(questions);
        questionsFuelList.shuffle();
      }
      //initVideoUrl(questionsList);
    });

    var neverAskAgainList = await getNeverAskAgain();
    //var confidenceLevelList = await getCLQuestions();

    //remove never ask again questions
    for (var quizId in neverAskAgainList) {
      questionsFuelList.removeWhere((item) => item.id == quizId.id);
    }

    // //remove confidence level questions
    // for (var quizId in confidenceLevelList) {
    //   questionsFPList.removeWhere((item) => item.id == quizId.id);
    // }
    print('NUMBER OF AFCS ITEMS:: ${questionsAFCSList.length}');
    setState(() {});
    questionsList.addAll(questionsFuelList);
    questionsList.shuffle();
    // confidenceLeveCount = questionsList.length;
    setState(() {});
    return questionsFuelList.toSet().toList();
  }

  Future getFlightControlCLQuestions() async {
    questionsFCCSList.clear();
    var userId = await GetUserInfo().getCurrentUserID();
    await FirebaseFirestore.instance
        .collection('confidenceLevel')
        .doc('$userId')
        .collection('levelCollection')
        .where('level', isEqualTo: 'LOW')
        .where('filter_id', isEqualTo: 'FLIGHT_CONTROLS')
        //.where('AIRPLANE_GENERAL', isEqualTo: true)
        .get(GetOptions(source: Source.server))
        .then((value) {
      questionsFCCSList.clear();
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

        questionsFCCSList.add(questions);
        questionsFCCSList.shuffle();
      }
      //initVideoUrl(questionsList);
    });

    var neverAskAgainList = await getNeverAskAgain();
    //var confidenceLevelList = await getCLQuestions();

    //remove never ask again questions
    for (var quizId in neverAskAgainList) {
      questionsFCCSList.removeWhere((item) => item.id == quizId.id);
    }

    // //remove confidence level questions
    // for (var quizId in confidenceLevelList) {
    //   questionsFPList.removeWhere((item) => item.id == quizId.id);
    // }
    print('NUMBER OF AFCS ITEMS:: ${questionsFCCSList.length}');
    setState(() {});
    questionsList.addAll(questionsFCCSList);
    questionsList.shuffle();
    // confidenceLeveCount = questionsList.length;
    setState(() {});
    return questionsFCCSList.toSet().toList();
  }

  Future getAPUCLQuestions() async {
    questionsAPUList.clear();
    var userId = await GetUserInfo().getCurrentUserID();
    await FirebaseFirestore.instance
        .collection('confidenceLevel')
        .doc('$userId')
        .collection('levelCollection')
        .where('level', isEqualTo: 'LOW')
        .where('filter_id', isEqualTo: 'APU')
        //.where('AIRPLANE_GENERAL', isEqualTo: true)
        .get(GetOptions(source: Source.server))
        .then((value) {
      questionsAPUList.clear();
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

        questionsAPUList.add(questions);
        questionsAPUList.shuffle();
      }
      //initVideoUrl(questionsList);
    });

    var neverAskAgainList = await getNeverAskAgain();
    //var confidenceLevelList = await getCLQuestions();

    //remove never ask again questions
    for (var quizId in neverAskAgainList) {
      questionsAPUList.removeWhere((item) => item.id == quizId.id);
    }

    // //remove confidence level questions
    // for (var quizId in confidenceLevelList) {
    //   questionsFPList.removeWhere((item) => item.id == quizId.id);
    // }
    print('NUMBER OF AFCS ITEMS:: ${questionsAPUList.length}');
    setState(() {});
    questionsList.addAll(questionsAPUList);
    questionsList.shuffle();
    // confidenceLeveCount = questionsList.length;
    setState(() {});
    return questionsAPUList.toSet().toList();
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
        .get(GetOptions(source: Source.server))
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

  Future getAverageAFCSQuetions() async {
    questionsAvAFCSList.clear();
    //questionsList.clear();
    setState(() {});
    var uid = await GetUserInfo().getCurrentUserID();
    await FirebaseFirestore.instance
        .collection('confidenceLevel')
        .doc('$uid')
        .collection('levelCollection')
        .where('filter_id', isEqualTo: 'AFCS')
        .where('level', isEqualTo: 'AVERAGE')
        .get(
          GetOptions(source: Source.server),
        )
        .then((value) {
      questionsAvAFCSList.clear();
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

        questionsAvAFCSList.add(questions);
        questionsAvAFCSList.shuffle();
      }
      //initVideoUrl(questionsList);
    });
    var neverAskAgainQuiz = await getNeverAskAgain();
    for (var quizId in neverAskAgainQuiz) {
      questionsAvAFCSList.removeWhere((item) => item.id == quizId.id);
    }
    setState(() {});
    questionsList.addAll(questionsAvAFCSList);
    questionsList.shuffle();
    // confidenceLeveCount = questionsList.length;
    setState(() {});
    return questionsAvAFCSList.toSet().toList();
  }

  Future getAveragePowerPlantQuestions() async {
    questionsAvPPList.clear();
    //questionsList.clear();
    setState(() {});
    var uid = await GetUserInfo().getCurrentUserID();
    await FirebaseFirestore.instance
        .collection('confidenceLevel')
        .doc('$uid')
        .collection('levelCollection')
        .where('filter_id', isEqualTo: 'POWER_PLANT')
        .where('level', isEqualTo: 'AVERAGE')
        .get(
          GetOptions(source: Source.server),
        )
        .then((value) {
      questionsAvPPList.clear();
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

        questionsAvPPList.add(questions);
        questionsAvPPList.shuffle();
      }
      //initVideoUrl(questionsList);
    });
    var neverAskAgainQuiz = await getNeverAskAgain();
    for (var quizId in neverAskAgainQuiz) {
      questionsAvPPList.removeWhere((item) => item.id == quizId.id);
    }
    setState(() {});
    questionsList.addAll(questionsAvPPList);
    questionsList.shuffle();
    // confidenceLeveCount = questionsList.length;
    setState(() {});
    return questionsAvPPList.toSet().toList();
  }

  Future getAverageElectricalQuestions() async {
    questionsAvElectricalList.clear();
    //questionsList.clear();
    setState(() {});
    var uid = await GetUserInfo().getCurrentUserID();
    await FirebaseFirestore.instance
        .collection('confidenceLevel')
        .doc('$uid')
        .collection('levelCollection')
        .where('filter_id', isEqualTo: 'ELECTRICAL')
        .where('level', isEqualTo: 'AVERAGE')
        .get(
          GetOptions(source: Source.server),
        )
        .then((value) {
      questionsAvElectricalList.clear();
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

        questionsAvElectricalList.add(questions);
        questionsAvElectricalList.shuffle();
      }
      //initVideoUrl(questionsList);
    });
    var neverAskAgainQuiz = await getNeverAskAgain();
    for (var quizId in neverAskAgainQuiz) {
      questionsAvElectricalList.removeWhere((item) => item.id == quizId.id);
    }
    setState(() {});
    questionsList.addAll(questionsAvElectricalList);
    questionsList.shuffle();
    // confidenceLeveCount = questionsList.length;
    setState(() {});
    return questionsAvElectricalList.toSet().toList();
  }

  Future getAverageLandingGearQuestions() async {
    questionsAvLGList.clear();
    //questionsList.clear();
    setState(() {});
    var uid = await GetUserInfo().getCurrentUserID();
    await FirebaseFirestore.instance
        .collection('confidenceLevel')
        .doc('$uid')
        .collection('levelCollection')
        .where('filter_id', isEqualTo: 'LANDING_GEAR_AND_BRAKES')
        .where('level', isEqualTo: 'AVERAGE')
        .get(
          GetOptions(source: Source.server),
        )
        .then((value) {
      questionsAvLGList.clear();
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

        questionsAvLGList.add(questions);
        questionsAvLGList.shuffle();
      }
      //initVideoUrl(questionsList);
    });
    var neverAskAgainQuiz = await getNeverAskAgain();
    for (var quizId in neverAskAgainQuiz) {
      questionsAvLGList.removeWhere((item) => item.id == quizId.id);
    }
    setState(() {});
    questionsList.addAll(questionsAvLGList);
    questionsList.shuffle();
    // confidenceLeveCount = questionsList.length;
    setState(() {});
    return questionsAvLGList.toSet().toList();
  }

  Future getAverageEELightingQuestions() async {
    questionsAvEELList.clear();
    //questionsList.clear();
    setState(() {});
    var uid = await GetUserInfo().getCurrentUserID();
    await FirebaseFirestore.instance
        .collection('confidenceLevel')
        .doc('$uid')
        .collection('levelCollection')
        .where('filter_id', isEqualTo: 'O2,_EE,_LIGHTING')
        .where('level', isEqualTo: 'AVERAGE')
        .get(
          GetOptions(source: Source.server),
        )
        .then((value) {
      questionsAvEELList.clear();
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

        questionsAvEELList.add(questions);
        questionsAvEELList.shuffle();
      }
      //initVideoUrl(questionsList);
    });
    var neverAskAgainQuiz = await getNeverAskAgain();
    for (var quizId in neverAskAgainQuiz) {
      questionsAvEELList.removeWhere((item) => item.id == quizId.id);
    }
    setState(() {});
    questionsList.addAll(questionsAvEELList);
    questionsList.shuffle();
    // confidenceLeveCount = questionsList.length;
    setState(() {});
    return questionsAvEELList.toSet().toList();
  }

  Future getAverageOperatingNumbersQuestions() async {
    questionsAvOPList.clear();
    //questionsList.clear();
    setState(() {});
    var uid = await GetUserInfo().getCurrentUserID();
    await FirebaseFirestore.instance
        .collection('confidenceLevel')
        .doc('$uid')
        .collection('levelCollection')
        .where('filter_id', isEqualTo: 'OPERATING_NUMBERS')
        .where('level', isEqualTo: 'AVERAGE')
        .get(
          GetOptions(source: Source.server),
        )
        .then((value) {
      questionsAvOPList.clear();
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

        questionsAvOPList.add(questions);
        questionsAvOPList.shuffle();
      }
      //initVideoUrl(questionsList);
    });
    var neverAskAgainQuiz = await getNeverAskAgain();
    for (var quizId in neverAskAgainQuiz) {
      questionsAvOPList.removeWhere((item) => item.id == quizId.id);
    }
    setState(() {});
    questionsList.addAll(questionsAvOPList);
    questionsList.shuffle();
    // confidenceLeveCount = questionsList.length;
    setState(() {});
    return questionsAvOPList.toSet().toList();
  }

  Future getAverageNavAndCommsQuestions() async {
    questionsAvNavAndCommmsList.clear();
    //questionsList.clear();
    setState(() {});
    var uid = await GetUserInfo().getCurrentUserID();
    await FirebaseFirestore.instance
        .collection('confidenceLevel')
        .doc('$uid')
        .collection('levelCollection')
        .where('filter_id', isEqualTo: 'NAV_&_COMMS')
        .where('level', isEqualTo: 'AVERAGE')
        .get(
          GetOptions(source: Source.server),
        )
        .then((value) {
      questionsAvNavAndCommmsList.clear();
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

        questionsAvNavAndCommmsList.add(questions);
        questionsAvNavAndCommmsList.shuffle();
      }
      //initVideoUrl(questionsList);
    });
    var neverAskAgainQuiz = await getNeverAskAgain();
    for (var quizId in neverAskAgainQuiz) {
      questionsAvNavAndCommmsList.removeWhere((item) => item.id == quizId.id);
    }
    setState(() {});
    questionsList.addAll(questionsAvNavAndCommmsList);
    questionsList.shuffle();
    // confidenceLeveCount = questionsList.length;
    setState(() {});
    return questionsAvNavAndCommmsList.toSet().toList();
  }

  Future getAverageIceAndRainQuestions() async {
    questionsAvIceAndRainList.clear();
    //questionsList.clear();
    setState(() {});
    var uid = await GetUserInfo().getCurrentUserID();
    await FirebaseFirestore.instance
        .collection('confidenceLevel')
        .doc('$uid')
        .collection('levelCollection')
        .where('filter_id', isEqualTo: 'ICE_&_RAIN')
        .where('level', isEqualTo: 'AVERAGE')
        .get(
          GetOptions(source: Source.server),
        )
        .then((value) {
      questionsAvIceAndRainList.clear();
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

        questionsAvIceAndRainList.add(questions);
        questionsAvIceAndRainList.shuffle();
      }
      //initVideoUrl(questionsList);
    });
    var neverAskAgainQuiz = await getNeverAskAgain();
    for (var quizId in neverAskAgainQuiz) {
      questionsAvIceAndRainList.removeWhere((item) => item.id == quizId.id);
    }
    setState(() {});
    questionsList.addAll(questionsAvIceAndRainList);
    questionsList.shuffle();
    // confidenceLeveCount = questionsList.length;
    setState(() {});
    return questionsAvIceAndRainList.toSet().toList();
  }

  Future getAverageIAMQuestions() async {
    questionsAvIAMList.clear();
    //questionsList.clear();
    setState(() {});
    var uid = await GetUserInfo().getCurrentUserID();
    await FirebaseFirestore.instance
        .collection('confidenceLevel')
        .doc('$uid')
        .collection('levelCollection')
        .where('filter_id', isEqualTo: 'IAM')
        .where('level', isEqualTo: 'AVERAGE')
        .get(
          GetOptions(source: Source.server),
        )
        .then((value) {
      questionsAvIAMList.clear();
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

        questionsAvIAMList.add(questions);
        questionsAvIAMList.shuffle();
      }
      //initVideoUrl(questionsList);
    });
    var neverAskAgainQuiz = await getNeverAskAgain();
    for (var quizId in neverAskAgainQuiz) {
      questionsAvIAMList.removeWhere((item) => item.id == quizId.id);
    }
    setState(() {});
    questionsList.addAll(questionsAvIAMList);
    questionsList.shuffle();
    // confidenceLeveCount = questionsList.length;
    setState(() {});
    return questionsAvIAMList.toSet().toList();
  }

  Future getAverageHydraulicsQuestions() async {
    questionsAvHydraulicsList.clear();
    //questionsList.clear();
    setState(() {});
    var uid = await GetUserInfo().getCurrentUserID();
    await FirebaseFirestore.instance
        .collection('confidenceLevel')
        .doc('$uid')
        .collection('levelCollection')
        .where('filter_id', isEqualTo: 'HYDRAULICS')
        .where('level', isEqualTo: 'AVERAGE')
        .get(
          GetOptions(source: Source.server),
        )
        .then((value) {
      questionsAvHydraulicsList.clear();
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

        questionsAvHydraulicsList.add(questions);
        questionsAvHydraulicsList.shuffle();
      }
      //initVideoUrl(questionsList);
    });
    var neverAskAgainQuiz = await getNeverAskAgain();
    for (var quizId in neverAskAgainQuiz) {
      questionsAvHydraulicsList.removeWhere((item) => item.id == quizId.id);
    }
    setState(() {});
    questionsList.addAll(questionsAvHydraulicsList);
    questionsList.shuffle();
    // confidenceLeveCount = questionsList.length;
    setState(() {});
    return questionsAvHydraulicsList.toSet().toList();
  }

  Future getAverageFuelQuestions() async {
    questionsAvFuelList.clear();
    //questionsList.clear();
    setState(() {});
    var uid = await GetUserInfo().getCurrentUserID();
    await FirebaseFirestore.instance
        .collection('confidenceLevel')
        .doc('$uid')
        .collection('levelCollection')
        .where('filter_id', isEqualTo: 'FUEL')
        .where('level', isEqualTo: 'AVERAGE')
        .get(
          GetOptions(source: Source.server),
        )
        .then((value) {
      questionsAvFuelList.clear();
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

        questionsAvFuelList.add(questions);
        questionsAvFuelList.shuffle();
      }
      //initVideoUrl(questionsList);
    });
    var neverAskAgainQuiz = await getNeverAskAgain();
    for (var quizId in neverAskAgainQuiz) {
      questionsAvFuelList.removeWhere((item) => item.id == quizId.id);
    }
    setState(() {});
    questionsList.addAll(questionsAvFuelList);
    questionsList.shuffle();
    // confidenceLeveCount = questionsList.length;
    setState(() {});
    return questionsAvFuelList.toSet().toList();
  }

  Future getAverageAPUQuestions() async {
    questionsAvAPUSList.clear();
    //questionsList.clear();
    setState(() {});
    var uid = await GetUserInfo().getCurrentUserID();
    await FirebaseFirestore.instance
        .collection('confidenceLevel')
        .doc('$uid')
        .collection('levelCollection')
        .where('filter_id', isEqualTo: 'APU')
        .where('level', isEqualTo: 'AVERAGE')
        .get(GetOptions(source: Source.server))
        .then((value) {
      questionsAvAPUSList.clear();
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

        questionsAvAPUSList.add(questions);
        questionsAvAPUSList.shuffle();
      }
      //initVideoUrl(questionsList);
    });
    var neverAskAgainQuiz = await getNeverAskAgain();
    for (var quizId in neverAskAgainQuiz) {
      questionsAvAPUSList.removeWhere((item) => item.id == quizId.id);
    }
    setState(() {});
    questionsList.addAll(questionsAvAPUSList);
    questionsList.shuffle();
    // confidenceLeveCount = questionsList.length;
    setState(() {});
    return questionsAvAPUSList.toSet().toList();
  }

  Future getAverageFlightControlsQuestions() async {
    questionsAvFCList.clear();
    //questionsList.clear();
    setState(() {});
    var uid = await GetUserInfo().getCurrentUserID();
    await FirebaseFirestore.instance
        .collection('confidenceLevel')
        .doc('$uid')
        .collection('levelCollection')
        .where('filter_id', isEqualTo: 'FLIGHT_CONTROLS')
        .where('level', isEqualTo: 'AVERAGE')
        .get(GetOptions(source: Source.server))
        .then((value) {
      questionsAvFCList.clear();
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

        questionsAvFCList.add(questions);
        questionsAvFCList.shuffle();
      }
      //initVideoUrl(questionsList);
    });
    var neverAskAgainQuiz = await getNeverAskAgain();
    for (var quizId in neverAskAgainQuiz) {
      questionsAvFCList.removeWhere((item) => item.id == quizId.id);
    }
    setState(() {});
    questionsList.addAll(questionsAvFCList);
    questionsList.shuffle();
    // confidenceLeveCount = questionsList.length;
    setState(() {});
    return questionsAvFCList.toSet().toList();
  }

  Future getHighFireProtectionQuestions() async {
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
        .get(GetOptions(source: Source.server))
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

  Future getHighAFCSQuestions() async {
    questionsHighAFCSList.clear();
    //questionsList.clear();
    setState(() {});
    var uid = await GetUserInfo().getCurrentUserID();
    await FirebaseFirestore.instance
        .collection('confidenceLevel')
        .doc('$uid')
        .collection('levelCollection')
        .where('filter_id', isEqualTo: 'AFCS')
        .where('level', isEqualTo: 'HIGH')
        .get(GetOptions(source: Source.server))
        .then((value) {
      questionsHighAFCSList.clear();
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

        questionsHighAFCSList.add(questions);
        questionsHighAFCSList.shuffle();
      }
      //initVideoUrl(questionsList);
    });
    var neverAskAgainQuiz = await getNeverAskAgain();
    for (var quizId in neverAskAgainQuiz) {
      questionsHighAFCSList.removeWhere((item) => item.id == quizId.id);
    }
    setState(() {});
    questionsList.addAll(questionsHighAFCSList);
    questionsList.shuffle();
    // confidenceLeveCount = questionsList.length;
    setState(() {});
    return questionsHighAFCSList.toSet().toList();
  }

  Future getHighPowerPlantQuestions() async {
    questionsHighPPList.clear();
    //questionsList.clear();
    setState(() {});
    var uid = await GetUserInfo().getCurrentUserID();
    await FirebaseFirestore.instance
        .collection('confidenceLevel')
        .doc('$uid')
        .collection('levelCollection')
        .where('filter_id', isEqualTo: 'POWER_PLANT')
        .where('level', isEqualTo: 'HIGH')
        .get(GetOptions(source: Source.server))
        .then((value) {
      questionsHighPPList.clear();
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

        questionsHighPPList.add(questions);
        questionsHighPPList.shuffle();
      }
      //initVideoUrl(questionsList);
    });
    var neverAskAgainQuiz = await getNeverAskAgain();
    for (var quizId in neverAskAgainQuiz) {
      questionsHighPPList.removeWhere((item) => item.id == quizId.id);
    }
    setState(() {});
    questionsList.addAll(questionsHighPPList);
    questionsList.shuffle();
    // confidenceLeveCount = questionsList.length;
    setState(() {});
    return questionsHighPPList.toSet().toList();
  }

  Future getHighElectricalQuestions() async {
    questionsHighElectricalList.clear();
    //questionsList.clear();
    setState(() {});
    var uid = await GetUserInfo().getCurrentUserID();
    await FirebaseFirestore.instance
        .collection('confidenceLevel')
        .doc('$uid')
        .collection('levelCollection')
        .where('filter_id', isEqualTo: 'ELECTRICAL')
        .where('level', isEqualTo: 'HIGH')
        .get(GetOptions(source: Source.server))
        .then((value) {
      questionsHighElectricalList.clear();
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

        questionsHighElectricalList.add(questions);
        questionsHighElectricalList.shuffle();
      }
      //initVideoUrl(questionsList);
    });
    var neverAskAgainQuiz = await getNeverAskAgain();
    for (var quizId in neverAskAgainQuiz) {
      questionsHighElectricalList.removeWhere((item) => item.id == quizId.id);
    }
    setState(() {});
    questionsList.addAll(questionsHighElectricalList);
    questionsList.shuffle();
    // confidenceLeveCount = questionsList.length;
    setState(() {});
    return questionsHighElectricalList.toSet().toList();
  }

  Future getHighLandingGearQuestions() async {
    questionsHighLGList.clear();
    //questionsList.clear();
    setState(() {});
    var uid = await GetUserInfo().getCurrentUserID();
    await FirebaseFirestore.instance
        .collection('confidenceLevel')
        .doc('$uid')
        .collection('levelCollection')
        .where('filter_id', isEqualTo: 'LANDING_GEAR_AND_BRAKES')
        .where('level', isEqualTo: 'HIGH')
        .get(GetOptions(source: Source.server))
        .then((value) {
      questionsHighLGList.clear();
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

        questionsHighLGList.add(questions);
        questionsHighLGList.shuffle();
      }
      //initVideoUrl(questionsList);
    });
    var neverAskAgainQuiz = await getNeverAskAgain();
    for (var quizId in neverAskAgainQuiz) {
      questionsHighLGList.removeWhere((item) => item.id == quizId.id);
    }
    setState(() {});
    questionsList.addAll(questionsHighLGList);
    questionsList.shuffle();
    // confidenceLeveCount = questionsList.length;
    setState(() {});
    return questionsHighLGList.toSet().toList();
  }

  Future getHighEELightingQuestions() async {
    questionsHighEELList.clear();
    //questionsList.clear();
    setState(() {});
    var uid = await GetUserInfo().getCurrentUserID();
    await FirebaseFirestore.instance
        .collection('confidenceLevel')
        .doc('$uid')
        .collection('levelCollection')
        .where('filter_id', isEqualTo: 'O2,_EE,_LIGHTING')
        .where('level', isEqualTo: 'HIGH')
        .get(GetOptions(source: Source.server))
        .then((value) {
      questionsHighEELList.clear();
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

        questionsHighEELList.add(questions);
        questionsHighEELList.shuffle();
      }
      //initVideoUrl(questionsList);
    });
    var neverAskAgainQuiz = await getNeverAskAgain();
    for (var quizId in neverAskAgainQuiz) {
      questionsHighEELList.removeWhere((item) => item.id == quizId.id);
    }
    setState(() {});
    questionsList.addAll(questionsHighEELList);
    questionsList.shuffle();
    // confidenceLeveCount = questionsList.length;
    setState(() {});
    return questionsHighEELList.toSet().toList();
  }

  Future getHighOperatingNumbersQuestions() async {
    questionsHighOPList.clear();
    //questionsList.clear();
    setState(() {});
    var uid = await GetUserInfo().getCurrentUserID();
    await FirebaseFirestore.instance
        .collection('confidenceLevel')
        .doc('$uid')
        .collection('levelCollection')
        .where('filter_id', isEqualTo: 'OPERATING_NUMBERS')
        .where('level', isEqualTo: 'HIGH')
        .get(GetOptions(source: Source.server))
        .then((value) {
      questionsHighOPList.clear();
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

        questionsHighOPList.add(questions);
        questionsHighOPList.shuffle();
      }
      //initVideoUrl(questionsList);
    });
    var neverAskAgainQuiz = await getNeverAskAgain();
    for (var quizId in neverAskAgainQuiz) {
      questionsHighOPList.removeWhere((item) => item.id == quizId.id);
    }
    setState(() {});
    questionsList.addAll(questionsHighOPList);
    questionsList.shuffle();
    // confidenceLeveCount = questionsList.length;
    setState(() {});
    return questionsHighOPList.toSet().toList();
  }

  Future getHighNavAndCommsQuestions() async {
    questionsHighNavAndCommsList.clear();
    //questionsList.clear();
    setState(() {});
    var uid = await GetUserInfo().getCurrentUserID();
    await FirebaseFirestore.instance
        .collection('confidenceLevel')
        .doc('$uid')
        .collection('levelCollection')
        .where('filter_id', isEqualTo: 'NAV_&_COMMS')
        .where('level', isEqualTo: 'HIGH')
        .get(GetOptions(source: Source.server))
        .then((value) {
      questionsHighNavAndCommsList.clear();
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

        questionsHighNavAndCommsList.add(questions);
        questionsHighNavAndCommsList.shuffle();
      }
      //initVideoUrl(questionsList);
    });
    var neverAskAgainQuiz = await getNeverAskAgain();
    for (var quizId in neverAskAgainQuiz) {
      questionsHighNavAndCommsList.removeWhere((item) => item.id == quizId.id);
    }
    setState(() {});
    questionsList.addAll(questionsHighNavAndCommsList);
    questionsList.shuffle();
    // confidenceLeveCount = questionsList.length;
    setState(() {});
    return questionsHighNavAndCommsList.toSet().toList();
  }

  Future getHighIceAndRainQuetions() async {
    questionsHighIceAndRainList.clear();
    //questionsList.clear();
    setState(() {});
    var uid = await GetUserInfo().getCurrentUserID();
    await FirebaseFirestore.instance
        .collection('confidenceLevel')
        .doc('$uid')
        .collection('levelCollection')
        .where('filter_id', isEqualTo: 'ICE_&_RAIN')
        .where('level', isEqualTo: 'HIGH')
        .get(GetOptions(source: Source.server))
        .then((value) {
      questionsHighIceAndRainList.clear();
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

        questionsHighIceAndRainList.add(questions);
        questionsHighIceAndRainList.shuffle();
      }
      //initVideoUrl(questionsList);
    });
    var neverAskAgainQuiz = await getNeverAskAgain();
    for (var quizId in neverAskAgainQuiz) {
      questionsHighIceAndRainList.removeWhere((item) => item.id == quizId.id);
    }
    setState(() {});
    questionsList.addAll(questionsHighIceAndRainList);
    questionsList.shuffle();
    // confidenceLeveCount = questionsList.length;
    setState(() {});
    return questionsHighIceAndRainList.toSet().toList();
  }

  Future getHighIAMQuestions() async {
    questionsHighIAMList.clear();
    //questionsList.clear();
    setState(() {});
    var uid = await GetUserInfo().getCurrentUserID();
    await FirebaseFirestore.instance
        .collection('confidenceLevel')
        .doc('$uid')
        .collection('levelCollection')
        .where('filter_id', isEqualTo: 'IAM')
        .where('level', isEqualTo: 'HIGH')
        .get(GetOptions(source: Source.server))
        .then((value) {
      questionsHighIAMList.clear();
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

        questionsHighIAMList.add(questions);
        questionsHighIAMList.shuffle();
      }
      //initVideoUrl(questionsList);
    });
    var neverAskAgainQuiz = await getNeverAskAgain();
    for (var quizId in neverAskAgainQuiz) {
      questionsHighIAMList.removeWhere((item) => item.id == quizId.id);
    }
    setState(() {});
    questionsList.addAll(questionsHighIAMList);
    questionsList.shuffle();
    // confidenceLeveCount = questionsList.length;
    setState(() {});
    return questionsHighIAMList.toSet().toList();
  }

  Future getHighHydraulicsQuestions() async {
    questionsHighHydraulicsList.clear();
    //questionsList.clear();
    setState(() {});
    var uid = await GetUserInfo().getCurrentUserID();
    await FirebaseFirestore.instance
        .collection('confidenceLevel')
        .doc('$uid')
        .collection('levelCollection')
        .where('filter_id', isEqualTo: 'HYDRAULICS')
        .where('level', isEqualTo: 'HIGH')
        .get(GetOptions(source: Source.server))
        .then((value) {
      questionsHighHydraulicsList.clear();
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

        questionsHighHydraulicsList.add(questions);
        questionsHighHydraulicsList.shuffle();
      }
      //initVideoUrl(questionsList);
    });
    var neverAskAgainQuiz = await getNeverAskAgain();
    for (var quizId in neverAskAgainQuiz) {
      questionsHighHydraulicsList.removeWhere((item) => item.id == quizId.id);
    }
    setState(() {});
    questionsList.addAll(questionsHighHydraulicsList);
    questionsList.shuffle();
    // confidenceLeveCount = questionsList.length;
    setState(() {});
    return questionsHighHydraulicsList.toSet().toList();
  }

  Future getHighFuelQuestions() async {
    questionsHighFuelList.clear();
    //questionsList.clear();
    setState(() {});
    var uid = await GetUserInfo().getCurrentUserID();
    await FirebaseFirestore.instance
        .collection('confidenceLevel')
        .doc('$uid')
        .collection('levelCollection')
        .where('filter_id', isEqualTo: 'FUEL')
        .where('level', isEqualTo: 'HIGH')
        .get(GetOptions(source: Source.server))
        .then((value) {
      questionsHighFuelList.clear();
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

        questionsHighFuelList.add(questions);
        questionsHighFuelList.shuffle();
      }
      //initVideoUrl(questionsList);
    });
    var neverAskAgainQuiz = await getNeverAskAgain();
    for (var quizId in neverAskAgainQuiz) {
      questionsHighFuelList.removeWhere((item) => item.id == quizId.id);
    }
    setState(() {});
    questionsList.addAll(questionsHighFuelList);
    questionsList.shuffle();
    // confidenceLeveCount = questionsList.length;
    setState(() {});
    return questionsHighFuelList.toSet().toList();
  }

  Future getHighFlightControlsQuestions() async {
    questionsHighFCList.clear();
    //questionsList.clear();
    setState(() {});
    var uid = await GetUserInfo().getCurrentUserID();
    await FirebaseFirestore.instance
        .collection('confidenceLevel')
        .doc('$uid')
        .collection('levelCollection')
        .where('filter_id', isEqualTo: 'FLIGHT_CONTROLS')
        .where('level', isEqualTo: 'HIGH')
        .get(GetOptions(source: Source.server))
        .then((value) {
      questionsHighFCList.clear();
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

        questionsHighFCList.add(questions);
        questionsHighFCList.shuffle();
      }
      //initVideoUrl(questionsList);
    });
    var neverAskAgainQuiz = await getNeverAskAgain();
    for (var quizId in neverAskAgainQuiz) {
      questionsHighFCList.removeWhere((item) => item.id == quizId.id);
    }
    setState(() {});
    questionsList.addAll(questionsHighFCList);
    questionsList.shuffle();
    // confidenceLeveCount = questionsList.length;
    setState(() {});
    return questionsHighFCList.toSet().toList();
  }

  Future getHighAPUQuestions() async {
    questionsHighAPUList.clear();
    //questionsList.clear();
    setState(() {});
    var uid = await GetUserInfo().getCurrentUserID();
    await FirebaseFirestore.instance
        .collection('confidenceLevel')
        .doc('$uid')
        .collection('levelCollection')
        .where('filter_id', isEqualTo: 'APU')
        .where('level', isEqualTo: 'HIGH')
        .get(GetOptions(source: Source.server))
        .then((value) {
      questionsHighAPUList.clear();
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

        questionsHighAPUList.add(questions);
        questionsHighAPUList.shuffle();
      }
      //initVideoUrl(questionsList);
    });
    var neverAskAgainQuiz = await getNeverAskAgain();
    for (var quizId in neverAskAgainQuiz) {
      questionsHighAPUList.removeWhere((item) => item.id == quizId.id);
    }
    setState(() {});
    questionsList.addAll(questionsHighAPUList);
    questionsList.shuffle();
    // confidenceLeveCount = questionsList.length;
    setState(() {});
    return questionsHighAPUList.toSet().toList();
  }

  Future getVHighFireProtectionQuestions() async {
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
        .get(GetOptions(source: Source.server))
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

  Future getVHighAFCSQuetions() async {
    questionsVHighFPList.clear();
    //questionsList.clear();
    setState(() {});
    var uid = await GetUserInfo().getCurrentUserID();
    await FirebaseFirestore.instance
        .collection('confidenceLevel')
        .doc('$uid')
        .collection('levelCollection')
        .where('filter_id', isEqualTo: 'AFCS')
        .where('level', isEqualTo: 'VERY HIGH')
        .get(GetOptions(source: Source.server))
        .then((value) {
      questionsVHighAFCSList.clear();
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

        questionsVHighAFCSList.add(questions);
        questionsVHighAFCSList.shuffle();
      }
      //initVideoUrl(questionsList);
    });
    var neverAskAgainQuiz = await getNeverAskAgain();
    for (var quizId in neverAskAgainQuiz) {
      questionsVHighAFCSList.removeWhere((item) => item.id == quizId.id);
    }
    setState(() {});
    questionsList.addAll(questionsVHighAFCSList);
    questionsList.shuffle();
    // confidenceLeveCount = questionsList.length;
    setState(() {});
    return questionsVHighAFCSList.toSet().toList();
  }

  Future getVHighPowerPlantQuestions() async {
    questionsVHighPPList.clear();
    //questionsList.clear();
    setState(() {});
    var uid = await GetUserInfo().getCurrentUserID();
    await FirebaseFirestore.instance
        .collection('confidenceLevel')
        .doc('$uid')
        .collection('levelCollection')
        .where('filter_id', isEqualTo: 'POWER_PLANT')
        .where('level', isEqualTo: 'VERY HIGH')
        .get(GetOptions(source: Source.server))
        .then((value) {
      questionsVHighPPList.clear();
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

        questionsVHighPPList.add(questions);
        questionsVHighPPList.shuffle();
      }
      //initVideoUrl(questionsList);
    });
    var neverAskAgainQuiz = await getNeverAskAgain();
    for (var quizId in neverAskAgainQuiz) {
      questionsVHighPPList.removeWhere((item) => item.id == quizId.id);
    }
    setState(() {});
    questionsList.addAll(questionsVHighPPList);
    questionsList.shuffle();
    // confidenceLeveCount = questionsList.length;
    setState(() {});
    return questionsVHighPPList.toSet().toList();
  }

  Future getVHighElectricalQuestions() async {
    questionsVHighElectricalList.clear();
    //questionsList.clear();
    setState(() {});
    var uid = await GetUserInfo().getCurrentUserID();
    await FirebaseFirestore.instance
        .collection('confidenceLevel')
        .doc('$uid')
        .collection('levelCollection')
        .where('filter_id', isEqualTo: 'ELECTRICAL')
        .where('level', isEqualTo: 'VERY HIGH')
        .get(GetOptions(source: Source.server))
        .then((value) {
      questionsVHighElectricalList.clear();
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

        questionsVHighElectricalList.add(questions);
        questionsVHighElectricalList.shuffle();
      }
      //initVideoUrl(questionsList);
    });
    var neverAskAgainQuiz = await getNeverAskAgain();
    for (var quizId in neverAskAgainQuiz) {
      questionsVHighElectricalList.removeWhere((item) => item.id == quizId.id);
    }
    setState(() {});
    questionsList.addAll(questionsVHighElectricalList);
    questionsList.shuffle();
    // confidenceLeveCount = questionsList.length;
    setState(() {});
    return questionsVHighElectricalList.toSet().toList();
  }

  Future getVHighLandingGearQuestions() async {
    questionsVHighLGList.clear();
    //questionsList.clear();
    setState(() {});
    var uid = await GetUserInfo().getCurrentUserID();
    await FirebaseFirestore.instance
        .collection('confidenceLevel')
        .doc('$uid')
        .collection('levelCollection')
        .where('filter_id', isEqualTo: 'LANDING_GEAR_AND_BRAKES')
        .where('level', isEqualTo: 'VERY HIGH')
        .get(GetOptions(source: Source.server))
        .then((value) {
      questionsVHighLGList.clear();
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

        questionsVHighLGList.add(questions);
        questionsVHighLGList.shuffle();
      }
      //initVideoUrl(questionsList);
    });
    var neverAskAgainQuiz = await getNeverAskAgain();
    for (var quizId in neverAskAgainQuiz) {
      questionsVHighLGList.removeWhere((item) => item.id == quizId.id);
    }
    setState(() {});
    questionsList.addAll(questionsVHighLGList);
    questionsList.shuffle();
    // confidenceLeveCount = questionsList.length;
    setState(() {});
    return questionsVHighLGList.toSet().toList();
  }

  Future getVHighEELQuestions() async {
    questionsVHighEELList.clear();
    //questionsList.clear();
    setState(() {});
    var uid = await GetUserInfo().getCurrentUserID();
    await FirebaseFirestore.instance
        .collection('confidenceLevel')
        .doc('$uid')
        .collection('levelCollection')
        .where('filter_id', isEqualTo: 'O2,_EE,_LIGHTING')
        .where('level', isEqualTo: 'VERY HIGH')
        .get(GetOptions(source: Source.server))
        .then((value) {
      questionsVHighEELList.clear();
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

        questionsVHighEELList.add(questions);
        questionsVHighEELList.shuffle();
      }
      //initVideoUrl(questionsList);
    });
    var neverAskAgainQuiz = await getNeverAskAgain();
    for (var quizId in neverAskAgainQuiz) {
      questionsVHighEELList.removeWhere((item) => item.id == quizId.id);
    }
    setState(() {});
    questionsList.addAll(questionsVHighEELList);
    questionsList.shuffle();
    // confidenceLeveCount = questionsList.length;
    setState(() {});
    return questionsVHighEELList.toSet().toList();
  }

  Future getVHighOperatingNumbersQuestions() async {
    questionsVHighONList.clear();
    //questionsList.clear();
    setState(() {});
    var uid = await GetUserInfo().getCurrentUserID();
    await FirebaseFirestore.instance
        .collection('confidenceLevel')
        .doc('$uid')
        .collection('levelCollection')
        .where('filter_id', isEqualTo: 'OPERATING_NUMBERS')
        .where('level', isEqualTo: 'VERY HIGH')
        .get(GetOptions(source: Source.server))
        .then((value) {
      questionsVHighONList.clear();
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

        questionsVHighONList.add(questions);
        questionsVHighONList.shuffle();
      }
      //initVideoUrl(questionsList);
    });
    var neverAskAgainQuiz = await getNeverAskAgain();
    for (var quizId in neverAskAgainQuiz) {
      questionsVHighONList.removeWhere((item) => item.id == quizId.id);
    }
    setState(() {});
    questionsList.addAll(questionsVHighONList);
    questionsList.shuffle();
    // confidenceLeveCount = questionsList.length;
    setState(() {});
    return questionsVHighONList.toSet().toList();
  }

  Future getVHighNavAndCommsQuestions() async {
    questionsVHighNVList.clear();
    //questionsList.clear();
    setState(() {});
    var uid = await GetUserInfo().getCurrentUserID();
    await FirebaseFirestore.instance
        .collection('confidenceLevel')
        .doc('$uid')
        .collection('levelCollection')
        .where('filter_id', isEqualTo: 'NAV_&_COMMS')
        .where('level', isEqualTo: 'VERY HIGH')
        .get(GetOptions(source: Source.server))
        .then((value) {
      questionsVHighNVList.clear();
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

        questionsVHighNVList.add(questions);
        questionsVHighNVList.shuffle();
      }
      //initVideoUrl(questionsList);
    });
    var neverAskAgainQuiz = await getNeverAskAgain();
    for (var quizId in neverAskAgainQuiz) {
      questionsVHighNVList.removeWhere((item) => item.id == quizId.id);
    }
    setState(() {});
    questionsList.addAll(questionsVHighNVList);
    questionsList.shuffle();
    // confidenceLeveCount = questionsList.length;
    setState(() {});
    return questionsVHighNVList.toSet().toList();
  }

  Future getVHighIceAndRainQuetions() async {
    questionsVHighIceAndRainList.clear();
    //questionsList.clear();
    setState(() {});
    var uid = await GetUserInfo().getCurrentUserID();
    await FirebaseFirestore.instance
        .collection('confidenceLevel')
        .doc('$uid')
        .collection('levelCollection')
        .where('filter_id', isEqualTo: 'ICE_&_RAIN')
        .where('level', isEqualTo: 'VERY HIGH')
        .get(GetOptions(source: Source.server))
        .then((value) {
      questionsVHighIceAndRainList.clear();
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

        questionsVHighIceAndRainList.add(questions);
        questionsVHighIceAndRainList.shuffle();
      }
      //initVideoUrl(questionsList);
    });
    var neverAskAgainQuiz = await getNeverAskAgain();
    for (var quizId in neverAskAgainQuiz) {
      questionsVHighIceAndRainList.removeWhere((item) => item.id == quizId.id);
    }
    setState(() {});
    questionsList.addAll(questionsVHighIceAndRainList);
    questionsList.shuffle();
    // confidenceLeveCount = questionsList.length;
    setState(() {});
    return questionsVHighIceAndRainList.toSet().toList();
  }

  Future getVHighIAMQuestions() async {
    questionsVHighIAMList.clear();
    //questionsList.clear();
    setState(() {});
    var uid = await GetUserInfo().getCurrentUserID();
    await FirebaseFirestore.instance
        .collection('confidenceLevel')
        .doc('$uid')
        .collection('levelCollection')
        .where('filter_id', isEqualTo: 'IAM')
        .where('level', isEqualTo: 'VERY HIGH')
        .get(GetOptions(source: Source.server))
        .then((value) {
      questionsVHighIAMList.clear();
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

        questionsVHighIAMList.add(questions);
        questionsVHighIAMList.shuffle();
      }
      //initVideoUrl(questionsList);
    });
    var neverAskAgainQuiz = await getNeverAskAgain();
    for (var quizId in neverAskAgainQuiz) {
      questionsVHighIAMList.removeWhere((item) => item.id == quizId.id);
    }
    setState(() {});
    questionsList.addAll(questionsVHighIAMList);
    questionsList.shuffle();
    // confidenceLeveCount = questionsList.length;
    setState(() {});
    return questionsVHighIAMList.toSet().toList();
  }

  Future getVHighHydraulicQuestions() async {
    questionsVHighHydraulicList.clear();
    //questionsList.clear();
    setState(() {});
    var uid = await GetUserInfo().getCurrentUserID();
    await FirebaseFirestore.instance
        .collection('confidenceLevel')
        .doc('$uid')
        .collection('levelCollection')
        .where('filter_id', isEqualTo: 'HYDRAULICS')
        .where('level', isEqualTo: 'VERY HIGH')
        .get(GetOptions(source: Source.server))
        .then((value) {
      questionsVHighHydraulicList.clear();
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

        questionsVHighHydraulicList.add(questions);
        questionsVHighHydraulicList.shuffle();
      }
      //initVideoUrl(questionsList);
    });
    var neverAskAgainQuiz = await getNeverAskAgain();
    for (var quizId in neverAskAgainQuiz) {
      questionsVHighHydraulicList.removeWhere((item) => item.id == quizId.id);
    }
    setState(() {});
    questionsList.addAll(questionsVHighHydraulicList);
    questionsList.shuffle();
    // confidenceLeveCount = questionsList.length;
    setState(() {});
    return questionsVHighHydraulicList.toSet().toList();
  }

  Future getVHighFuelQuestions() async {
    questionsVHighFuelList.clear();
    //questionsList.clear();
    setState(() {});
    var uid = await GetUserInfo().getCurrentUserID();
    await FirebaseFirestore.instance
        .collection('confidenceLevel')
        .doc('$uid')
        .collection('levelCollection')
        .where('filter_id', isEqualTo: 'FUEL')
        .where('level', isEqualTo: 'VERY HIGH')
        .get(GetOptions(source: Source.server))
        .then((value) {
      questionsVHighFuelList.clear();
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

        questionsVHighFuelList.add(questions);
        questionsVHighFuelList.shuffle();
      }
      //initVideoUrl(questionsList);
    });
    var neverAskAgainQuiz = await getNeverAskAgain();
    for (var quizId in neverAskAgainQuiz) {
      questionsVHighFuelList.removeWhere((item) => item.id == quizId.id);
    }
    setState(() {});
    questionsList.addAll(questionsVHighFuelList);
    questionsList.shuffle();
    // confidenceLeveCount = questionsList.length;
    setState(() {});
    return questionsVHighFuelList.toSet().toList();
  }

  Future getVHighFlightControlsQuestions() async {
    questionsVHighFCList.clear();
    //questionsList.clear();
    setState(() {});
    var uid = await GetUserInfo().getCurrentUserID();
    await FirebaseFirestore.instance
        .collection('confidenceLevel')
        .doc('$uid')
        .collection('levelCollection')
        .where('filter_id', isEqualTo: 'FLIGHT_CONTROLS')
        .where('level', isEqualTo: 'VERY HIGH')
        .get(GetOptions(source: Source.server))
        .then((value) {
      questionsVHighFCList.clear();
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

        questionsVHighFCList.add(questions);
        questionsVHighFCList.shuffle();
      }
      //initVideoUrl(questionsList);
    });
    var neverAskAgainQuiz = await getNeverAskAgain();
    for (var quizId in neverAskAgainQuiz) {
      questionsVHighFCList.removeWhere((item) => item.id == quizId.id);
    }
    setState(() {});
    questionsList.addAll(questionsVHighFCList);
    questionsList.shuffle();
    // confidenceLeveCount = questionsList.length;
    setState(() {});
    return questionsVHighFCList.toSet().toList();
  }

  Future getVHighAPUQuestions() async {
    questionsVHighAPUList.clear();
    //questionsList.clear();
    setState(() {});
    var uid = await GetUserInfo().getCurrentUserID();
    await FirebaseFirestore.instance
        .collection('confidenceLevel')
        .doc('$uid')
        .collection('levelCollection')
        .where('filter_id', isEqualTo: 'APU')
        .where('level', isEqualTo: 'VERY HIGH')
        .get(GetOptions(source: Source.server))
        .then((value) {
      questionsVHighAPUList.clear();
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

        questionsVHighAPUList.add(questions);
        questionsVHighAPUList.shuffle();
      }
      //initVideoUrl(questionsList);
    });
    var neverAskAgainQuiz = await getNeverAskAgain();
    for (var quizId in neverAskAgainQuiz) {
      questionsVHighAPUList.removeWhere((item) => item.id == quizId.id);
    }
    setState(() {});
    questionsList.addAll(questionsVHighAPUList);
    questionsList.shuffle();
    // confidenceLeveCount = questionsList.length;
    setState(() {});
    return questionsVHighAPUList.toSet().toList();
  }

  Future getLowAirplaneGeneralQuestions() async {
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
        .get(GetOptions(source: Source.server))
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

  Future getAverageAirplaneGeneralQuestions() async {
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
        .get(GetOptions(source: Source.server))
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

  Future getHighAirplaneGeneralQuestions() async {
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
        .get(GetOptions(source: Source.server))
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

  Future getVHighAirplaneGeneralQuestions() async {
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
        .get(GetOptions(source: Source.server))
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

  Future getLowElectronicDisplayQuestions() async {
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
        .get(GetOptions(source: Source.server))
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

  Future getAverageElectronicDisplayQuestions() async {
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
        .get(GetOptions(source: Source.server))
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

  Future getHighElectronicDisplayQuestions() async {
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
        .get(GetOptions(source: Source.server))
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

  Future getVHighElectronicDisplayQuestions() async {
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
        .get(GetOptions(source: Source.server))
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

  Future getLowVariousMediaQuestions() async {
    //
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
        .get(GetOptions(source: Source.server))
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
        .get(GetOptions(source: Source.server))
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
        .get(GetOptions(source: Source.server))
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
        .get(GetOptions(source: Source.server))
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
        .get(
          GetOptions(
            source: Source.server,
          ),
        )
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
        .get(GetOptions(source: Source.server))
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
        .get(GetOptions(source: Source.server))
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

  Future getFPCLQuestions() async {
    questionsFPList.clear();
    var userId = await GetUserInfo().getCurrentUserID();
    await FirebaseFirestore.instance
        .collection('confidenceLevel')
        .doc('$userId')
        .collection('levelCollection')
        .where('level', isEqualTo: 'LOW')
        .where('filter_id', isEqualTo: 'FIRE_PROTECTION')
        //.where('AIRPLANE_GENERAL', isEqualTo: true)
        .get(GetOptions(source: Source.server))
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
        .get(GetOptions(source: Source.server))
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
        .get(GetOptions(source: Source.server))
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
        .get(GetOptions(source: Source.server))
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
