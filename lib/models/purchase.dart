import 'package:quizjets/export_files.dart';

class Purchase {
  final String id;
  final String name;
  final String desc;
  final String icon;
  final bool active;
  final int cost;
  var date;
  final bool monthly;

  Purchase({
    this.id,
    this.name,
    this.desc,
    this.icon,
    this.active,
    this.cost,
    this.date,
    this.monthly,
  });

  factory Purchase.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data();

    return Purchase(
      id: doc.id,
      name: data['name'] ?? '',
      desc: data['desc'] ?? '',
      icon: data['icon'] ?? '',
      active: data['active'] ?? true,
      monthly: data['monthlySubscription'] ?? false,
      cost: data['cost'] ?? 0,
      date: data['date'] ?? '',
    );
  }
}
