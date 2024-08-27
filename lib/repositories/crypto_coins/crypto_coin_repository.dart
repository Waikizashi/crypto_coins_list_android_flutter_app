import 'package:dio/dio.dart';
import 'package:training_app/repositories/crypto_coins/models/models.dart';

import 'abstract_coins_repository.dart';

const currencies = 'BTC,ETH,BNB,SOL,AVAX,XRP,NEAR,DOGE,TON,FLR,LOOKS,PEPE,XMR,RVN,LTC';

class CryptoCoinsRepository implements AbstractCoinsRepository{
  final Dio dio;

  CryptoCoinsRepository({
    required this.dio
  });

  @override
  Future<List<CryptoCoin>> getCoinsList() async{
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
          if (price > 0.01){
            price = double.parse(price.toStringAsFixed(2));
          } else if (price > 0.001 && price < 0.01) {
            price = double.parse(price.toStringAsFixed(3));
          } else if (price > 0.0001 && price < 0.001) {
            price = double.parse(price.toStringAsFixed(4));
          } else if (price > 0.00001 && price < 0.0001) {
            price = double.parse(price.toStringAsFixed(5));
          } else if (price > 0.000001 && price < 0.00001) {
            price = double.parse(price.toStringAsFixed(6));
          } else if (price > 0.0000001 && price < 0.000001) {
            price = double.parse(price.toStringAsFixed(7));
          } else {
            price = double.parse(price.toStringAsFixed(11));
          }
          return CryptoCoin(
            name: e.key,
            priceInUsd: price,
            imgUrl: 'https://www.cryptocompare.com/$imgUrl'
          );
        }
    ).toList();
    return cryptoCoinsList;
  }
}