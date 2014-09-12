library optional_test;

import 'package:optional/optional.dart';
import 'package:unittest/unittest.dart';
import 'package:mock/mock.dart';

part 'src/operators.dart';
part 'src/methods.dart';

main() {
  groupSep = ': ';
  group("Methods", runMethodTests);
  group("Operators", runOperatorTests);
}
