import 'dart:convert';

import 'package:crypto_coinmarketcap/models/fetch_coin_models/data_model.dart';
import 'package:crypto_coinmarketcap/models/fetch_coin_models/status.dart';

CryptoInfo cryptoInfoFromJson(String str) =>
    CryptoInfo.fromJson(json.decode(str));

String cryptoInfoToJson(CryptoInfo data) => json.encode(data.toJson());

class CryptoInfo {
  CryptoInfo({
    required this.status,
    required this.data,
  });

  Status status;
  List<DataModel> data;

  factory CryptoInfo.fromJson(Map<String, dynamic> json) => CryptoInfo(
        status: Status.fromJson(json["status"]),
        data: List<DataModel>.from(
            json["data"].map((x) => DataModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status.toJson(),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}
