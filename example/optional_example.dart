import 'package:optional/optional.dart';

void main() {
  emptyExample();
  filterExample();
  ifPresentExample();
  mapExample();
  orElseExample();
  valueExample();
}

void emptyExample() {
  try {
    print(empty.value);
  } on NoValuePresentError catch (e) {
    print(e); // prints "Bad state: no value present"
  }

  try {
    print(new Optional.of(null));
  } on ArgumentError catch (e) {
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

void filterExample() {
  final hello = new Optional.of('hello');
  final world = new Optional.of('world');
  final name = new Optional.of('harry');

  for (var o in [hello, world, name]) {
    final filtered = o.filter((v) => v.startsWith('h'));
    print(filtered.isPresent);
  } // prints "true", "false", "true"
}

void ifPresentExample() {
  final string = new Optional.of('a string');
  empty.ifPresent(print); // does nothing
  string.ifPresent(print); // prints "a string"
}

void mapExample() {
  final helloWorld = new Optional.of('hello, world');
  final hello = helloWorld.map((s) => s.substring(0, 5));
  print(hello.value); // prints "hello"

  final one = new Optional.of(1);
  final two = one.map((v) => v + 1);
  print(two.value); // prints "2"

  final three = two.flatMap((v) => new Optional.of(v + 1));
  print(three.value); // prints "3"

  const anEmpty = const Optional.empty();
  var stillEmpty = anEmpty.map((v) => v + 1);
  print(stillEmpty.isPresent); // prints "false"

  stillEmpty = anEmpty.flatMap((v) => new Optional.of(v + 1));
  print(stillEmpty.isPresent); // prints "false"
}

void orElseExample() {
  print(empty.orElse(2)); // prints "2"
  print(empty.orElseGet(() => 2)); // prints "2"
  try {
    print(empty.orElseThrow(() => new ArgumentError('expected')));
  } on ArgumentError catch (e) {
    print(e); // prints "Invalid argument(s): expected"
  }

  final string = new Optional.of('a string');
  print(string.orElse('another string')); // prints "a string"
  print(string.orElseGet(() => 'another string')); // prints "a string"
  print(string.orElseThrow(
      () => new ArgumentError('unreachable'))); // prints "a string"
}

void valueExample() {
  final one = new Optional.of(1);

  print(one.value); // prints "1"
  try {
    print(empty.value); // throws NoValuePresentError
  } on NoValuePresentError catch (e) {
    print(e); // prints "Bad state: no value present"
  }
}
