import 'package:crypto_coinmarketcap/models/fetch_coin_models/usd.dart';

class Quote {
  Quote({
    required this.usd,
  });

  Usd usd;

  factory Quote.fromJson(Map<String, dynamic> json) => Quote(
    usd: Usd.fromJson(json["USD"]),
  );

  Map<String, dynamic> toJson() => {
    "USD": usd.toJson(),
  };
}