import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_app/repositories/crypto_coins/abstract_coins_repository.dart';
import 'package:training_app/repositories/crypto_coins/models/crypto_coin.dart';

part 'crypto_list_state.dart';
part 'crypto_list_event.dart';

class CryptoListBloc extends Bloc<CryptoListEvent, CryptoListState> {
  CryptoListBloc(this.coinsRepository) : super(CryptoListInitialState()) {
    on<CryptoListEvent>((event, emit) {

    });
    on<CryptoListLoadEvent>((event, emit) async {
      try{
        if(state is! CryptoListLoadedState){
          emit(CryptoListLoadingState());
        }
        final coinsList = await coinsRepository.getCoinsList();
        emit(CryptoListLoadedState(coinsList: coinsList));
      } catch(error, state){
        GetIt.I<Talker>().handle(error, state);
        emit(CryptoListErrorState(error: error));
      } finally{
        event.completer?.complete();
      }
    }
    );
  }

  final AbstractCoinsRepository coinsRepository;
}