
import 'package:training_app/features/crypto_coin/crypto_coin.dart';
import 'package:training_app/features/crypto_list/crypto_list.dart';

final routes = {
  '/': (context) => const CryptoListScreen(),
  '/coin': (context) => const CryptoCoinScreen()
};