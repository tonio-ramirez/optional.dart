import 'package:optional/optional.dart';

main() {
  var one = new Optional.of(1);
  var empty = Optional.EMPTY;

  print(one.value); // prints "1"
  try {
    print(empty.value); // throws NoValuePresentError
  } on NoValuePresentError catch(e) {
    print(e); // prints "Bad state: no value present"
  }
}

