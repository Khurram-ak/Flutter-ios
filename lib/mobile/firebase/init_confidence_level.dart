import 'dart:async';

import 'package:quizjets/export_files.dart';

checkExist() async {
  var userId = await GetUserInfo().getCurrentUserID();
  try {
    await FirebaseFirestore.instance
        .doc("confidenceLevel/$userId")
        .get()
        .then((doc) {
      if (doc.exists) {
        //addToConfidenceLevel();
      }
      else {
        addToConfidenceLevel();
      }
        
    });

  } catch (e) {
    addToConfidenceLevel();
  }
}


addToConfidenceLevel() async {
  var quizJets = await getQuestions();
  print('questions length ${quizJets.length}');
  for (var item in quizJets) {
    var userId = FirebaseAuth.instance.currentUser.uid;
    print('USER ID $userId');
    print('question Id ${item.id}');
    //var userId = await GetUserInfo().getCurrentUserID();
    await FirebaseFirestore.instance.collection('confidenceLevel').doc("$userId").set({
        'dummyField': '',
      });
    await FirebaseFirestore.instance
        .collection('confidenceLevel')
        .doc("$userId")
        .collection('levelCollection')
        .doc("${item.id}")
        .set({
      'level': 'LOW',
      'question_id': item.id,
      'level_id': item.id,
      'subject': item.filter_id,
      'filter_id': item.filter_id,
      'question': item.question,
      'ans_1': item.ans_1,
      'ans_2': item.ans_2,
      'ans_3': item.ans_3,
      'ans_4': item.ans_4,
      'mediaType': item.mediaType,
      'mediaUrl': item.mediaUrl,
      'id': item.id,
      'active': true,
    }).onError((error, stackTrace) {
      print('ADD CONFIDENCE LEVEL ERRO $error');
    });
  }
}

Future getQuestions() async {
  List<Question> questionList = [];
  await FirebaseFirestore.instance
      .collection('quizjetsQuestions')
      .doc('000')
      .collection('questionsCollection')
      .get()
      .then((value) {
    questionList.clear();
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

      questionList.add(questions);
      questionList.shuffle();
    }
    //initVideoUrl(questionsList);
  }).onError((error, stackTrace) {
    print('GETTING QUESTIONS FOR CONDIFIDENCE LEVE ERROR $error');
  });

  return questionList.toSet().toList();
}
