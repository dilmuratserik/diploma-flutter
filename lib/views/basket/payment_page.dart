import 'package:flutter/material.dart';
import 'package:flutter_paybox/paybox.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  var paybox = Paybox(
    merchantId: 37292,
    secretKey: 'RANoGIbcsDoPYxHY',
  );

  int? paymentId;

  @override
  void initState() {
    paybox.configuration.testMode = true;
    paybox.configuration.currencyCode = 'KZT';
    paybox.configuration.language = Language.ru;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PaymentWidget(
        controller: paybox.controller,
        onPaymentDone: (success) {
          print("Payment success");
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: onCreatePayment,
      ),
    );
  }

  void onCreatePayment() {
    print('Create!');
    paybox
        .createPayment(
      amount: 120,
      userId: "001",
      orderId: "3",
      description: "Just test payment",
    )
        .then((payment) {
      if (payment != null) {
        paymentId = payment.paymentId;
      }
    }).onError((PayboxError error, stackTrace) {
      print(error.description);
    });
  }

  void onAddCard() {
    paybox.addNewCard(userId: "1");
  }

  void onPayFromCard() {
    if (paymentId != null) paybox.payFromCard(paymentId!);
  }
}
