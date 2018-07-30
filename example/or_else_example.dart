import 'package:optional/optional.dart';

void main() {
  print(empty.orElse(2)); // prints "2"
  print(empty.orElseGet(() => 2)); // prints "2"
  try {
    print(empty.orElseThrow(() => new ArgumentError('expected')));
  } on ArgumentError catch(e) {
    print(e); // prints "Invalid argument(s): expected"
  }

  final string = new Optional.of('a string');
  print(string.orElse('another string')); // prints "a string"
  print(string.orElseGet(() => 'another string')); // prints "a string"
  print(string.orElseThrow(() => new ArgumentError('unreachable'))); // prints "a string"
}