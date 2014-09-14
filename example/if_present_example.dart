import 'package:optional/optional.dart';

main() {
  var string = new Optional.of("a string");
  EMPTY.ifPresent(print); // does nothing
  string.ifPresent(print); // prints "a string"
}