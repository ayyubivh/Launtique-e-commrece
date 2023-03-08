// import 'dart:math';
// import 'package:razorpay_flutter/razorpay_flutter.dart';

// var _razorpay = Razorpay();
// Future<void> pay(amount, id) async {
//   Map<String, dynamic> option = {
//     'key': 'rzp_test_CtSpqjBQZ9qG1H',
//     'account': '100',
//     'order': '${Random().nextInt(100)}',
//     'description': 'For Demo',
//     'timeout': 60, // in seconds
//     'prefill': {'contact': '9645686644', 'email': 'unofficial00345@gmail.com'}
//   };
//   try {
//     _razorpay.open(option);
//     _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
//     _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
//   } catch (e) {}
// }

