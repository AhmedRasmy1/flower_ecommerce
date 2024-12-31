String percentageCalculate(num priceBeforeSale, num priceNow) {
  if (priceBeforeSale == 0 && priceNow != 0) {
    return "0 %";
  } else if (priceNow == 0) {
    return "100 %";
  } else {
    num percentageOfPrice = ((priceNow * 100) / priceBeforeSale);
    num percentageOfDiscount = 100 - percentageOfPrice;
    int integerPercentageOfDiscount = percentageOfDiscount.toInt();
    String percentage = integerPercentageOfDiscount.toString();
    percentage = "$percentage %";
    return percentage;
  }
}
