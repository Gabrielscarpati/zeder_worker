import 'package:flutter/material.dart';
import 'package:zeder/design_system/design_system.dart';

class DSFutureBuilder<T> extends StatelessWidget {
  final Future<T> future;
  final String messageWhenEmpty;
  final Widget Function(BuildContext, AsyncSnapshot<T>) builder;
  final String error;
  final Widget reloadScreen;

  const DSFutureBuilder({
    Key? key,
    required this.future,
    required this.builder,
    required this.messageWhenEmpty,
    required this.error,
    required this.reloadScreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return _buildLoadingWidget();
        }
        else if (snapshot.connectionState == ConnectionState.none) {
          return _buildNoInternetWidget(context,reloadScreen);
        }
        else if (snapshot.hasData) {
          if(snapshot.data.toString() == 'no_internet'){
            return _buildNoInternetWidget(context,reloadScreen);
          }
          if (_isDataEmpty(snapshot.data)) {
            return Center(child: DSTextSubtitleBoldSecondary(text: messageWhenEmpty,));
          } else {
            return builder(context, snapshot);
          }
        }
        else if (snapshot.hasError) {
          print('RangeError (index): Invalid value: Valid value range is empty: 0');
          if('${snapshot.error}' == 'RangeError (index): Invalid value: Valid value range is empty: 0'){
            return Center(child: DSTextSubtitleBoldSecondary(text: messageWhenEmpty,));
          }
          else{
            return _buildNoInternetWidget(context,reloadScreen);
          }
        }
        else {
          return _buildNoInternetWidget(context,reloadScreen);
        }
      },
    );
  }

  bool _isDataEmpty(dynamic data) {
    if (data is Iterable) {
      return data.isEmpty;
    }
    return false;
  }

  Widget _buildLoadingWidget() {
    return const Center(child: SizedBox(height: 50, width: 50,child: CircularProgressIndicator()));
  }
}


Widget _buildNoInternetWidget(BuildContext context, Widget reloadScreen) {
  return Scaffold(
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Center(
          child: DSTextSubtitleBoldSecondary(
            text: 'Verifique sua conexão com a internet',
          ),
        ),
        const SizedBox(height: 20),
        DSButtonLargePrimary(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => reloadScreen),
            );
          },
          text: 'Tentar novamente',
        ),
      ],
    ),
  );
}
