part of 'crypto_coin_bloc.dart';

abstract class CryptoCoinState extends Equatable{

}

class CryptoCoinInitialState extends CryptoCoinState{
  @override
  List<Object?> get props => [];

}

class CryptoCoinLoadingState extends CryptoCoinState{
  @override
  List<Object?> get props => [];

}

class CryptoCoinLoadedState extends CryptoCoinState{
  final CryptoCoinDetails currentCoin;

  CryptoCoinLoadedState({required this.currentCoin});

  @override
  List<Object?> get props => [currentCoin];
}

class CryptoCoinErrorState extends CryptoCoinState{
  final Object error;

  CryptoCoinErrorState({required this.error});

  @override
  List<Object?> get props => [error];
}