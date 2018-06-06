library optional_test;

import 'package:test/test.dart';
import 'package:optional/optional.dart';

part 'src/operators.dart';
part 'src/methods.dart';

main() {
  group("Methods", runMethodTests);
  group("Operators", runOperatorTests);
}
