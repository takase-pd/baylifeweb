@JS()
library stripe;

import 'package:js/js.dart';

const apiKey =
    'pk_test_51ITgUwGe7bJktEzT6F1RcOf7aH2lrjK1jlIne0tpyoWXbdxAa0GpTBjyJp1CIn4EElYQFA7T39wLpRzdBlBCj1zg00TPUJYvsl';

void redirectToCheckout(String sessionId) async {
  final stripe = Stripe(apiKey);
  stripe.redirectToCheckout(CheckoutOptions(
    sessionId: sessionId,
  ));
}

@JS()
class Stripe {
  external Stripe(String key);
  external redirectToCheckout(CheckoutOptions options);
}

@JS()
@anonymous
class CheckoutOptions {
  external factory CheckoutOptions({
    String sessionId,
  });
}
