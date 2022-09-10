import 'package:quizjets/export_files.dart';

class Category {
  final String id;
  final String name;
  final String desc;
  final String icon;
  final String plane_id;

  Category({
    this.id,
    this.name,
    this.desc,
    this.icon,
    this.plane_id,
  });

  factory Category.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data();

    return Category(
      id: doc.id,
      name: data['name'] ?? '',
      desc: data['desc'] ?? '',
      icon: data['icon'] ?? '',
      plane_id: data['plane_id'] ?? '',
    );
  }
}
