String currency(num price) {
  final String reversed = price.toString().split("").reversed.join();
  String reverseC = "";
  int step = 0;

  for (int i = 0; i < reversed.length; i++) {
    reverseC += reversed[i];
    if (reversed.length > 3) {
      if (step == 2) {
        reverseC += ".";
      }
      step += 1;
      if (step == 3) {
        step = 0;
      }
    }
  }
  String currency = reverseC.split("").reversed.join();
  if (currency[0] == ".") {
    currency = currency.substring(1);
  }
  return currency;
}
