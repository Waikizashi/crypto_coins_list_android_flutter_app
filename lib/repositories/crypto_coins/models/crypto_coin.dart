import 'package:equatable/equatable.dart';

class CryptoCoin extends Equatable{
  final String name;
  final String imgUrl;
  final double priceInUsd;

  const CryptoCoin({
    required this.name,
    required this.imgUrl,
    required this.priceInUsd
  });

  @override
  List<Object?> get props => [name, priceInUsd, imgUrl];
}