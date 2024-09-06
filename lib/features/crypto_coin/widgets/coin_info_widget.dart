import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:training_app/repositories/crypto_coins/models/crypto_coin_details.dart';

class CoinInfoWidget extends StatefulWidget {
  final CryptoCoinDetails coinDetails;
  const CoinInfoWidget({super.key, required this.coinDetails});

  @override
  State<CoinInfoWidget> createState() => _CoinInfoWidgetState();
}

class _CoinInfoWidgetState extends State<CoinInfoWidget> {

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SingleChildScrollView (
      child: Container(
        margin: theme.cardTheme.margin,
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Image.network(
                widget.coinDetails.imgUrl,
                width: 100,
                height: 100,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8.0),
              child: Text(
                  style: theme.textTheme.labelLarge,
                  widget.coinDetails.name
              ),
            ),
            Container(
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.fromLTRB(0, 8.0, 0, 8.0),
                decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                    child: Text(
                        style: theme.textTheme.labelMedium,
                        '${widget.coinDetails.priceInUsd} \$'
                    )
                )
            ),
            Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        style: theme.textTheme.bodyMedium,
                        'Low 24 hour',
                      ),
                      Text(
                          style: theme.textTheme.bodyMedium,
                          'High 24 hour'
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                          style: theme.textTheme.bodyMedium,
                          '${widget.coinDetails.lowDayPrice} \$'
                      ),
                      Text(
                          style: theme.textTheme.bodyMedium,
                          '${widget.coinDetails.highDayPrice} \$'
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
