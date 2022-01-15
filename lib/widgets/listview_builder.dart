import 'package:cached_network_image/cached_network_image.dart';
import 'package:crypto_coinmarketcap/models/fetch_coin_models/data_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CoinsInfoWidget extends StatelessWidget {
  const CoinsInfoWidget({
    Key? key,
    required this.isFiltering,
    required this.newList_Filtered,
    required this.coinsInfo,
  }) : super(key: key);

  final bool isFiltering;
  final List<DataModel> newList_Filtered;
  final List<DataModel> coinsInfo;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: isFiltering ? newList_Filtered.length : coinsInfo.length,
        itemBuilder: (context, index) {
          DataModel coin =
              isFiltering ? newList_Filtered[index] : coinsInfo[index];

          return Container(
            padding: const EdgeInsets.only(left: 16.0, right: 16),
            height: 50.0,

            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  child: CachedNetworkImage(
                    imageUrl:
                        ("https://raw.githubusercontent.com/spothq/cryptocurrency-icons/master/128/color/${coin.symbol}.png")
                            .toLowerCase(),
                    height: 30,
                    width: 30,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => SvgPicture.asset(
                      'assets/icons/dollar.svg',
                      width: 30,
                      height: 30,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(child: Text(coin.symbol)),
                Expanded(
                  flex: 2,
                  child: Text(
                    '\$' + coin.quote.usd.price.toStringAsFixed(2),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  color: coin.quote.usd.percentChange24H < 0
                      ? Colors.red
                      : Colors.green,
                  width: 80,
                  height: 35,
                  child: Center(
                    child: Text(
                      coin.quote.usd.percentChange24H.toStringAsFixed(2),
                      textAlign: TextAlign.right,
                    ),
                  ),
                )
              ],
            ),

            // SizedBox(
            //   width: 40,
            // ),
            // Text('\$' + coin.quote.usd.price.toStringAsFixed(2)),
            //
          );
        });
  }
}
