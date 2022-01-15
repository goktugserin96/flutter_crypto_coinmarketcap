import 'package:crypto_coinmarketcap/models/fetch_coin_models/big_data.dart';
import 'package:crypto_coinmarketcap/models/fetch_coin_models/data_model.dart';
import 'package:flutter/cupertino.dart';

class ListViewWidget extends StatelessWidget {
  final CryptoInfo? cryptoInfo;
  const ListViewWidget({
    Key? key,
    required this.cryptoInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<DataModel> dataList = [];
    return Center(
      child: ListView.builder(
        itemCount: dataList.length,
        itemBuilder: (context, index) {
          DataModel coin = cryptoInfo!.data[index];

          return Container(child: Text('${coin.quote.usd.price}'));
        },
      ),
    );
  }
}
