import 'package:azercell_mobile_app/auth_db/customer_model.dart';
import 'package:azercell_mobile_app/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'models/amount_model.dart';
import 'models/card_amount_provider.dart';
import 'package:provider/provider.dart';

late Box box;
late Box cardBox;

 Future <void> main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(CustomerModelAdapter());
  box = await Hive.openBox('customerModel');
  cardBox = await Hive.openBox('cardBox');
  runApp(
    ChangeNotifierProvider(
      create: (context) => CardAmountProvider(
        CardAmountModel(firstCardAmount: 10.0, secondCardAmount: 0.0),
      ),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Azercell',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}
