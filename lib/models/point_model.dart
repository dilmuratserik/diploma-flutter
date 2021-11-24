class Point {
  int id = 0;
  String phone = '';
  String name = '';
  String binIin = '';
  int debt = 0;
  dynamic credit = null;
  int orderSector = 0;

  Point({
    required this.id,
    required this.phone,
    required this.name,
    required this.binIin,
    required this.debt,
    required this.credit,
    required this.orderSector,
  });

  Point.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phone = json['phone'];
    name = json['name'];
    binIin = json['bin_iin'];
    debt = json['debt'];
    credit = json['credit'];
    orderSector = json['order_sector'];
  }
}
