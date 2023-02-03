import 'dart:math';

String generateRandomString (
    {
      int size = 12,
      bool useLetters = true,
      bool useCapitalLetters = true,
      bool useSymbols = true,
      bool useNumbers = true
    }) {

  var randomString = '';
  var random = Random();

  var letters = 'abcdefghijklmnopqrstuvwxyz';
  var capitalLetters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  var symbols = '!@#\$%&*()_+-=[]{}|;:",.<>/?'; //'!@#\$%^&*()_+-=[]{}|;:\'",.<>/?'
  var numbers = '0123456789';

  String charSet = '';

  if (useLetters) {
    charSet += letters;
  }
  if (useCapitalLetters) {
    charSet += capitalLetters;
  }
  if (useSymbols) {
    charSet += symbols;
  }
  if (useNumbers) {
    charSet += numbers;
  }

  for (var i = 0; i < size; i++) {
    randomString += charSet[random.nextInt(charSet.length)];
  }
  return randomString;
}