part of 'crypto_coin_bloc.dart';

abstract class CryptoCoinEvent extends Equatable{

}

class CryptoCoinLoadEvent extends CryptoCoinEvent{
  final String coinName;
  final Completer? completer;

  CryptoCoinLoadEvent({this.completer, required this.coinName});

  @override
  List<Object?> get props => [completer, coinName];
}
class CryptoCoinMissedCoinNameEvent extends CryptoCoinEvent{

  @override
  List<Object?> get props => [];
}

class CryptoCoinFlushEvent extends CryptoCoinEvent{

  @override
  List<Object?> get props => [];
}
