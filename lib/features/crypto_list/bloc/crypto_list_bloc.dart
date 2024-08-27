import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_app/repositories/crypto_coins/abstract_coins_repository.dart';
import 'package:training_app/repositories/crypto_coins/models/crypto_coin_model.dart';

part 'crypto_lilst_state.dart';
part 'crypto_list_event.dart';

class CryptoListBloc extends Bloc<CryptoListEvent, CryptoListState> {
  CryptoListBloc(this.coinsRepository) : super(CryptoListInitialState()) {
    on<CryptoListEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<LoadCryptoListEvent>((event, emit) async {
      try{
        final coinsList = await coinsRepository.getCoinsList();
        emit(CryptoListLoadedState(coinList: coinsList));
      } catch(e){
        emit(CryptoListErrorState(error: e));
      }
    });
  }

  final AbstractCoinsRepository coinsRepository;
}