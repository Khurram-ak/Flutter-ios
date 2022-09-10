import 'package:quizjets/export_files.dart';

class Subject {
  final String id;
  final String name;
  final String desc;
  final String icon;
  final bool active;
  final int cost;
  final bool coming_soon;

  Subject({
    this.id,
    this.name,
    this.desc,
    this.icon,
    this.active,
    this.cost,
    this.coming_soon,
  });

  factory Subject.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data();

    return Subject(
      id: doc.id,
      name: data['name'] ?? '',
      desc: data['desc'] ?? '',
      icon: data['icon'] ?? '',
      active: data['active'] ?? true,
      cost: data['cost'] ?? 0,
      coming_soon: data['coming_soon'] ?? false,
    );
  }
}
