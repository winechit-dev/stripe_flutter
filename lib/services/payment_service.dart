import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:stpipe_flutter/config/stripe_config.dart';

class PaymentService {
  static Future<void> initializeStripe() async {
    Stripe.publishableKey = StripeConfig.publishableKey;
  }

  static Future<Map<String, dynamic>> createPaymentIntent({
    required String amount,
    required String currency,
  }) async {
    try {
      final dio = Dio();
      final response = await dio.post<Map<String, dynamic>>(
        StripeConfig.apiUrl,
        options: Options(
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
            'Authorization': 'Bearer ${StripeConfig.secretKey}',
          },
        ),
        data: {
          'amount': amount,
          'currency': currency,
        },
      );

      if (response.data == null) {
        throw Exception('Payment intent response data is null');
      }

      final responseData = Map<String, dynamic>.from(response.data! as Map);
      return responseData;
    } catch (e) {
      throw Exception('Failed to create payment intent: $e');
    }
  }

  static Future<void> makePayment({
    required double amount,
    required String currency,
  }) async {
    try {
      // Create payment intent
      final paymentIntent = await createPaymentIntent(
        amount: _calculateAmount(amount),
        currency: currency,
      );

      // Initialize payment sheet
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntent['client_secret'] as String,
          merchantDisplayName: 'Your App Name',
          style: ThemeMode.system,
        ),
      );

      // Present payment sheet
      await Stripe.instance.presentPaymentSheet();
    } catch (e) {
      throw Exception('Payment failed: $e');
    }
  }

  static String _calculateAmount(double amount) {
    // Ensure correct rounding and handle negative/zero amounts
    final smallestUnit =
        (amount * 100).round().clamp(0, double.maxFinite.toInt());
    return smallestUnit.toString();
  }
}
