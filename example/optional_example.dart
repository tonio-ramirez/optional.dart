import 'package:optional/optional.dart';

void main() {
  emptyExample();
  filterExample();
  ifPresentExample();
  mapExample();
  orElseExample();
  valueExample();
  extensionExample();
  asyncExample();
}

void emptyExample() {
  try {
    print(empty.value);
  } on NoValuePresentError catch (e) {
    print(e); // prints "Bad state: no value present"
  }

  try {
    print(Optional.of(null));
  } on ArgumentError catch (e) {
    print(e); // prints "Invalid argument(s): value must be non-null"
  }

  final anEmpty = Optional.ofNullable(null);
  print(anEmpty.isPresent); // prints "false"
  const anotherEmpty = Optional<dynamic>.empty();
  const yetAnotherEmpty = empty;
  print(anEmpty == anotherEmpty); // prints "true"
  print(anEmpty == yetAnotherEmpty); // prints "true"
  print(anotherEmpty == yetAnotherEmpty); // prints "true"
}

void filterExample() {
  final hello = Optional.of('hello');
  final world = Optional.of('world');
  final name = Optional.of('harry');

  for (var o in [hello, world, name]) {
    final filtered = o.filter((v) => v.startsWith('h'));
    print(filtered.isPresent);
  } // prints "true", "false", "true"
}

void ifPresentExample() {
  final string = Optional.of('a string');
  empty.ifPresent(print); // does nothing
  string.ifPresent(print); // prints "a string"
}

void mapExample() {
  final helloWorld = Optional.of('hello, world');
  final hello = helloWorld.map((s) => s.substring(0, 5));
  print(hello.value); // prints "hello"

  final one = Optional.of(1);
  final two = one.map((v) => v + 1);
  print(two.value); // prints "2"

  final three = two.flatMap((v) => Optional.of(v + 1));
  print(three.value); // prints "3"

  const anEmpty = Optional<int>.empty();
  var stillEmpty = anEmpty.map((v) => v + 1);
  print(stillEmpty.isPresent); // prints "false"

  stillEmpty = anEmpty.flatMap((v) => Optional.of(v + 1));
  print(stillEmpty.isPresent); // prints "false"
}

void orElseExample() {
  print(empty.orElse(2)); // prints "2"
  print(empty.orElseGet(() => 2)); // prints "2"
  try {
    print(empty.orElseThrow(() => ArgumentError('expected')));
  } on ArgumentError catch (e) {
    print(e); // prints "Invalid argument(s): expected"
  }

  final string = Optional.of('a string');
  print(string.orElse('another string')); // prints "a string"
  print(string.orElseGet(() => 'another string')); // prints "a string"
  print(string
      .orElseThrow(() => ArgumentError('unreachable'))); // prints "a string"
}

void valueExample() {
  final one = Optional.of(1);

  print(one.value); // prints "1"
  try {
    print(empty.value); // throws NoValuePresentError
  } on NoValuePresentError catch (e) {
    print(e); // prints "Bad state: no value present"
  }
}

void extensionExample() {
  final one = 1.toOptional;
  print(one.value); // prints "1"
  print(null.toOptional.isPresent); // prints "false"
}

Future<Optional<int>> emptyFuture() {
  return Future.value(Optional.empty());
}

Future<int> intFuture(int val) {
  return Future.value(val);
}

void asyncExample() async {
  final e = await emptyFuture();
  var i = e.orElseGet(() => intFuture(1));
  print(await i); // prints "1"
  i = e.orElse(intFuture(2));
  print(await i); // prints "2"
}
