abstract final class CurrencyFormatter {
  CurrencyFormatter._();

  static String format(double value, {int fractionDigits = 2}) {
    final parts = value.toStringAsFixed(fractionDigits).split('.');
    final integerPart = parts[0].replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]} ',
    ).trimRight();
    final decimalPart = parts.length > 1 ? parts[1] : '';
    return decimalPart.isNotEmpty ? '$integerPart.$decimalPart' : integerPart;
  }

  static String formatBalance(double value, String currencyCode) {
    final symbol = symbolFor(currencyCode);
    return '$symbol${format(value)}';
  }

  static String symbolFor(String code) {
    switch (code.toUpperCase()) {
      case 'USD':
        return '\$';
      case 'EUR':
        return '€ ';
      case 'GBP':
        return '£ ';
      default:
        return '$code ';
    }
  }

  static String labelFor(String code) {
    switch (code.toUpperCase()) {
      case 'USD':
        return 'USD - Dollar';
      case 'EUR':
        return 'EUR - Euro';
      case 'GBP':
        return 'GBP - Pound';
      default:
        return code;
    }
  }
}
