class StripeConfig {
  // Test publishable key - Replace with your test publishable key from Stripe Dashboard
  static const String publishableKey = 'your_publishableKey';
  
  // Test secret key - Replace with your test secret key from Stripe Dashboard
  static const String secretKey = 'your_secretKey';
  
  // Your backend API URL for creating payment intents
  static const String apiUrl = 'https://api.stripe.com/v1/payment_intents';
} 
