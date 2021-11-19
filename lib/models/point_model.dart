class Point {
  String phone = '';
  String name = '';
  String binIin = '';
  int debt = 0;

  Point({
    required this.phone,
    required this.name,
    required this.binIin,
    required this.debt,
  });

  Point.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    name = json['name'];
    binIin = json['bin_iin'];
    debt = json['debt'];
  }
}
