import 'package:flower_ecommerce/Features/best_seller/presentation/usefull_methods/precentage_calculate.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('percentageCalculate Tests', () {
    test(
        'should return correct percentage when priceNow is less than priceBeforeSale',
        () {
      // Arrange
      num priceBeforeSale = 200;
      num priceNow = 150;

      // Act
      String result = percentageCalculate(priceBeforeSale, priceNow);

      // Assert
      expect(result, '25 %');
    });
    test('should return 0% discount when priceNow equals priceBeforeSale', () {
      // Arrange
      num priceBeforeSale = 100;
      num priceNow = 100;

      // Act
      String result = percentageCalculate(priceBeforeSale, priceNow);

      // Assert
      expect(result, '0 %');
    });
    test('should return 100% discount when priceNow is 0', () {
      // Arrange
      num priceBeforeSale = 250;
      num priceNow = 0;

      // Act
      String result = percentageCalculate(priceBeforeSale, priceNow);

      // Assert
      expect(result, '100 %');
    });
    test('should handle decimal values correctly', () {
      // Arrange
      num priceBeforeSale = 300;
      num priceNow = 225;

      // Act
      String result = percentageCalculate(priceBeforeSale, priceNow);

      // Assert
      expect(result, '25 %');
    });
    test('should throw an error when priceBeforeSale is 0', () {
      // Arrange
      num priceBeforeSale = 0;
      num priceNow = 100;
      // Act
      String result = percentageCalculate(priceBeforeSale, priceNow);

      // Assert
      expect(result, '0 %');
    });
    test('should return 100% discount when both prices are 0', () {
      // Arrange
      num priceBeforeSale = 0;
      num priceNow = 0;

      // Act
      String result = percentageCalculate(priceBeforeSale, priceNow);

      // Assert
      expect(result, '100 %');
    });
  });
}
