import 'package:flutter/material.dart';
import 'package:stpipe_flutter/app/view/app.dart';
import 'package:stpipe_flutter/bootstrap.dart';
import 'package:stpipe_flutter/services/payment_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Stripe
  await PaymentService.initializeStripe();
  await bootstrap(() => const App());
}
