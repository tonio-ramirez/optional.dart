import 'package:optional/optional.dart';

void main() {
  final one = new Optional.of(1);

  print(one.value); // prints "1"
  try {
    print(empty.value); // throws NoValuePresentError
  } on NoValuePresentError catch(e) {
    print(e); // prints "Bad state: no value present"
  }
}

