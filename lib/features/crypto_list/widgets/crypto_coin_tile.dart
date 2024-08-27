
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:training_app/repositories/crypto_coins/models/crypto_coin_model.dart';

class CryptoCoinTile extends StatelessWidget {
  const CryptoCoinTile({
    super.key,
    required this.coin,
  });

  final CryptoCoin coin;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final btcLogo = Image.network(coin.imgUrl, height: 40, width: 40);
    return ListTile(
      leading: btcLogo,
      trailing: const Icon(
          Icons.arrow_forward_ios
      ),
      title: Text(
        coin.name,
        style: theme.textTheme.bodyLarge,),
      subtitle: Text(
          '${coin.priceInUsd} \$',
          style: theme.textTheme.labelSmall),
      onTap: () {
        Navigator.of(context).pushNamed(
            '/coin',
            arguments: coin.name);
      },
    );
  }
}