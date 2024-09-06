import 'package:training_app/repositories/crypto_coins/models/models.dart';


abstract class AbstractCoinsRepository{
  Future<List<CryptoCoin>> getCoinsList();
  Future<CryptoCoinDetails> getCoin({required coinName});
}