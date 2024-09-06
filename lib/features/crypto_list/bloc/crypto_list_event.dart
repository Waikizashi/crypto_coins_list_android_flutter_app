part of 'crypto_list_bloc.dart';

abstract class CryptoListEvent extends Equatable{

}

class CryptoListLoadEvent extends CryptoListEvent{
  final Completer? completer;

  CryptoListLoadEvent({this.completer});

  @override
  List<Object?> get props => [completer];
}
