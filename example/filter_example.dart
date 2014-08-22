import 'package:optional/optional.dart';

main() {
  var hello = new Optional.of("hello");
  var world = new Optional.of("world");
  var name = new Optional.of("harry");

  var opts = [hello, world, name];
  opts.forEach((o) {
    var filtered = o.filter((v) => v.startsWith('h'));
    print(filtered.isPresent);
  }); // prints "true", "false", "true"
}