class DoubleUtil {
  static double toDoubleDefaultZero(dynamic value) {
    if (value is double) return value;
    return double.tryParse(value.toString()) ?? 0;
  }
}

extension DoubleUtils on double {
  String get asCurrency {
    return 'R\$${toStringAsFixed(2)}';
  }

  String get asCurrencyWithNoDecimal {
    return 'R\$${toInt()}';
  }
}
