/// Utility for formatting currency values.
abstract final class CurrencyFormatter {
  CurrencyFormatter._();

  /// Formats a number with space as thousands separator.
  /// Example: 18199.24 -> "18 199.24"
  static String format(double value, {int fractionDigits = 2}) {
    final parts = value.toStringAsFixed(fractionDigits).split('.');
    final integerPart = parts[0].replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]} ',
    ).trimRight();
    final decimalPart = parts.length > 1 ? parts[1] : '';
    return decimalPart.isNotEmpty ? '$integerPart.$decimalPart' : integerPart;
  }

  /// Formats balance with currency symbol prefix.
  /// Example: 18199.24, "USD" -> "\$18 199.24"
  static String formatBalance(double value, String currencyCode) {
    final symbol = symbolFor(currencyCode);
    return '$symbol${format(value)}';
  }

  /// Returns the currency symbol for the given code. Use for custom layout (e.g. small top-aligned symbol).
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
}
