import 'package:optional/optional.dart';

main() {
  try {
    print(Optional.EMPTY.value);
  } on NoValuePresentError catch(e) {
    print(e); // prints "Bad state: no value present"
  }

  try {
    print(new Optional.of(null));
  } on ArgumentError catch(e) {
    print(e); // prints "Illegal argument(s): value must be non-null"
  }

  var empty = new Optional.ofNullable(null);
  print(empty.isPresent); // prints "false"
  var anotherEmpty = new Optional.empty();
  var yetAnotherEmpty = Optional.EMPTY;
  print(empty == anotherEmpty); // prints "true"
  print(empty == yetAnotherEmpty); // prints "true"
  print(anotherEmpty == yetAnotherEmpty); // prints "true"
}