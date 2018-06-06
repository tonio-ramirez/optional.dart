import 'package:optional/optional.dart';

void main() {
  final one = new Optional.of(1);
  final two = new Optional.of(2);
  final three = one + two;
  print(three.value); // prints "3"
  final six = three * two;
  print(six.value); // prints "6"
  final anotherSix = two * three;
  print(six == anotherSix); // prints "true"
  final negOne = -one;
  print(negOne.value); // prints "-1"
  final anEmpty = one + empty;
  print(anEmpty.isPresent); // prints "false"
}