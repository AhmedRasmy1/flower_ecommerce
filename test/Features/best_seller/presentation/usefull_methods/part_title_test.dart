import 'package:flower_ecommerce/Features/best_seller/presentation/usefull_methods/part_title.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("test get first part of title", () {
    test("when call part_title and title is empty ", () {
      String emptyString = "";
      var actual = getTitlePart(emptyString);
      expect(actual, "");
    });
    test("when call part_title and title is one part part only ", () {
      String oneEvent = "Wedding celebration";
      var actual = getTitlePart(oneEvent);
      expect(actual, oneEvent);
    });
    test("when call part_title and title is two part part only ", () {
      String event = "Wedding celebration|another event";
      var actual = getTitlePart(event);
      expect(actual, "Wedding celebration");
    });
    test("when call part_title and title is more than two part part only ", () {
      String event = "Wedding celebration|another event|another event";
      var actual = getTitlePart(event);
      expect(actual, "Wedding celebration");
    });
  });
}
