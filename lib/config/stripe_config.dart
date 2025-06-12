class StripeConfig {
  // Test publishable key - Replace with your test publishable key from Stripe Dashboard
  static const String publishableKey = 'pk_test_51RY1ejFEghzqLZCUDP9eJu59FSV0MMJZg0Cl9gZ3VrxBrTDCDzD7clWkO1MWoGddhG6UYwAqOEyje67ULUUZkh4F00Xaqmdd1F';
  
  // Test secret key - Replace with your test secret key from Stripe Dashboard
  static const String secretKey = 'sk_test_51RY1ejFEghzqLZCUclSxAPGkxaGT50WIL5sK7sfTCQ9rgcX6rBJqP6DBobH1IEHccFHcRqqpGTlUphQeESTdxqQS00kBtbE9mg';
  
  // Your backend API URL for creating payment intents
  static const String apiUrl = 'https://api.stripe.com/v1/payment_intents';
} 