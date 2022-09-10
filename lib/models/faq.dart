import 'package:quizjets/export_files.dart';

class Faq {
  final String id;
  final String faqsTitle;
  final String desc;

  Faq({
    this.id,
    this.faqsTitle,
    this.desc,
  });

  factory Faq.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data();

    return Faq(
      id: doc.id,
      faqsTitle: data['faqsTitle'] ?? '',
      desc: data['desc'] ?? '',
    );
  }
}
