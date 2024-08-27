import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:training_app/features/crypto_list/bloc/crypto_list_bloc.dart';
import 'package:training_app/features/crypto_list/widgets/widgets.dart';
import 'package:training_app/repositories/crypto_coins/abstract_coins_repository.dart';
import 'package:training_app/repositories/crypto_coins/models/models.dart';



class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});
  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {

  final _cryptoListBloc = CryptoListBloc(GetIt.I<AbstractCoinsRepository>());

  @override
  void initState(){
    _cryptoListBloc.add(LoadCryptoListEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.appBarTheme.backgroundColor,
        title: const Center(child: Text('Crypto currency app')),
      ),
      body: BlocBuilder<CryptoListBloc, CryptoListState>(
        bloc: _cryptoListBloc,
        builder: (context, state) {
          if(state is CryptoListLoadedState){
            return ListView.separated(
                  padding: const EdgeInsets.only(top: 16),
                  separatorBuilder: (context, i) => Divider(color: theme.dividerColor),
                  itemCount: state.coinList.length,
                  itemBuilder: (context, i) {
                  final coin =  state.coinList[i];
                  return CryptoCoinTile(coin: coin,);
                  }
              );
          }
          if(state is CryptoListErrorState){
            return const Center(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Something went wrong..."
                ),
                Text(
                  "Please try again later"
                )
              ],
            ));
          }
          return const Center(child: CircularProgressIndicator());
        },
      )
    );
  }
}
