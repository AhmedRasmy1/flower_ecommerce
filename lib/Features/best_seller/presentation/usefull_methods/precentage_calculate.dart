String percentageCalculate(num priceBeforeSale,num priceNow)
{
  num percentageOfPrice=((priceNow*100)/priceBeforeSale);
  num percentageOfDiscount=100-percentageOfPrice;
  int integerPercentageOfDiscount=percentageOfDiscount.toInt();

  String percentage=integerPercentageOfDiscount.toString();
   percentage= "$percentage %";
  return percentage;

}