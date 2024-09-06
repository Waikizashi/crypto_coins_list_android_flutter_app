
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:training_app/router/router.dart';
import 'package:training_app/ui/theme/theme.dart';

class CryptoCoinsListApp extends StatelessWidget {
  const CryptoCoinsListApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto currencies',
      routes: routes,
      theme: darkTheme,
      navigatorObservers: [
        TalkerRouteObserver(GetIt.I<Talker>())
      ],
    );
  }
}