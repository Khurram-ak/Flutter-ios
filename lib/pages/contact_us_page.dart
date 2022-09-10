import 'package:flutter/material.dart';
import 'package:quizjets/export_files.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ContactUsPage extends StatefulWidget {
  static const String route = '/contact_us';

  @override
  _ContactUsPageState createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var fNameController = TextEditingController();
  var lNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var conPasswordController = TextEditingController();
  var phoneController = TextEditingController();
  var messageController = TextEditingController();
  var hearAboutUsController = TextEditingController();
  bool isPassword = true;
  bool showPassword = true;
  bool showLoader = false;
  bool showConfirmPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainNavigationDrawer(),
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: HomeBar(),
        ),
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/contact_us.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                height: 400.0,
                width: MediaQuery.of(context).size.width,
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: [
                      QuizJetsTheme.quizJetsBlue.withOpacity(.2),
                      QuizJetsTheme.quizJetsBlue.withOpacity(.2),
                    ],
                  ),
                ),
                height: 400.0,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Text(
                    'Contact Us',
                    style: TextStyle(
                      fontSize: 36.5,
                      fontFamily: Str.POPPINS,
                      fontWeight: FontWeight.w600,
                      letterSpacing: .7,
                      wordSpacing: 2.5,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * .12),
            child: headingStr(),
          ),
          signupLayout(),
          SizedBox(
            height: 40.0,
          ),
          FooterView()
        ],
      ),
    );
  }

  Widget headingStr() => Container(
        margin: EdgeInsets.only(
          top: 80.0,
        ),
        child: RichText(
          textAlign: TextAlign.center,
          text: new TextSpan(
            style: new TextStyle(
              height: 1.2,
              letterSpacing: .6,
            ),
            children: <TextSpan>[
              new TextSpan(
                text: 'Let\'s prepare for take-off.\n\n',
                style: TextStyle(
                  fontFamily: Str.POPPINS,
                  fontWeight: FontWeight.w500,
                  //wordSpacing: 2.5,
                  letterSpacing: .6,
                  color: Colors.black.withOpacity(.9),
                  fontSize: 35.0,
                ),
              ),
              new TextSpan(
                text:
                    'Hello, fill in your details below\nand we will answer you asap.',
                style: TextStyle(
                  fontFamily: Str.POPPINS,
                  fontWeight: FontWeight.w500,
                  //wordSpacing: 2.5,
                  letterSpacing: .8,
                  color: Colors.black.withOpacity(.6),
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
        ),
      );

  Widget signupLayout() => ResponsiveBuilder(
        builder: (context, sizingInformation) => Container(
          margin: EdgeInsets.symmetric(
            horizontal: sizingInformation.deviceScreenType ==
                    DeviceScreenType.mobile
                ? 30
                : sizingInformation.deviceScreenType == DeviceScreenType.tablet
                    ? MediaQuery.of(context).size.width * .15
                    : MediaQuery.of(context).size.width * .25,
            vertical: 30,
          ),
          child: Card(
            elevation: 2,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: sizingInformation.deviceScreenType ==
                        DeviceScreenType.mobile
                    ? 30
                    : MediaQuery.of(context).size.width * .05,
                vertical: MediaQuery.of(context).size.width * .02,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 40.0,
                  ),
  
                  Row(
                    children: [
                      Expanded(
                        child: inputField(
                          fNameController,
                          'First name',
                          Icons.person,
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: inputField(
                          lNameController,
                          'Last name',
                          Icons.person,
                        ),
                      )
                    ],
                  ),
  
                  SizedBox(
                    height: 25.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: inputField(
                          emailController,
                          'Email Address',
                          Icons.email_outlined,
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: inputField(
                          phoneController,
                          'Mobile phone number',
                          Icons.phone_outlined,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
  
                  inputField(
                    messageController,
                    'Message',
                    Icons.info_outline,
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
  
                  loginBtn(),
  
                  //alreadyHveAccountStr(),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
  );

  Widget loginBtn() => MouseRegion(
    cursor: SystemMouseCursors.click,
    child: GestureDetector(
          onTap: () {
            if (fNameController.text.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Color(0xFF007EC7),
                  content: Text(
                    "Please Enter First name!",
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
            if (lNameController.text.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Color(0xFF007EC7),
                  content: Text(
                    "Please Enter Last name!",
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
            if (emailController.text.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Color(0xFF007EC7),
                  content: Text(
                    "Please Enter Email Address!",
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
            if (messageController.text.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Color(0xFF007EC7),
                  content: Text(
                    "Please Enter Message!",
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
            sendFeedback();
          },
          child: Container(
            height: 50.0,
            width: 120.0,
            //padding: EdgeInsets.only(right: 20.0, left: 20.0),
            margin: EdgeInsets.symmetric(
              horizontal: 0.0,
              vertical: 10.0,
            ),
            decoration: new BoxDecoration(
              color: Color(0xFF007EC7),
              border: Border.all(
                width: 0.0,
                color: Color(0xFF007EC7),
              ),
              borderRadius: new BorderRadius.all(
                const Radius.circular(24.0),
              ),
            ),
            child: Center(
              child: Text(
                'SUBMIT',
                style: TextStyle(
                  fontSize: 14.5,
                  color: Colors.white,
                  fontFamily: Str.POPPINS,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
  );

  Widget alreadyHveAccountStr() => new GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: RichText(
        textAlign: TextAlign.center,
        text: new TextSpan(
          style: new TextStyle(
            height: 1.0,
          ),
          children: <TextSpan>[
            new TextSpan(
              text: 'Already have an Account? ',
              style: TextStyle(
                fontFamily: Str.POPPINS,
                fontWeight: FontWeight.w500,
                wordSpacing: 1.5,
                color: Colors.grey,
                fontSize: 13.5,
              ),
            ),
            new TextSpan(
                text: 'Log In',
                style: TextStyle(
                  fontFamily: Str.POPPINS,
                  fontWeight: FontWeight.w600,
                  wordSpacing: 2.5,
                  color: Colors.grey,
                  fontSize: 13.5,
                )),
          ],
        ),
      ));

  Widget inputField(var controler, String hintStr, var iconn) => Container(
        // margin: EdgeInsets.symmetric(
        //   horizontal: 30.0,
        // ),
        child: TextField(
          controller: controler,
          // minLines: 10,
          //maxLength: 20,
          autocorrect: true,
          style: TextStyle(
            fontSize: 14.0,
            color: Colors.grey,
            fontFamily: Str.POPPINS,
          ),
          decoration: InputDecoration(
            hintText: hintStr,
            filled: true,
            labelText: hintStr,
            counterStyle: TextStyle(
              color: Colors.grey,
              fontFamily: Str.POPPINS,
            ),
            //fillColor: Color(0xFFDBEDFF),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(6.0)),
              borderSide: BorderSide(color: Colors.grey),
            ),
            prefixIcon: Icon(
              iconn,
              color: Colors.grey,
              size: 21.0,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(6.0)),
              borderSide: BorderSide(color: Colors.grey),
            ),
            hintStyle: TextStyle(
              fontSize: 13.0,
              color: Colors.grey,
              fontFamily: Str.POPPINS,
            ),
            labelStyle: TextStyle(
              fontSize: 14.0,
              color: Colors.grey,
              fontFamily: Str.POPPINS,
            ),
          ),
        ),
      );

  sendFeedback() async {
    String username = 'username@gmail.com';
    String password = 'password';

    final smtpServer = gmail(username, password);

    // Create our message.
    final message = Message()
      ..from = Address(username, 'Your name')
      ..recipients.add('codehomiedev@gmail.com')
      ..ccRecipients.addAll(['destCc1@example.com', 'destCc2@example.com'])
      ..bccRecipients.add(Address('bccAddress@example.com'))
      ..subject = 'Test Dart Mailer library :: 😀 :: ${DateTime.now()}'
      ..text = 'This is the plain text.\nThis is line 2 of the text part.'
      ..html = "<h1>Test</h1>\n<p>Hey! Here's some HTML content</p>";

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
      fNameController.text = '';
      lNameController.text = '';
      emailController.text = '';
      messageController.text = '';
      phoneController.text = '';
      setState(() {
        
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Color(0xFF007EC7),
          content: Text(
            "Message sent Successfully!",
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
    } on MailerException catch (e) {
      print('Message not sent.');
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
       ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Color(0xFF007EC7),
          content: Text(
            "Message not sent",
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
    }
    // DONE

  }
}
