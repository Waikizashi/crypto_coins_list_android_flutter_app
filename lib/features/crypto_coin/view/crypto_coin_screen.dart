import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:training_app/features/crypto_coin/bloc/crypto_coin_bloc.dart';
import 'package:training_app/features/crypto_coin/widgets/coin_info_widget.dart';
import 'package:training_app/repositories/crypto_coins/abstract_coins_repository.dart';


class CryptoCoinScreen extends StatefulWidget {
  const CryptoCoinScreen({super.key});
  @override
  State<StatefulWidget> createState() => _CryptoCoinScreenState();
}

class _CryptoCoinScreenState extends State<CryptoCoinScreen>{
  String? coinName;

  final _cryptoCoinBloc = CryptoCoinBloc(GetIt.I<AbstractCoinsRepository>());

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies(){
    final args = ModalRoute.of(context)?.settings.arguments;
    assert(args != null && args is String, 'You must provide String args');
    coinName = args as String;
    _checkCoinName();
    setState(() {

    });
    super.didChangeDependencies();

  }

  void _checkCoinName({Completer? completer}){
    if(completer != null && coinName != null){
      _cryptoCoinBloc.add(CryptoCoinLoadEvent(completer: completer, coinName: coinName!));
    }
    else if(completer == null && coinName != null){
      _cryptoCoinBloc.add(CryptoCoinLoadEvent(coinName: coinName!));
    }
  }

  @override
  Widget build(BuildContext context){
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            color: Colors.white,
              Icons.arrow_back_ios
          ),
          onPressed: () {
            _cryptoCoinBloc.add(CryptoCoinFlushEvent());
            Navigator.pop(context);
          },
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          final completer = Completer();
          _checkCoinName(completer: completer);
          return completer.future;
        },
        child: BlocBuilder(
            bloc: _cryptoCoinBloc,
            builder: (context, state) {
              if(state is CryptoCoinLoadedState){
                return CoinInfoWidget(coinDetails: state.currentCoin);
              }
              if(state is CryptoCoinErrorState){
                return Center(child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Something went wrong...",
                      style: theme.textTheme.bodyMedium,
                    ),
                    Text(
                      "Please try again later",
                      style: theme.textTheme.bodySmall,
                    ),
                    const SizedBox(height: 30,),
                    OutlinedButton(onPressed: () {
                      _cryptoCoinBloc.add(CryptoCoinMissedCoinNameEvent());
                    }, child: Text(
                        'Try again',
                        style: theme.textTheme.bodyMedium,
                    ))
                  ],
                ));
              }
              return const Center(child: CircularProgressIndicator());
            }
        ),
      ),
    );
  }
}