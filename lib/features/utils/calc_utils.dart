double cutPrice({required double price}){
  double shortPrice = price;
  if (shortPrice > 0.01){
    shortPrice = double.parse(shortPrice.toStringAsFixed(3));
  } else if (shortPrice > 0.001 && shortPrice < 0.01) {
    shortPrice = double.parse(shortPrice.toStringAsFixed(4));
  } else if (shortPrice > 0.0001 && shortPrice < 0.001) {
    shortPrice = double.parse(shortPrice.toStringAsFixed(5));
  } else if (shortPrice > 0.00001 && shortPrice < 0.0001) {
    shortPrice = double.parse(shortPrice.toStringAsFixed(6));
  } else if (shortPrice > 0.000001 && shortPrice < 0.00001) {
    shortPrice = double.parse(shortPrice.toStringAsFixed(7));
  } else if (shortPrice > 0.0000001 && shortPrice < 0.000001) {
    shortPrice = double.parse(shortPrice.toStringAsFixed(8));
  } else if (shortPrice > 0.00000001 && shortPrice < 0.0000001) {
    shortPrice = double.parse(shortPrice.toStringAsFixed(9));
  } else if (shortPrice > 0.000000001 && shortPrice < 0.00000001) {
    shortPrice = double.parse(shortPrice.toStringAsFixed(10));
  } else if (shortPrice > 0.0000000001 && shortPrice < 0.000000001) {
    shortPrice = double.parse(shortPrice.toStringAsFixed(11));
  } else {
    shortPrice = double.parse(shortPrice.toStringAsFixed(12));
  }
  return shortPrice;
}