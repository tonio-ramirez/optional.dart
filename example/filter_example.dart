import 'package:optional/optional.dart';

void main() {
  final hello = new Optional.of('hello');
  final world = new Optional.of('world');
  final name = new Optional.of('harry');

  for(var o in [hello, world, name]) {
    final filtered = o.filter((v) => v.startsWith('h'));
    print(filtered.isPresent);
  } // prints "true", "false", "true"
}