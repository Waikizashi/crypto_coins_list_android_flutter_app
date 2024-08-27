part of 'crypto_list_bloc.dart';

class CryptoListState {

}

class CryptoListInitialState extends CryptoListState{

}

class CryptoListLoadingState extends CryptoListState{

}

class CryptoListLoadedState extends CryptoListState{
  final List<CryptoCoin> coinList;

  CryptoListLoadedState({required this.coinList});
}

class CryptoListErrorState extends CryptoListState{
  final Object error;

  CryptoListErrorState({required this.error});
}