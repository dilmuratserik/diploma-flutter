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
    secretKey: 'pzuQqssWpoKjVh2a',
  );

  int? paymentId;

  @override
  void initState() {
    paybox.configuration.testMode = true;
    paybox.configuration.currencyCode = 'KZT';
    paybox.configuration.language = Language.ru;
    onCreatePayment();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PaymentWidget(
      controller: paybox.controller,
      onPaymentDone: (success) {
        print("Payment success");
      },
    );
  }

  void onCreatePayment() {
    print('Create!');
    paybox
        .createPayment(
      amount: 1,
      userId: "001",
      orderId: "1",
      description: "Just test payment",
    )
        .then((payment) {
      if (payment != null) {
        paymentId = payment.paymentId;
      }
    }).onError((error, stackTrace) {
      // Handle PayboxError
    });
  }

  void onAddCard() {
    paybox.addNewCard(userId: "1");
  }

  void onPayFromCard() {
    if (paymentId != null) paybox.payFromCard(paymentId!);
  }
}
