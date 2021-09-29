class Utils {
  String stringSinSimbolos(String text) {
    return text.replaceAll(RegExp(r'[^\w\s/^A/]+'), '');
  }
}
