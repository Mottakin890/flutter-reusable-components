class RegEx {
  static RegExp emailRegEx = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
  static RegExp digitRegEx = RegExp(r'^[0-9]+$');
  static RegExp alphabetRegEx = RegExp(r'^[a-z A-Z]+$');
  static RegExp webUrlRegEx = RegExp(r'^(https?:\/\/)?([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,}(:\d+)?(\/[^\s]*)?$');
  static RegExp emojiRegex = RegExp(
    r'(\p{Emoji_Presentation}|\p{Emoji}\uFE0F|\p{Emoji_Modifier_Base}\p{Emoji_Modifier}|\p{Emoji}(?:\u200D\p{Emoji})+)',
    unicode: true,
  );
  static RegExp doubleRegEx = RegExp(r'^\d+(\.\d{0,2})?$');
  static RegExp slashRegEx = RegExp(r'\/');
}