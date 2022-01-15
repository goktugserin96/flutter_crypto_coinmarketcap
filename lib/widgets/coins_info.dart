import 'package:crypto_coinmarketcap/models/fetch_coin_models/data_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CoinsInfo extends StatefulWidget {
  const CoinsInfo({Key? key, this.newValue2, required this.coinsInfo})
      : super(key: key);

  final bool? newValue2;
  final List<DataModel> coinsInfo;
  @override
  State<CoinsInfo> createState() => _CoinsInfoState();
}

class _CoinsInfoState extends State<CoinsInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: widget.coinsInfo.map((coin) {
            return Container(
              child: Column(
                children: [
                  Text('${coin.cmcRank}'),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  // Text('${coin.tags}'),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
