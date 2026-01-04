import 'package:flutter/services.dart';

class MaxDigitTextFormatter extends TextInputFormatter {
  final int max;

  MaxDigitTextFormatter(this.max);

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) return newValue;
    double? value = double.tryParse(newValue.text);
    if (value == null || value > max) return oldValue;
    return newValue;
  }
}