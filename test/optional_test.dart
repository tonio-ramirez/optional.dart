library optional_test;

import 'package:optional/optional.dart';
import 'package:unittest/unittest.dart';
import 'package:mock/mock.dart';

part 'src/operator_tests.dart';
part 'src/method_tests.dart';

main() {
  groupSep = ': ';
  group("Methods", runMethodTests);
  group("Operators", runOperatorTests);
}