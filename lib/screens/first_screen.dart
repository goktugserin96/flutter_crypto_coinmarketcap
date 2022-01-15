import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:crypto_coinmarketcap/conrollers/material_provider.dart';
import 'package:crypto_coinmarketcap/models/fetch_coin_models/big_data.dart';
import 'package:crypto_coinmarketcap/models/fetch_coin_models/data_model.dart';
import 'package:crypto_coinmarketcap/services/crypto_service.dart';
import 'package:crypto_coinmarketcap/widgets/coins_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({
    Key? key,
  }) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  var coinIconUrl =
      "https://github.com/spothq/cryptocurrency-icons/tree/master/128/color";

  bool isFiltering = false;
  List<DataModel> newList_Filtered = []; // filtrelenmiş liste
  List<DataModel> coinsInfo = [];

  int? sortColumnIndex;

  bool isAscending = false;

  late Stream<CryptoInfo> streamCrypto;
  final column = ["Name", "Price", "24H"];
  @override
  void initState() {
    streamCrypto = CryptoDataService.getPrice();

    super.initState();
  }

  // @override
  // void dispose() {
  //   aa.sink.addStream(stream);
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    MaterialProvider themeDataButton = Provider.of<MaterialProvider>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              themeDataButton.toggleStatus();
            },
            icon: Icon(
              Icons.lightbulb,
              color: Colors.orange,
            )),
        actions: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.fromLTRB(50, 10, 20, 10),
            child: TextField(
              onChanged: (query) {
                if (query.isNotEmpty) {
                  isFiltering = true;

                  ///eğer fullListin içindekiyle query uyuşuyorsa bunlarla yeni bir liste oluşturur(.where ile) bu filteredList e eşittir.
                  setState(() {
                    newList_Filtered = coinsInfo
                        .where((product) => product.symbol
                            .toLowerCase()
                            .contains(query.toLowerCase()))
                        .toList();
                  });
                }

                /// eğer query nin içi boş ise isFilterin false olur bu da alltaki işlemleri etkileyecektir.
                else {
                  WidgetsBinding.instance!.focusManager.primaryFocus!.unfocus();
                  setState(() {
                    isFiltering = false;
                  });
                }
              },
              decoration: InputDecoration(
                fillColor:
                    themeDataButton.isThemeData ? Colors.black12 : Colors.white,
                filled: true,
                contentPadding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                prefixIcon: Icon(Icons.search),
                hintText: "Enter: Coin Name ",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                ),
              ),
            ),
          )),
        ],
        centerTitle: true,
      ),
      body: StreamBuilder<CryptoInfo>(
          stream: streamCrypto,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              //  List<DataModel> cryptoList = snapshot.data!.data;

              coinsInfo = snapshot.data!.data;

              return SingleChildScrollView(
                child: DataTable(
                  showCheckboxColumn: false,
                  sortAscending: isAscending,
                  sortColumnIndex: sortColumnIndex,
                  columns: getColumns(column),
                  rows: isFiltering
                      ? getRows(newList_Filtered)
                      : getRows(coinsInfo),
                ),
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }

  List<DataColumn> getColumns(List<String> column) => column
      .map((String column) => DataColumn(onSort: onSort, label: Text(column)))
      .toList();

  List<DataRow> getRows(List<DataModel> coinsInfo) =>
      coinsInfo.map((DataModel data) {
        return DataRow(
          onSelectChanged: (newValue) {
            print('row 1 pressed');

            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CoinsInfo(
                          newValue2: newValue,
                          coinsInfo: coinsInfo,
                        )));
          },
          cells: <DataCell>[
            DataCell(Row(
              children: [
                Container(
                  child: CachedNetworkImage(
                    imageUrl:
                        ("https://raw.githubusercontent.com/spothq/cryptocurrency-icons/master/128/color/${data.symbol}.png")
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
                  width: 5,
                ),
                Expanded(child: Text('${data.name}')),
              ],
            )),
            DataCell(Text('${data.quote.usd.price.toStringAsFixed(2)}')),
            DataCell(Center(
              child: Text(
                "${data.quote.usd.percentChange24H.toStringAsFixed(2)}%",
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: data.quote.usd.percentChange24H < 0
                      ? Colors.red
                      : Colors.green,
                ),
              ),
            )),
          ],
        );
      }).toList();

  void onSort(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      coinsInfo.sort((coin1, coin2) => ascending
          ? coin1.name.compareTo(coin2.name)
          : coin2.name.compareTo(coin1.name));
    }
    if (columnIndex == 1) {
      coinsInfo.sort((coin1, coin2) => ascending
          ? coin1.quote.usd.price.compareTo(coin2.quote.usd.price)
          : coin2.quote.usd.price.compareTo(coin1.quote.usd.price));
    }
    if (columnIndex == 2) {
      coinsInfo.sort((coin1, coin2) => ascending
          ? coin1.quote.usd.percentChange24H
              .compareTo(coin2.quote.usd.percentChange24H)
          : coin2.quote.usd.percentChange24H
              .compareTo(coin1.quote.usd.percentChange24H));
    }

    setState(() {
      this.sortColumnIndex = columnIndex;
      this.isAscending = ascending;
    });
  }
}

// Expanded(
//   child: CoinsInfoWidget(
//       isFiltering: isFiltering,
//       newList_Filtered: newList_Filtered,
//       coinsInfo: coinsInfo),
// ),
