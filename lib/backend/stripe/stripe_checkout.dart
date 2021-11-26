@JS()
library stripe;

import 'package:js/js.dart';

const apiKey =
    'pk_live_51ITgUwGe7bJktEzTV9JKjfxalYAeUKUwp6TmSEjVeAq2C72Jfl4b8THbkFVCvzwXSoa9fM7DuhgbHeWf4mcFLc3300emg1a6e4';

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
