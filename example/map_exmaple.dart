import 'package:optional/optional.dart';

main() {
  var helloWorld = new Optional.of("hello, world");
  var hello = helloWorld.map((s) => s.substring(0, 5));
  print(hello.value); // prints "hello"

  var one = new Optional.of(1);
  var two = one.map((v) => v + 1);
  print(two.value); // prints "2"

  var three = two.flatMap((v) => new Optional.of(v+1));
  print(three.value); // prints "3"

  var empty = new Optional.empty();
  var stillEmpty = empty.map((v) => v+1);
  print(stillEmpty.isPresent); // prints "false"

  stillEmpty = empty.flatMap((v) => new Optional.of(v+1));
  print(stillEmpty.isPresent); // prints "false"
}