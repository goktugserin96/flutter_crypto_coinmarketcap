// // To parse this JSON data, do
// //
// //     final cryptoInfo = cryptoInfoFromJson(jsonString);
//
// import 'dart:convert';
//
// import 'fetch_coin_models/data_model.dart';
//
// CryptoInfo cryptoInfoFromJson(String str) =>
//     CryptoInfo.fromJson(json.decode(str));
//
// String cryptoInfoToJson(CryptoInfo data) => json.encode(data.toJson());
//
// enum Name { ETHEREUM, BINANCE_CHAIN_BEP2, BINANCE_SMART_CHAIN_BEP20, TRON10 }
//
// final nameValues = EnumValues({
//   "Binance Chain (BEP2)": Name.BINANCE_CHAIN_BEP2,
//   "Binance Smart Chain (BEP20)": Name.BINANCE_SMART_CHAIN_BEP20,
//   "Ethereum": Name.ETHEREUM,
//   "Tron10": Name.TRON10
// });
//
// enum Slug { ETHEREUM, BINANCE_COIN, TRON }
//
// final slugValues = EnumValues({
//   "binance-coin": Slug.BINANCE_COIN,
//   "ethereum": Slug.ETHEREUM,
//   "tron": Slug.TRON
// });
//
// enum Symbol { ETH, BNB, TRX }
//
// final symbolValues =
//     EnumValues({"BNB": Symbol.BNB, "ETH": Symbol.ETH, "TRX": Symbol.TRX});
//
// class EnumValues<T> {
//   Map<String, T> map;
//   Map<T, String> reverseMap;
//
//   EnumValues(this.map);
//
//   Map<T, String> get reverse {
//     if (reverseMap == null) {
//       reverseMap = map.map((k, v) => new MapEntry(v, k));
//     }
//     return reverseMap;
//   }
// }
