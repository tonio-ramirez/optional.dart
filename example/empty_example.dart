import 'package:optional/optional.dart';

void main() {
  try {
    print(empty.value);
  } on NoValuePresentError catch(e) {
    print(e); // prints "Bad state: no value present"
  }

  try {
    print(new Optional.of(null));
  } on ArgumentError catch(e) {
    print(e); // prints "Invalid argument(s): value must be non-null"
  }

  final anEmpty = new Optional.ofNullable(null);
  print(anEmpty.isPresent); // prints "false"
  const anotherEmpty = const Optional.empty();
  const yetAnotherEmpty = empty;
  print(anEmpty == anotherEmpty); // prints "true"
  print(anEmpty == yetAnotherEmpty); // prints "true"
  print(anotherEmpty == yetAnotherEmpty); // prints "true"
}