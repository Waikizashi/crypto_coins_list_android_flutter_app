import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:training_app/repositories/crypto_coins/abstract_coins_repository.dart';
import 'package:training_app/repositories/crypto_coins/crypto_coin_repository.dart';

import 'crypto_coins_list_app.dart';

void main() {
  GetIt.I.registerLazySingleton<AbstractCoinsRepository>(
          () => CryptoCoinsRepository(dio: Dio())
  );
  runApp(const CryptoCoinsListApp());
}
