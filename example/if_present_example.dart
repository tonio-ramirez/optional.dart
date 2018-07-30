import 'package:optional/optional.dart';

void main() {
  final string = new Optional.of('a string');
  empty.ifPresent(print); // does nothing
  string.ifPresent(print); // prints "a string"
}