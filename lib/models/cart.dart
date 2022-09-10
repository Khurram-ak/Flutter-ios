import 'package:quizjets/export_files.dart';

class Cart {
  final String id;
  final String name;
  final String desc;
  final String icon;
  final bool active;
  final int cost;

  Cart({
    this.id,
    this.name,
    this.desc,
    this.icon,
    this.active,
    this.cost,
  });

  factory Cart.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data();

    return Cart(
      id: doc.id,
      name: data['name'] ?? '',
      desc: data['desc'] ?? '',
      icon: data['icon'] ?? '',
      active: data['active'] ?? true,
      cost: data['cost'] ?? 0,
    );
  }
}
