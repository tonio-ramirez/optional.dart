import 'package:optional/optional.dart';

void main() {
  final helloWorld = new Optional.of("hello, world");
  final hello = helloWorld.map((s) => s.substring(0, 5));
  print(hello.value); // prints "hello"

  final one = new Optional.of(1);
  final two = one.map((v) => v + 1);
  print(two.value); // prints "2"

  final three = two.flatMap((v) => new Optional.of(v+1));
  print(three.value); // prints "3"

  final anEmpty = const Optional.empty();
  var stillEmpty = anEmpty.map((v) => v+1);
  print(stillEmpty.isPresent); // prints "false"

  stillEmpty = anEmpty.flatMap((v) => new Optional.of(v+1));
  print(stillEmpty.isPresent); // prints "false"
}