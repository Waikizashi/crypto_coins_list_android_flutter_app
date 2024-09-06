import 'package:equatable/equatable.dart';

class CryptoCoinDetails extends Equatable{
  final String name;
  final String imgUrl;
  final double priceInUsd;
  final double highDayPrice;
  final double lowDayPrice;

  const CryptoCoinDetails({
    required this.name,
    required this.imgUrl,
    required this.priceInUsd,
    required this.highDayPrice,
    required this.lowDayPrice
  });

  @override
  List<Object?> get props => [name, priceInUsd, imgUrl, highDayPrice, lowDayPrice];
}