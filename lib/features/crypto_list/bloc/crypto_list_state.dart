part of 'crypto_list_bloc.dart';

abstract class CryptoListState extends Equatable{

}

class CryptoListInitialState extends CryptoListState{
  @override
  List<Object?> get props => [];

}

class CryptoListLoadingState extends CryptoListState{
  @override
  List<Object?> get props => [];

}

class CryptoListLoadedState extends CryptoListState{
  final List<CryptoCoin> coinsList;

  CryptoListLoadedState({required this.coinsList});

  @override
  List<Object?> get props => [coinsList];
}

class CryptoListErrorState extends CryptoListState{
  final Object error;

  CryptoListErrorState({required this.error});

  @override
  List<Object?> get props => [error];
}