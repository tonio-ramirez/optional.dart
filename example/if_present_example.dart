import 'package:optional/optional.dart';

main() {
  var empty = Optional.EMPTY;
  var string = new Optional.of("a string");
  empty.ifPresent(print); // does nothing
  string.ifPresent(print); // prints "a string"
}