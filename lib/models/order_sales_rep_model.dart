class OrderSalesRep {
  int id = 0;
  List<dynamic> productOrder = [];
  Map<String, dynamic> counterparty = {};
  String date = '';
  int typeOrder = 0;
  int status = 0;
  String deliveredDate = '';
  int typeDelivery = 0;
  int courier = 0;
  int total = 0;
  String counterpartyName = '';
  String comment = '';
  int paymentType = 0;

  OrderSalesRep({
    required this.id,
    required this.productOrder,
    required this.counterparty,
    required this.date,
    required this.typeOrder,
    required this.status,
    required this.deliveredDate,
    required this.typeDelivery,
    required this.courier,
    required this.total,
    required this.counterpartyName,
    required this.comment,
    required this.paymentType,
  });

  OrderSalesRep.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['product_order'] != null) {
      productOrder = json['product_order'];
    }
    counterparty = json['counterparty'];
    date = json['date'];
    typeOrder = json['type_order'];
    status = json['status'];
    deliveredDate = json['delivered_date'];
    typeDelivery = json['type_delivery'];
    courier = json['courier'];
    total = json['total'];
    counterpartyName = json['counterparty']['name'];
    comment = json['comment'];
    paymentType = json['type_payment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_order'] = this.productOrder;
    data['counterparty'] = this.counterparty;
    data['date'] = this.date;
    data['type_order'] = this.typeOrder;
    data['status'] = this.status;
    data['delivered_date'] = this.deliveredDate;
    data['type_delivery'] = this.typeDelivery;
    data['courier'] = this.courier;
    data['total'] = this.total;
    data['comment'] = this.comment;
    data['type_payment'] = this.paymentType;
    return data;
  }
}
