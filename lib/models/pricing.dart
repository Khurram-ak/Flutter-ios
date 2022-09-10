import 'package:quizjets/export_files.dart';

class Pricing {
  final String id;
  final String price;
  final String duration;
  final String desc;

  Pricing({
    this.id,
    this.price,
    this.duration,
    this.desc,
  });

  factory Pricing.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data();

    return Pricing(
      id: doc.id,
      price: data['price'] ?? '',
      duration: data['duration'] ?? '',
      desc: data['desc'] ?? '',
    );
  }
}
