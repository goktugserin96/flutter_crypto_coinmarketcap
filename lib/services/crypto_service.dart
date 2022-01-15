import 'package:crypto_coinmarketcap/models/fetch_coin_models/big_data.dart';
import 'package:http/http.dart' as http;

class CryptoDataService {
  CryptoDataService._internal();
  static CryptoDataService _singleton = CryptoDataService._internal();

  factory CryptoDataService() {
    return _singleton;
  }
  static Stream<CryptoInfo> getPrice() =>
      Stream.periodic(Duration(seconds: 5)).asyncMap((_) => getCryptoData());

  static Future<CryptoInfo> getCryptoData() async {
    // normal data
    // final response = await http.get(
    //     Uri.parse(
    //         'https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest'),
    //     headers: {"X-CMC_PRO_API_KEY": "9140dced-24f5-46d6-87dd-4cc7ec06b709"});
    //
    // if (response.statusCode == 200) {
    //   final responseJson = cryptoInfoFromJson(response.body);
    //   return responseJson; //bigdata liste olan
    // } else {
    //   return Future.error(
    //       "This is the error2", StackTrace.fromString("This is its trace"));
    // }

    final response = await http.get(
        Uri.parse(
            'https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest'),
        headers: {"X-CMC_PRO_API_KEY": "9140dced-24f5-46d6-87dd-4cc7ec06b709"});

    if (response.statusCode == 200) {
      return cryptoInfoFromJson(response.body); //bigdata liste olan
    } else {
      return Future.error(
          "This is the error2", StackTrace.fromString("This is its trace"));
    }
  }
}
