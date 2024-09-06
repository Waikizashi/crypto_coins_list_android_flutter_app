import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:training_app/features/utils/utils.dart';
import 'package:training_app/repositories/crypto_coins/models/models.dart';

import 'abstract_coins_repository.dart';

const currencies = 'BTC,ETH,BNB,SOL,AVAX,XRP,NEAR,DOGE,TONCOIN,FLR,LOOKS,PEPE,XMR,RVN,LTC';

class CryptoCoinsRepository implements AbstractCoinsRepository{
  final Dio dio;

  CryptoCoinsRepository({
    required this.dio
  });

  @override
  Future<List<CryptoCoin>> getCoinsList() async {
    final response = await dio.get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=$currencies&tsyms=USD'
    );
    final data =  response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final cryptoCoinsList = dataRaw.entries
        .map((e) {
          final usdData = (e.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;
          var price = (usdData['PRICE'] as double);
          final imgUrl = usdData['IMAGEURL'];
          return CryptoCoin(
            name: e.key,
            priceInUsd: cutPrice(price: price),
            imgUrl: 'https://www.cryptocompare.com$imgUrl'
          );
        }
    ).toList();
    return cryptoCoinsList;
  }

  @override
  Future<CryptoCoinDetails> getCoin({required coinName}) async {

    final response = await dio.get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=$coinName&tsyms=USD'
    );
    final coinData = response.data['RAW']['$coinName']['USD'] as Map<String, dynamic>;
    final price = cutPrice(price: coinData['PRICE']) ;
    final imgUrl = 'https://www.cryptocompare.com${coinData['IMAGEURL']}';
    final highDayPrice = cutPrice(price: coinData['HIGH24HOUR']);
    final lowDayPrice = cutPrice(price: coinData['LOW24HOUR']);
    return CryptoCoinDetails(
        name: coinName,
        priceInUsd: price,
        imgUrl: imgUrl,
        highDayPrice: highDayPrice,
        lowDayPrice: lowDayPrice
    );
  }

}