import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_app/repositories/crypto_coins/abstract_coins_repository.dart';
import 'package:training_app/repositories/crypto_coins/models/crypto_coin_details.dart';

part 'crypto_coin_state.dart';
part 'crypto_coin_event.dart';

class CryptoCoinBloc extends Bloc<CryptoCoinEvent, CryptoCoinState> {
  CryptoCoinBloc(this.coinsRepository) : super(CryptoCoinInitialState()) {
    on<CryptoCoinEvent>((event, emit) {

    });
    on<CryptoCoinLoadEvent>((event, emit) async {
      try{
        if(state is! CryptoCoinLoadedState){
          emit(CryptoCoinLoadingState());
        }
        final currentCoin = await coinsRepository.getCoin(coinName: event.coinName);
        emit(CryptoCoinLoadedState(currentCoin: currentCoin));
      } catch(error, state){
        GetIt.I<Talker>().handle(error, state);
        emit(CryptoCoinErrorState(error: error));
      } finally{
        event.completer?.complete();
      }
    });
    on<CryptoCoinMissedCoinNameEvent>((event, emit) async {
      emit(CryptoCoinErrorState(error: 'Coin missed'));
    });
    on<CryptoCoinFlushEvent>((event, emit) async {
      emit(CryptoCoinInitialState());
    });
  }

  final AbstractCoinsRepository coinsRepository;
}