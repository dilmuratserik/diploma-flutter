class Plan {
  int id = 0;
  String pointName = '';
  String date = '';
  bool plan = false;
  bool fact = false;
  String comment = '';
  int agentID = 0;

  Plan({
    required this.id,
    required this.pointName,
    required this.date,
    required this.plan,
    required this.fact,
    required this.comment,
    required this.agentID,
  });

  Plan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pointName = json['point']['name'];
    date = json['date'];
    plan = json['plan'];
    fact = json['fact'];
    comment = json['comments'];
    agentID = json['agent'];
  }
}
