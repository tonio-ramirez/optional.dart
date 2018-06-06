library optional_test;

import 'package:optional/optional.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';

part 'src/operators.dart';
part 'src/methods.dart';

// ignore: type_annotate_public_apis
main() {
  group("Methods", runMethodTests);
  group("Operators", runOperatorTests);
}
