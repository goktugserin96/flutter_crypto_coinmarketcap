import 'package:crypto_coinmarketcap/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'conrollers/material_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);

  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => MaterialProvider()),
    ], child: MyAppWithMaterial());
  }
}

class MyAppWithMaterial extends StatefulWidget {
  const MyAppWithMaterial({Key? key}) : super(key: key);

  @override
  State<MyAppWithMaterial> createState() => _MyAppWithMaterialState();
}

class _MyAppWithMaterialState extends State<MyAppWithMaterial> {
  @override
  Widget build(BuildContext context) {
    MaterialProvider materialProvider = Provider.of<MaterialProvider>(context);

    return MaterialApp(
      theme: materialProvider.selectedThemeData,
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
