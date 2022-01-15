import 'package:crypto_coinmarketcap/models/fetch_coin_models/quote.dart';

class DataModel {
  DataModel({
    required this.id,
    required this.name,
    required this.symbol,
    required this.slug,
    required this.numMarketPairs,
    required this.dateAdded,
    required this.tags,
    required this.maxSupply,
    required this.circulatingSupply,
    required this.totalSupply,
    required this.cmcRank,
    required this.lastUpdated,
    required this.quote,
  });

  int id;
  String name;
  String symbol;
  String slug;
  int numMarketPairs;
  DateTime dateAdded;
  List<dynamic> tags;
  int maxSupply;
  double circulatingSupply;
  double totalSupply;

  int cmcRank;
  DateTime lastUpdated;
  Quote quote;

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        id: json["id"],
        name: json["name"],
        symbol: json["symbol"],
        slug: json["slug"],
        numMarketPairs: json["num_market_pairs"],
        dateAdded: DateTime.parse(json["date_added"]),
        tags: json["tags"],
        maxSupply: json["max_supply"] == null ? 0 : json["max_supply"],
        circulatingSupply: json["circulating_supply"].toDouble(),
        totalSupply: json["total_supply"].toDouble(),
        cmcRank: json["cmc_rank"],
        lastUpdated: DateTime.parse(json["last_updated"]),
        quote: Quote.fromJson(json["quote"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "symbol": symbol,
        "slug": slug,
        "num_market_pairs": numMarketPairs,
        "date_added": dateAdded.toIso8601String(),
        "tags": tags,
        "max_supply": maxSupply == null ? null : maxSupply,
        "circulating_supply": circulatingSupply,
        "total_supply": totalSupply,
        "cmc_rank": cmcRank,
        "last_updated": lastUpdated.toIso8601String(),
        "quote": quote.toJson(),
      };
}
