@JS()
library stripe;

import 'package:flutter/material.dart';
import 'package:js/js.dart';
import 'package:quizjets/export_files.dart';

void redirectToCheckoutMonthly(BuildContext _) async {
  final stripe = Stripe(apiLiveKey);
  stripe.redirectToCheckout(
    CheckoutOptions(
      lineItems: [
        LineItem(price: monthlyLivePriceId, quantity: 1),
      ],
      mode: 'subscription',
      successUrl: 'https://quizjets.netlify.app//#/success',
      cancelUrl: 'https://quizjets.netlify.app/#/cancel',
    ),
  );
}

@JS()
class Stripe {
  external Stripe(String key);

  external redirectToCheckout(CheckoutOptions options);
}

@JS()
@anonymous
class CheckoutOptions {
  external List<LineItem> get lineItems;

  external String get mode;

  external String get successUrl;

  external String get cancelUrl;

  external factory CheckoutOptions({
    List<LineItem> lineItems,
    String mode,
    String successUrl,
    String cancelUrl,
    String sessionId,
  });
}

@JS()
@anonymous
class LineItem {

  external String get price;

  external int get quantity;

  external factory LineItem({
    String price,
    int quantity,
  });

}
