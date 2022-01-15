// // import 'package:animated_splash_screen/animated_splash_screen.dart';
// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';
// // import 'package:page_transition/page_transition.dart';
// // import 'package:provider/provider.dart';
// // import 'package:trying_something_2/controllers/provider_class.dart';
// // import 'package:trying_something_2/data/models/ProductFromAPI.dart';
// // import 'package:trying_something_2/services/product_service.dart';
// //
// // import 'body.dart';
// //
// // class SplashHome extends StatefulWidget {
// //   @override
// //   _SplashHomeState createState() => _SplashHomeState();
// // }
// //
// // class _SplashHomeState extends State<SplashHome> {
// //   List<ProductFromApi> productData = [];
// //
// //   //
// //   @override
// //   void initState() {
// //     ProductDataService.getProductData().then((value) {
// //       setState(() {
// //         productData = value!;
// //       });
// //     });
// //     super.initState();
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     MagazaShopping magazaShopping = Provider.of<MagazaShopping>(context);
// //     return ListView.builder(
// //       itemCount: productData.length,
// //       itemBuilder: (context, index) {
// //         ProductFromApi productDataList = productData[index];
// //         magazaShopping.magazaSepetEkle(productDataList);
// //
// //         print(magazaShopping.magaza);
// //         return AnimatedSplashScreen(
// //             duration: 6000,
// //             splash: Icons.home,
// //             nextScreen: Home(),
// //             splashTransition: SplashTransition.fadeTransition,
// //             pageTransitionType: PageTransitionType.scale,
// //             backgroundColor: Colors.blue);
// //       },
// //     );
// //   }
// // }
// import 'package:crypto_coinmarketcap/models/fetch_coin_models/big_data.dart';
// import 'package:crypto_coinmarketcap/models/fetch_coin_models/data_model.dart';
// import 'package:crypto_coinmarketcap/screens/first_screen.dart';
// import 'package:crypto_coinmarketcap/screens/home_page.dart';
// import 'package:crypto_coinmarketcap/services/crypto_service.dart';
// import 'package:crypto_coinmarketcap/widgets/listview_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:splash_screen_view/SplashScreenView.dart';
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({Key? key}) : super(key: key);
//
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   var coinIconUrl =
//       "https://github.com/spothq/cryptocurrency-icons/tree/master/128/color";
//
//   //
//
//   @override
//   Widget build(BuildContext context) {
//     // ProviderClass provider = Provider.of<ProviderClass>(context);
//     return StreamBuilder<CryptoInfo>(
//       stream: CryptoDataService.getPrice(),
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           //  List<DataModel> cryptoList = snapshot.data!.data;
//           CryptoInfo? coinsInfo = snapshot.data;
//
//           return ListView.builder(
//             itemCount: dataList.length,
//             itemBuilder: (context, index) {
//               DataModel coin = cryptoInfo!.data[index];
//
//               return Container(child: Text('${coin.quote.usd.price}'));
//             },
//           );
//         } else if (snapshot.hasError) {
//           return Text('${snapshot.error}');
//         }
//
//         return Center(child: CircularProgressIndicator(),);
//       }
//
//     );
//
//   }
// }
//
