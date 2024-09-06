import 'dart:async';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:training_app/repositories/crypto_coins/abstract_coins_repository.dart';
import 'package:training_app/repositories/crypto_coins/crypto_coin_repository.dart';

import 'crypto_coins_list_app.dart';

void main() {
  final talker = TalkerFlutter.init();
  final dio = Dio();

  Bloc.observer = TalkerBlocObserver(
    talker: talker,
    settings: TalkerBlocLoggerSettings(
      printEventFullData: false,
      printStateFullData: false,
    )
  );

  dio.interceptors.add(
    TalkerDioLogger(
      talker: talker,
      settings: const TalkerDioLoggerSettings(
        printResponseData: false
      )
    ),
  );

  GetIt.I.registerSingleton(talker);
  GetIt.I<Talker>().info('Talker started');
  GetIt.I.registerLazySingleton<AbstractCoinsRepository>(
          () => CryptoCoinsRepository(dio: dio)
  );

  FlutterError.onError = (details) => GetIt.I<Talker>().handle(details.exception, details.stack);
  PlatformDispatcher.instance.onError = (exception, stack) {
    GetIt.I<Talker>().handle(exception, stack);
    return true;
  };

  runZonedGuarded(
          () => runApp(const CryptoCoinsListApp()),
          (error, stackTrace) => GetIt.I<Talker>().handle(error, stackTrace)
  );
}
