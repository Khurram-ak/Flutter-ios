class PurchaseInfo {
  final String id;
  final String name;
  final String desc;
  final String icon;
  final bool active;
  final int cost;
  var date;
  final bool monthly;

  PurchaseInfo({
    this.id,
    this.name,
    this.desc,
    this.icon,
    this.active,
    this.cost,
    this.date,
    this.monthly,
  });

  factory PurchaseInfo.fromMap(Map data) {
    return PurchaseInfo(
      id: data['id'] ?? '',
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
