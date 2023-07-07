import 'package:flutter/material.dart';
import 'package:zeder/design_system/design_system.dart';

class DSFutureBuilder<T> extends StatelessWidget {
  final Future<T> future;
  final String messageWhenEmpty;
  final Widget Function(BuildContext, AsyncSnapshot<T>) builder;
  final String error;

  const DSFutureBuilder({
    Key? key,
    required this.future,
    required this.builder,
    required this.messageWhenEmpty,
    required this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return _buildLoadingWidget();
        } else if (snapshot.hasError) {
          return _buildErrorWidget();
        } else if (snapshot.hasData) {
          if (_isDataEmpty(snapshot.data)) {
            return Center(child: Text(messageWhenEmpty));
          } else {
            return builder(context, snapshot);
          }
        } else {
          return Text('No data available');
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
    return Center(child: Container(height: 50, width: 50,child: const CircularProgressIndicator()));
  }

  Widget _buildErrorWidget() {
    return Center(
      child: DSTextTitleBoldSecondary(text: 'Error: $error',),
    );
  }
}
