import 'package:optional/optional.dart';

main() {
  var one = new Optional.of(1);
  var two = new Optional.of(2);
  var three = one + two;
  print(three.value); // prints "3"
  var six = three * two;
  print(six.value); // prints "6"
  var anotherSix = two * three;
  print(six == anotherSix); // prints "true"
//  var negOne = -one;
//  print(negOne.value); // prints "-1"
//  var empty = one + EMPTY;
//  print(empty.isPresent); // prints "false"
}